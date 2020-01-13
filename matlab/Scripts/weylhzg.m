%% Weyl-Heisenberg Bases Toolbox
% Function "weylhzg.m"
%% Description:
% Constructs the rectangular complex matrix of the Weyl-Heisenberg basis
% using Gram-Schmidt process.
%
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% W - Weyl-Heisenberg matrix [N, 2N].
function [ W ] = weylhzg( M, L, a, sigma )

%% 1. Construction of the extended real Gabor matrix: 
%                                                     Gb = |ReG|
%                                                          |ImG| => [2N, 2N]
N  = M * L; % samples
N2 = N * 2;
Gb = gaborr(M, L, a, sigma);

%% 2. Gram-Schmidt orthogonalization
Vopt = gschmidt(Gb);

%% 3. Block decomposition of matrix:    
%                                       Vîïò = |V1îïò| => [N, 2N]
%                                              |V2îïò| => [N, 2N]
V1 = Vopt(  1: N,:);
V2 = Vopt(N+1:N2,:);
 
%% 6. Weyl-Heisenberg matrix:
% Uîïò = V1îïò + j * V2îïò =>[N, 2N]
W = V1 + 1i * V2;
end