%% Weyl-Heisenberg Toolbox
% Function "sigmaparam.m"
%% Description:
% The function of determining the mean square Gaussian depending on
% beta value.
%
%% Input:
% M - number of frequency shifts,
% beta - beta-parameter. This parameter is selected experimentally from
% conditions of the best localization of the frequency response of the filter.
% beta = 1.00 (for L = 16), 
% beta = 1.25 (for L = 12), 
% beta = 0.95 (for L =  8).
%
%% Ouput:
% sigma - standard deviation.
function [ sigma ] = sigmaparam( M, beta )
sigma = (1./M.^2)./beta;
end