%% Weyl-Heisenberg Toolbox
% Function "weylhzc.m"
%% Description:
% Constructs the square complex matrix of the Weyl-Heisenberg basis
% using fast synthesis algorithm.
% 
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% G - Weyl-Heisenberg matrix [N, N].
function [ G ] = weylhzc( M, L, a, sigma )
N = M * L;

%% 1. Discretization
g = tgvec(N, sigma);

%% 2. Obtaining the WH-function using fast synthesis algorithm
g = dzakt(g, M);

%% 3. Complex basis: Gr[N, N] and Gi[N, N]
[Gr, Gi] = gshell(g, M, a);

%% 3. Weyl-Heisenberg matrix: G=[Gr, Gi] => [N, N]
G = real(Gr) + 1i * real(Gi);
end