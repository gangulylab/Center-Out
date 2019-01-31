function UpdateCursor(Params,Neuro)
% UpdateCursor(Params,dt,newpos,targetvec)
% Updates the state of the cursor using the method in Params.ControlMode
%   1 - position control
%   2 - velocity control
%   3 - kalman filter  velocity
% 
% Cursor - structure with position parameters
% targetvec - used if assistance is on. targetvec is axis optimal axis.
%   assistance limits movement off that axis

global Cursor

% find vx and vy using control scheme
switch Cursor.ControlMode,
    case 1, % Move to Mouse
        [x,y] = GetMouse();
        vx = (x - Params.Center(1) - Cursor.State(1));
        vy = (y - Params.Center(2) - Cursor.State(2));
        Cursor.State(3) = vx;
        Cursor.State(4) = vy;
        
    case 2, % Use Mouse Position as a Velocity Input (Center-Joystick)
        [x,y] = GetMouse();
        vx = Params.Gain * (x - Params.Center(1));
        vy = Params.Gain * (y - Params.Center(2));
        Cursor.State(3) = vx;
        Cursor.State(4) = vy;
        
    case 3, % Kalman Filter Velocity Input
        K = (Cursor.P * Neuro.C')/(Neuro.C * Cursor.P*Neuro.C' + Neuro.Q);
        Cursor.State = Cursor.State + K*(Neuro.NeuralFeatures - Neuro.C * Cursor.State);
        Cursor.P = Cursor.P - K*Cursor.C * Cursor.P;
        
    case 4,
end

end % UpdateCursor