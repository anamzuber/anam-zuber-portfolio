%% Introductory fMRI GLM Simulation
% Educational demonstration using simulated data.
% No real neuroimaging data are used.

clear;
clc;
close all;

%% Simulation parameters

TR = 2;                 % Repetition time (seconds)
n_scans = 150;          % Number of simulated volumes
time = (0:n_scans-1) * TR;

%% Create a simple task paradigm

task = zeros(1, n_scans);

% Simulated task blocks
task(11:20)   = 1;
task(41:50)   = 1;
task(71:80)   = 1;
task(101:110) = 1;
task(131:140) = 1;

%% Create a simple HRF

hrf_time = 0:TR:30;

hrf = (hrf_time.^8 .* exp(-hrf_time/1.2));
hrf = hrf / max(hrf);

%% Convolve task with HRF

task_regressor = conv(task, hrf);
task_regressor = task_regressor(1:n_scans);

task_regressor = task_regressor / max(task_regressor);

%% Simulate a BOLD time series

true_beta = 1.5;

rng(1);
noise = 0.25 * randn(1, n_scans);

bold_signal = true_beta * task_regressor + noise;

%% Construct the GLM design matrix

X = [ones(n_scans,1), task_regressor'];

%% Estimate GLM coefficients

beta_hat = X \ bold_signal';

intercept_beta = beta_hat(1);
task_beta = beta_hat(2);

fprintf('Estimated intercept: %.3f\n', intercept_beta);
fprintf('Estimated task beta: %.3f\n', task_beta);

%% Predicted BOLD response

predicted_bold = X * beta_hat;

%% Visualize the simulation

figure;

plot(time, bold_signal, 'k');
hold on;
plot(time, predicted_bold, 'LineWidth', 2);

xlabel('Time (s)');
ylabel('Simulated BOLD Signal');
title('Simulated fMRI GLM: Observed and Predicted BOLD Signal');

legend('Simulated BOLD', 'GLM Prediction');
grid on;

%% End of simulation
