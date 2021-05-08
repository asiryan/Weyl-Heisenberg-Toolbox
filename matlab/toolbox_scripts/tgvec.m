%% Weyl-Heisenberg Toolbox
% Function "tgvec.m"
%% Description:
% Returns truncated Gaussian function vector for N number of samples.
%% Notation:
% Gaussian shape depends on value of standard deviation.
%
%% Input:
% sigma - standard deviation,
% N - samples.
%
%% Output:
% g - vector of discrete samples of a truncated Gaussian.
function [ g ] = tgvec( N, sigma )
% General case of conjugated N-symmetry.
% Gaussian discretization on the interval [-N/2, N/2]:
t = -N/2:1:N/2-1;
g = tgfun(t, sigma);
end