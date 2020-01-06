%% Weyl-Heisenberg Bases Toolbox
% Function "weylhzreal.m"
%% Description:
% Constructs the real squre matrix of the Weyl-Heisenberg basis.
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
% U - real squre matrix of the Weyl-Heisenberg basis [2N, 2N].
function [ U ] = weylhzreal( M, L, a, sigma )
%% Weyl-Heisenberg complex matrix:
G = weylhzp(M, L, a, sigma);

%% Weyl-Heisenberg real matrix:
%             U = | real(Gr)  real(Gi)| = | real(G) |
%                 | imag(Gr)  imag(Gi)|   | imag(G) |
% where G = |Gr Gi| - Gabor compex matrix.
U  = [real(G); imag(G)];
end