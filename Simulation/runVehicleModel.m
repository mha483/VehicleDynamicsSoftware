function [state] = runVehicleModel(torques, delta, state, properties, dt)
%Runs Vehicle Model and updates the state
%   dt = sampling interval
%   torques = struct with fields LF, RF, LR, RR, in Nm
%   delta = front wheel steering angle (left is positive, in rads)
%   'state' should be a struct with the following fields, in m or m/s:
%        body_xd (body frame)
%        body_yd
%        iner_xd (inertial frame)
%        iner_yd
%        iner_x
%        iner_y
%        psi
%        psid

T_LF = torques.LF;
T_RF = torques.RF;
T_LR = torques.LR;
T_RR = torques.RR;

xd          = state.body_xd;
Xd          = state.iner_xd;
X           = state.iner_x;
yd          = state.body_yd;
Yd          = state.iner_yd;
Y           = state.iner_y;
psi         = state.iner_psi;
psid        = state.iner_psid;

R   = properties.tire_radius;
t   = properties.track_width;
l   = properties.wheelbase;
m   = properties.mass;
Iz  = properties.Iz;

% Calculating geometries
h = sqrt(t^2+l^2)/2;
theta1 = atan(l/t);
theta2 = atan(t/l);

% Evaluate forces
Fx = R*(T_LR+T_RR) + R*cos(delta)*(T_LF+T_RF) - 2*Flat_f*sin(delta);
Fy = 2*Flat_r + 2*Flat_f*cos(delta);
Mz = (T_RR-T_FR)*R*t/2 - 2*Flat_r*l/2 ... % rear wheels
    + T_RF*R*h*sin(theta1+delta) + Flat_f*R*h*sin(theta2-delta) ... % RF
    + T_LF*R*h*sin(theta1-delta) + Flat_f*R*h*sin(theta2+delta);    % LF 

% Define differential equations
xdd =  psid*yd + Fx/m;
ydd = -psid*xd + Fy/m;
psidd = Mz/Iz;

% Update velocities using diff equations, discretized with Eular's method
% Body frame
xd = xd + xdd * dt;
yd = yd + ydd * dt;
psid = psid + psidd * dt;

% Inertial frame
Xd = xd*cos(psi) - yd*sin(psi);
Yd = xd*sin(psi) + yd*cos(psi);

X = X + Xd * dt;
Y = Y + Yd * dt;

% Assign return values
state.body_xd   = xd;
state.iner_xd   = Xd;
state.iner_x    = X;
state.body_yd   = yd;
state.iner_yd   = Yd;
state.iner_y    = Y;
state.psi       = psi;
state.psid      = psid;
end

