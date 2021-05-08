%% Weyl-Heisenberg Toolbox
% Function "weylhz.m"
%% Description:
% Constructs the rectangular complex matrix of the Weyl-Heisenberg basis
% using eigenvalue decomposition.
%
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% W - Weyl-Heisenberg matrix [N, 2N].
function [ W ] = weylhz( M, L, a, sigma )

%% 1. Construction of the extended real Gabor matrix: 
%                                                     Gb = |ReG|
%                                                          |ImG| => [2N, 2N]
N  = M * L; % samples
N2 = N * 2;
Gb = gaborr(M, L, a, sigma);

%% 2. Eigenvalue decomposition
[S, A, ~] = svd(Gb * Gb');

%% 3. Calculating matrices E, W:
E = sqrtm(A); % square root
W = Gb' * S / E;

%% 4. Calculating real matrix Vopt => [2N, 2N]
Vopt = S * W';

%% 5. Block decomposition of matrix:    
%                                       Vîïò = |V1opt| => [N, 2N]
%                                              |V2opt| => [N, 2N]
V1 = Vopt(  1: N,:);
V2 = Vopt(N+1:N2,:);
 
%% 6. Weyl-Heisenberg matrix:
% U = V1 + j * V2 =>[N, 2N]
W = V1 + 1i * V2;
end