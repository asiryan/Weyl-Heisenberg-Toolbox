%% Weyl-Heisenberg Bases Toolbox
% Function "gaussian.m"
%% Description:
% Truncated Gaussian function (Gabor function).
%
%% Input:
% x - argument,
% sigma - standard deviation.
%
%% Output:
% g - function.
function [ g ] = gaussian( x, sigma )
g = (2.*sigma).^(0.25).*exp(-pi.*sigma*x.^2);
end