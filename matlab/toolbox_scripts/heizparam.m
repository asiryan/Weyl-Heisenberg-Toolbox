%% Weyl-Heisenberg Toolbox
% Function "heizparam.m"
%% Description:
% Heisenberg parameter calculation function (Heisenberg rectangle area)
% for a given WH-function.
%% Notation:
% WH-function should not be shifted to the middle of the inverval.
%
%% Input:
% g - WH-function.
%
%% Output:
% H - Heisenberg parameter.
function [ H ] = heizparam( g )
N  = length(g);            % samples
S  = abs(fft(g))./sqrt(N); % amplitude
E  = sum(abs(g).^2);

fg = sum([0:1:N-1].*(abs(S).^2))/E;
tg = sum([0:1:N-1].*(abs(g).^2))/E;

dfg = sum((([0:1:N-1]-fg).^2).*(abs(S).^2))/(N)/E;
dtg = sum((([0:1:N-1]-tg).^2).*(abs(g).^2))/(N)/E;

dfg2 = sqrt(dfg);
dtg2 = sqrt(dtg);

H = 1/(4*pi*dfg2*dtg2);