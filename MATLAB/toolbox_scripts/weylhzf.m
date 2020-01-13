%% Weyl-Heisenberg Bases Toolbox
% Function "weylhzf.m"
%% Description:
% Constructs the rectangular complex matrix of the Weyl-Heisenberg basis
% using fast synthesis algorithm.
% 
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% G - Weyl-Heisenberg matrix [N, 2N].
function [ G ] = weylhzf( M, L, a, sigma )
N = M * L; % samples

%% 1. Discretization
g = gaussian(N, sigma);

%% 2. Obtaining the WH-function using fast synthesis algorithm
%g = dzakt(g, M); % Discrete Zak-Transform
g = wigner(g, M); % Discrete Wigner Transform

%% 3. Complex basis: Gr[N, N] and Gi[N, N]
[Gr, Gi] = gshell(g, M, a);

%% 3. Weyl-Heisenberg matrix: G=[Gr, Gi] => [N, 2N]
G = [Gr, Gi];
end