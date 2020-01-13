%% Weyl-Heisenberg Bases Toolbox
% Function "gschmidt.m"
%% Description:
% Gram-Schmidt square matrix orthogonalization function.
%
%% Input:
% A - square matrix.
%
%% Output:
% Q - orthogonal matrix.
function [ Q ] = gschmidt( A )
% params
n = size( A, 2 );
Q = zeros( n );

% Convert each vector to a base one
% (1) j-th base vector will be orthogonal to each of the previous 1 ... j-1 vectors;
% (2) will be of unit length.
for j = 1 : n
    % Choose the j-th vector
    u = A( :, j );
    % Clone
    v1 = u;
    
    % Process
    for i = 1 : j - 1
        v2 = Q(:,i);
        u = u - proj( v2, v1 );
    end
     
    % Normalize the vector and put it in the corresponding column of the matrix Q
    Q(:,j) = u ./ norm( u );
end
end