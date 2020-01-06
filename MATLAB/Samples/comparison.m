%% Weyl-Heisenberg Bases Toolbox
% Script "comparison.m"
%% Description:
% Implements a comparison of two matrices of optimal Weil-Heisenberg bases:
% 1) synthesized using eigenvalue decomposition,
% 2) synthesized using the fast algorithm.
%
%% Notation:
% The assessment is carried out by calculating the norm of the difference 
% of matrices and of its comparison with a certain error
% (default is eps = 1e-8).
%
%% Input
M     = input('Number of frequency shifts M = ');
L     = input('Number of time shifts L = ');
a     = input('Alfa-parameter = ');
sigma = input('Standard deviation = ');

%% Construction of the matrix of the Weil-Heisenberg optimal basis using eigenvalue decomposition
tic;
W = weylhz(M, L, a, sigma);
disp('Base synthesis time using eigenvalue decomposition:')
toc;

%% Construction of the matrix of the optimal Weil-Heisenberg basis using the fast algorithm
tic;
Wp = weylhzp(M, L, a, sigma);
disp('Base synthesis time using the fast algorithm:')
toc;

%% Matrix identity assessment
A = norm(W - Wp);
eps = 1e-8;

if (A < eps)
    disp('Matrices are identical.');
else
    disp('Matrices are identical with an error:')
    disp(A);
end