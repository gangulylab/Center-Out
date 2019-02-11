function KF = UpdateRmlKF(KF,X,Y)
% function KF = UpdateRmlKF(KF,X,Y)
% updates kalman filter for each iteration
% follows eqs in Dangi et al., Neural Computation (2014)
% 
% KF - structure w/ kalman filter matrices A,W,P,C,Q and extras for
%   implementing in real time R,S,T,ESS,Tinv,Qinv,Lambda
% X - intended kinematics vector
% Y - neural features vector

% copy structs to vars for better legibility
R       = KF.R;
S       = KF.S;
T       = KF.T;
Tinv    = KF.Tinv;
ESS     = KF.ESS;
Lambda  = KF.CLDA.Lambda;

% update sufficient stats & half life
R  = Lambda*R  + X*X';
S  = Lambda*S  + Y*X';
T  = Lambda*T  + Y*Y';
ESS= Lambda*ESS+ 1;

% update inverses
Tinv = Tinv/Lambda + (Tinv*(Y*Y')*Tinv)/(Lambda*(Lambda + Y'*Tinv*Y)); % ~35ms
Qinv = ESS * (Tinv - Tinv*S/(S'*Tinv*S - R)*S'*Tinv); % ~15ms

% update kalman matrices (neural mapping matrices)
C = S/R;
Q = (1/ESS) * (T - C*S');

% store params
KF.R    = R;
KF.S    = S;
KF.T    = T;
KF.C    = C;
KF.Q    = Q;
KF.Tinv = Tinv;
KF.Qinv = Qinv;
KF.ESS  = ESS;
KF.Lambda = Lambda + KF.CLDA.DeltaLambda;

end % UpdateRmlKF