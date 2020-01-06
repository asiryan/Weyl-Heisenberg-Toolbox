%% Weyl-Heisenberg Bases Toolbox
% Function "uifft.m"
%% Description:
% Modified backward Fourier transform.
%
%% Input:
% X - matrix,
% Ncar - dimension.
%
%% Output:
% U - matrix.
function U = uifft(X,Ncar)   
if (nargin < 2)
    Ncar=length(X(:,1));
end
U = ifft(X)*sqrt(Ncar);
end