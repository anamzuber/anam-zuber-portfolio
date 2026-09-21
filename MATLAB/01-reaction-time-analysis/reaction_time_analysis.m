%% Reaction Time Data Analysis
% Educational project using simulated cognitive-task data.
% This project demonstrates basic MATLAB data analysis and visualization.

clear;
clc;
close all;

%% Simulated reaction-time data
% Reaction times are in milliseconds.

condition_A = [512 487 530 495 521 508 476 550 503 489 ...
               515 527 498 506 540 482 519 501 493 528];

condition_B = [575 548 590 561 583 552 610 570 559 545 ...
               578 601 565 550 587 572 558 595 563 580];

%% Descriptive statistics

mean_A = mean(condition_A);
median_A = median(condition_A);
sd_A = std(condition_A);

mean_B = mean(condition_B);
median_B = median(condition_B);
sd_B = std(condition_B);

fprintf('Condition A\n');
fprintf('Mean: %.2f ms\n', mean_A);
fprintf('Median: %.2f ms\n', median_A);
fprintf('SD: %.2f ms\n\n', sd_A);

fprintf('Condition B\n');
fprintf('Mean: %.2f ms\n', mean_B);
fprintf('Median: %.2f ms\n', median_B);
fprintf('SD: %.2f ms\n\n', sd_B);

%% Compare mean reaction times

difference = mean_B - mean_A;

fprintf('Mean difference (B - A): %.2f ms\n', difference);

%% Identify unusually slow responses
% Here we use mean + 2 SD as a simple educational threshold.

threshold_A = mean_A + 2 * sd_A;
threshold_B = mean_B + 2 * sd_B;

slow_A = condition_A(condition_A > threshold_A);
slow_B = condition_B(condition_B > threshold_B);

fprintf('\nUnusually slow responses:\n');
fprintf('Condition A: %d\n', length(slow_A));
fprintf('Condition B: %d\n', length(slow_B));

%% Visualization

figure;

boxplot([condition_A condition_B], ...
        'Labels', {'Condition A', 'Condition B'});

ylabel('Reaction Time (ms)');
title('Simulated Reaction-Time Distributions');
grid on;

%% End of analysis
