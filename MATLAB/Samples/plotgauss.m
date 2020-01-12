%% Weyl-Heisenberg Bases Toolbox
% Script "plotgauss.m"
%% Description:
% Implements a discretization of a truncated Gaussian function and plots 2d graph.
%
%% Input
N     = input('Number of samples = ');
sigma = input('Standard deviation = ');

%% Discretization
g0 = discret(sigma, N);

%% Plotting
figure(1)
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultTextFontSize',11,'DefaultAxesFontName','Times New Roman'); 

plot(g0, 'k','linewidth',2);
grid on;
title('Truncated Gaussian function');
ylabel('Amplitude');
xlabel('Samples, n');