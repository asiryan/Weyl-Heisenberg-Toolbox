%% Weyl-Heisenberg Bases Toolbox
% Function "weylhz.m"
%% Description:
% Construction the Weyl-Heisenberg matrix using eigenvalue decomposition.
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
Gb = gaborreal(M, L, a, sigma);

%% 2. Eigenvalue decomposition
[S, A, Sx] = svd(Gb * Gb');

%% 3. Calculating matrices E, W:
E = sqrtm(A); % square root
W = Gb' * S / E;

%% 4. Calculating real matrix Vopt => [2N, 2N]
Vopt = S * W';

%% 5. Block decomposition of matrix:    
%                                       Vîïò = |V1îïò| => [N, 2N]
%                                              |V2îïò| => [N, 2N]
V1 = Vopt(  1: N,:);
V2 = Vopt(N+1:N2,:);
 
%% 6. Weyl-Heisenberg matrix:
% Uîïò = V1îïò + j * V2îïò =>[N, 2N]
W = V1 + 1i * V2;
end