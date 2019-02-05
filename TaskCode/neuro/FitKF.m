function KF = FitKF(datadir,fitFlag,KF,TrialBatch)
% function KF = FitKF(datadir,fitFlag,KF,TrialBatch)
% Uses all trials in given data directory to initialize matrices for kalman
% filter. Returns KF structure containing matrices: C,Q
% 
% datadir - directory containing trials to fit data on
% fitFlag - 0-fit on actual state,
%           1-fit on intended kinematics (refit algorithm)
%           2-fit on intended kinematics (smoothbatch algorithm)
% KF - kalman filter structure containing matrices: C,Q
% TrialBatch - cell array of filenames w/ trials to use in smooth batch

% grab data trial data
datafiles = dir(fullfile(datadir,'Data*.mat'));
if fitFlag==2, % if smooth batch, only use files TrialBatch
    names = {datafiles.name};
    idx = zeros(1,length(names))==1;
    for i=1:length(TrialBatch),
        idx = idx | strcmp(names,TrialBatch{i});
    end
    datafiles = datafiles(idx);
end

Tfull = [];
Xfull = [];
Y = [];
T = [];
for i=1:length(datafiles),
    % load data, grab cursor pos and time
    load(fullfile(datadir,datafiles(i).name)) %#ok<LOAD>
    Tfull = cat(2,Tfull,TrialData.Time);
    if fitFlag==0, % fit on true kinematics
        Xfull = cat(2,Xfull,TrialData.CursorState);
    else, % refit on intended kinematics
        Xfull = cat(2,Xfull,TrialData.IntendedCursorState);
    end
    T = cat(2,T,TrialData.NeuralTime);
    Y = cat(2,Y,TrialData.NeuralFeatures{:});
end

% interpolate to get cursor pos and vel at neural times
X = interp1(Tfull',Xfull',T')';

% full cursor state at neural times
D = size(X,2);

% fit kalman matrices
C = (Y*X') / (X*X');
Q = (1/D) * ((Y-C*X) * (Y-C*X)');

% update kalman matrices
switch fitFlag,
    case {0,1},
        KF.C = C;
        KF.Q = Q;
    case 2,
        alpha = Params.SmoothBatchAlpha;
        KF.C = alpha*KF.C + (1-alpha)*C;
        KF.Q = alpha*KF.Q + (1-alpha)*Q;
end

end % FitKF