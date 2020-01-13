%% Weyl-Heisenberg Bases Toolbox
% Function "weylhzr.m"
%% Description:
% Constructs the square real matrix of the Weyl-Heisenberg basis using
% fast synthesis algorithm.
% 
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% U - real squre matrix of the Weyl-Heisenberg basis [2N, 2N].
function [ U ] = weylhzr( M, L, a, sigma )
%% Weyl-Heisenberg complex matrix:
G = weylhzf(M, L, a, sigma);

%% Weyl-Heisenberg real matrix:
%             U = | real(Gr)  real(Gi)| = | real(G) |
%                 | imag(Gr)  imag(Gi)|   | imag(G) |
% where G = |Gr Gi| - Weyl-Heisenberg rectangular complex matrix.
U  = [real(G); imag(G)];
end