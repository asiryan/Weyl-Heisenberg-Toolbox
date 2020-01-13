%% Weyl-Heisenberg Bases Toolbox
% Function "gabor.m"
%% Description:
% Constructs the rectangular complex matrix of the Gabor basis.
% 
%% Notation: 
% This basis is not orthogonal.
%
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% G - Gabor matrix [N, 2N].
function [ G ] = gabor( M, L, a, sigma )
N = M * L; % samples

%% 1. Discretization
g = gaussian(N, sigma);

%% 2. Complex basis: Gr[N, N] and Gi[N, N]
[Gr, Gi] = gshell(g, M, a);

%% 3. Gabor matrix: G=[Gr, Gi] => [N, 2N]
G = [Gr, Gi];
end