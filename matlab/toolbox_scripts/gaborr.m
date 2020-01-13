%% Weyl-Heisenberg Bases Toolbox
% Function "gaborr.m"
%% Description:
% Constructs the square real matrix of the Gabor basis.
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
% U - real squre matrix of the Gabor basis [2N, 2N].
function [ U ] = gaborr( M, L, a, sigma )
%% Gabor complex matrix:
G = gabor(M, L, a, sigma);

%% Gabor real matrix:
%             U = | real(Gr)  real(Gi)| = | real(G) |
%                 | imag(Gr)  imag(Gi)|   | imag(G) |
% where G = |Gr Gi| - Gabor rectangular complex matrix.
U  = [real(G); imag(G)];
end