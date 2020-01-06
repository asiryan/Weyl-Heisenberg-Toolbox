%% Weyl-Heisenberg Bases Toolbox
% Function "discret.m"
%% Description:
% Truncated Gaussian discretization for N number of samples.
%% Notation:
% Gaussian shape depends on value of standard deviation.
%
%% Input:
% sigma - standard deviation,
% N - samples.
%
%% Output:
% g - vector of discrete samples of a truncated Gaussian.
function [ g ] = discret( sigma, N )
% General case of conjugated N-symmetry.
% Gaussian discretization on the interval [-N/2, N/2]:
t = -N/2:1:N/2-1;
g = gaussian(t, sigma);
end