%% Weyl-Heisenberg Toolbox
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