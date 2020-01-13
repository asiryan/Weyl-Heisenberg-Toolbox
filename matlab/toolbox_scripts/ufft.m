%% Weyl-Heisenberg Bases Toolbox
% Function "ufft.m"
%% Description:
% Modified forward Fourier transform.
%
%% Input:
% U - matrix,
% Ncar - dimension.
%
%% Output:
% X - matrix.
function X = ufft(U,Ncar)
if (nargin < 2)
    Ncar=length(U(:,1));
end
X = fft(U)/sqrt(Ncar);
end