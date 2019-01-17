function ExperimentPause(Params)
% Display text then wait for subject to resume experiment

% Pause Screen
tex = 'Paused... Press ''p'' to continue or ''escape'' to quit';
DrawFormattedText(Params.WPTR, tex,'center','center',255);
Screen('Flip', Params.WPTR);

KbCheck;
WaitSecs(.1);
while 1, % pause until subject presses p again or quits
    [~, ~, keyCode, ~] = KbCheck;
    if keyCode(KbName('p'))==1,
        keyCode(KbName('p'))=0; % set to 0 to avoid multiple pauses in a row
        fprintf('\b') % remove input keys
        break;
    end
    if keyCode(KbName('escape'))==1 || keyCode(KbName('q'))==1,
        ExperimentStop(1); % quit experiment
    end
end

Screen('Flip', Params.WPTR);
WaitSecs(.1);

end % ExperimentPause