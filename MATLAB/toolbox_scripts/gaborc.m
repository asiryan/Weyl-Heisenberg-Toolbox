%% Weyl-Heisenberg Bases Toolbox
% Function "gaborc.m"
%% Description:
% Constructs the square complex matrix of the Gabor basis.
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
function [ G ] = gaborc( M, L, a, sigma )
N = M * L; % samples

%% 1. Discretization
g = gaussian(N, sigma);

%% 2. Complex basis: Gr[N, N] and Gi[N, N]
[Gr, Gi] = gshell(g, M, a);

%% 3. Gabor matrix: G=[Gr, Gi] => [N, 2N]
G = real(Gr) + 1i * real(Gi);
end