%% Weyl-Heisenberg Bases Toolbox
% Script "wh_basis_comparison.m"
%% Description:
% Implements a comparison of two matrices of optimal Weyl-Heisenberg bases:
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
sigma = input('Standard deviation = ');
a     = phaseparam(M, L);

%% Construction of the matrix of the Weyl-Heisenberg optimal basis using eigenvalue decomposition
tic;
W = weylhz(M, L, a, sigma);
disp('Basis synthesis time using eigenvalue decomposition:')
toc;

%% Construction of the matrix of the optimal Weyl-Heisenberg basis using the fast algorithm
tic;
Wp = weylhzf(M, L, a, sigma);
disp('Basis synthesis time using the fast algorithm:')
toc;

%% Matrix identity assessment
A = norm(W - Wp);
eps = 1e-8;

if (A <= eps)
    disp('Matrices are identical.');
else
    disp('Matrices are identical with an error:')
    disp(A);
end