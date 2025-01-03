clear;clc;

% Sample rate in sec.
h = 0.1;

% Experiment duration in sec. 
% (don't forget to change this in your diagram, see video)
Tsim = 200;

% Time vector (don't forget to transpose with ')
t = [0:h:Tsim]';

% Input vector
amplitude1 = -0.2;
amplitude2 = 0;
omega = 1;
% u = amplitude * sin(omega * t);
u=[amplitude1*ones(size(t)) amplitude2*ones(size(t))];
% u=[amplitude1*sin(omega*t) amplitude2*ones(size(t))];

% Variable that goes to Simulink
% (First column: time, Second column: input values)
simin = [t, u]

%% Start experiment
sim helicoptertemplate

%% Collect output data
% (make sure that samples are taken every 'h' seconds! in 'To Workspace' block)

% If output type 'Timeseries'
output = simout.Data;
data.input_seq=input.Data;
data.alpha1=alpha.Data;
data.alphad=alpha_dot.Data;



% If output type 'Array' 
% y = simout;

%% Plot data
th1 = output(:, 1);
th2 = output(:, 2)/370;
th3 = output(:, 3);
th4 = output(:, 4);


% figure()
% plot(t,th1)
% hold on;
% plot(t,u(:,1))

% legend('\alpha')

% save ("data6.mat","-struct","data")