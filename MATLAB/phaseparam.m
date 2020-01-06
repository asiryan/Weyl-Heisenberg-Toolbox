%% Weyl-Heisenberg Bases Toolbox
% Function "phaseparam.m"
%% Description:
% The function of determining the optimal phase parameter depending on the type
% symmetry of the forming function.
%
%% Input:
% M - number of frequency shifts,
% L - number of time shifts.
%
%% Output:
% a - alfa-parameter.
function [ a ] = phaseparam( M, L )
N = M * L; % samples
if (mod(N, 2) == 0)
    a = M / 2 - 1; % conjugate N-symmetry
else
    a = M / 2; % conjugate (N-1)-symmetry
end
end