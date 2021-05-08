%% Weyl-Heisenberg Toolbox
% Function "weylhzh.m"
%% Description:
% Constructs the square real matrix of the Weyl-Heisenberg basis
% using fast synthesis algorithm (Hartley homomorphism).
% 
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% G - Weyl-Heisenberg matrix [N, N].
function [ G ] = weylhzh( M, L, a, sigma )
%% 1. Weyl-Heisenberg complex matrix: G=[Gr, Gi] => [N, N]
G = weylhzc(M, L, a, sigma);

%% 2. Hartley homomorphism
G = real(G) - imag(G);
end