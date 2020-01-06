%% Weyl-Heisenberg Bases Toolbox
% Script "plotgauss3.m"
%% Description:
% Implements a discretization of a truncated Gaussian function and plots 3d graph.
%
%% Input
N     = input('Number of samples = ');
sigma = input('Standard deviation = ');

%% Discretization
g0 = discret(sigma, N);

%% 3d mesh
maximum = max(g0);
Z = g0' * g0./ maximum;
S = 1:N;

%% Plotting
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman');
figure(1);
surf(S,S,real(Z));
shading interp;
title('Truncated Gaussian function');
ylabel('Samples, n');
xlabel('Samples, n');
zlabel('Amplitude');