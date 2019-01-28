function Neuro = RunImaginedTask(Params,Neuro)
% Explains the task to the subject, and serves as a reminder for pausing
% and quitting the experiment (w/o killing matlab or something)
Instructions = [...
    '\n\nImagined Cursor Control\n\n'...
    'Imagine moving a mouse with your hand to move the\n'...
    'into the targets.\n'...
    '\nAt any time, you can press ''p'' to briefly pause the task.'...
    '\n\nPress the ''Space Bar'' to begin!' ];

InstructionScreen(Params,Instructions);
Neuro = RunImaginedLoop(Params,Neuro);

end % RunImaginedTask