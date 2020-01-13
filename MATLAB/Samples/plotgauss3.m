%% Weyl-Heisenberg Bases Toolbox
% Script "plotgauss3.m"
%% Description:
% Implements a discretization of a truncated Gaussian function and plots 3d graph.
%
%% Input
N     = input('Number of samples = ');
sigma = input('Standard deviation = ');

%% Discretization
g = gaussian(N, sigma);

%% 3d mesh
maximum = max(g);
Z = g' * g./ maximum;
S = 1:N;

%% Plotting
figure(1);
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

surf(S,S,real(Z));
shading interp;
title('Truncated Gaussian function');
ylabel('Samples, n');
xlabel('Samples, n');
zlabel('Amplitude');