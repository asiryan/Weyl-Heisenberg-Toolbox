%% Weyl-Heisenberg Toolbox
% Function "bdt.m"
%% Description:
% Forward block orthogonal discrete transform.
%
%% Input:
% I - matrix,
% W - transform matrix,
%
%% Output:
% J - output matrix.
function [ J ] = bdt( I, W )
% shapes of matrices
[n, m] = size(I);
[r, l] = size(W);

% block shift
N = fix(n ./ r);
M = fix(n ./ l);

% output matrix
J = zeros(n, m);

% Block discrete orthogonal transform
for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       block = I(y:y+r-1,x:x+l-1);
       J(y:y+r-1,x:x+l-1) = W * block * W';
   end
end
end
