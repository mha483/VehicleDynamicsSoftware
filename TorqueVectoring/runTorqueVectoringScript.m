% Script to run torque vectoring algorithm

% Max Harrison

% clear, clc

%% DEFINING CONSTANTS/PARAMETERS

Rd      = 0.2;      % Wheel Radius, m
tr      = 1.1;      % Rear track width, m (Initial algorithm only uses rear wheelbase)
lambda  = 0.5;      % proportion of torque vectoring torques sent to front axle

ref_slip = 0.11;    % ideal longitudinal tyre slip ratio for wheel slip controller

%% CONTROLLER GAINS
% Yaw rate controller
Kp_yawController = 10;
Ki_yawController = 0.1;
Kd_yawController = 0;

% Wheel slip controller
Kp_wheelSlip = 10;
Ki_wheelSlip = 0.1;
Kd_wheelSlip = 0;

%% CREATING TEST DATA
% Input data is reference yaw rate

len = 10;      % legth of input data, seconds
rate = 10;     % data rate of input data, Hz

% current dimensions of steering nput signal is desired yaw rate, rad/s
steering_input = [zeros(len*rate/2,1); 2.5*ones(len*rate/2,1)]; 

simin.time = 0:1/rate:len*rate;
simin.signal.values = steering_input;

