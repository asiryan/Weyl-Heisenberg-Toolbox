%% Weyl-Heisenberg Bases Toolbox
% Function "gaussian.m"
%% Description:
% Returns truncated Gaussian function for N number of samples.
%% Notation:
% Gaussian shape depends on value of standard deviation.
%
%% Input:
% sigma - standard deviation,
% N - samples.
%
%% Output:
% g - vector of discrete samples of a truncated Gaussian.
function [ g ] = gaussian( N, sigma )
% General case of conjugated N-symmetry.
% Gaussian discretization on the interval [-N/2, N/2]:
t = -N/2:1:N/2-1;
g = tgfun(t, sigma);
end
%% Weyl-Heisenberg Bases Toolbox
% Function "tgfun.m"
%% Description:
% Truncated Gaussian function (Gabor function).
%
%% Input:
% x - argument,
% sigma - standard deviation.
%
%% Output:
% g - function.
function [ g ] = tgfun( x, sigma )
g = (2.*sigma).^(0.25).*exp(-pi.*sigma*x.^2);
end