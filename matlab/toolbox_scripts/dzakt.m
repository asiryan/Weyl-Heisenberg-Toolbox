%% Weyl-Heisenberg Toolbox
% Function "dzakt.m"
%% Description:
% Function that implements a fast algorithm of orthogonalization
% WH-function using discrete Zak-transforms (H. Bolcskei).
%
%% Input:
% g - input vector of samples of the function.
% M - number of frequency shifts (even number).
%
%% Output:
% gopt - output vector of samples of the WH-function.
function [ gopt ] = dzakt( g, M )
N  = length(g); % samples
L  = N / M;     % number of time shifts
L2 = L * 2; 
M2 = M / 2;
G  = zeros(M2,L2);
Zo = zeros(M2,L2);
gopt = zeros( 1,N);

%% 1. Forward Zak-transform
% Construction of shift matrix
for i=0:1:M2-1
    for j=0:1:L2-1
        G(i+1,j+1) = g(mod(i+fix(M/2)*j,N)+1);
    end
end
G = G.';

% Forward Fourier transform
Z = fft(G);
Z = Z.';

%% 2. Construction of orthogonal matrix
for n=1:M2
    for k=1:L2
        if (k<L+1)
            Zo(n,k)=2.*Z(n,k)./sqrt(M.*(abs(Z(n,k)).^2+abs(Z(n,L2+k-L)).^2));  
        else
            Zo(n,k)=2.*Z(n,k)./sqrt(M.*(abs(Z(n,k)).^2+abs(Z(n,   k-L)).^2));  
        end
    end
end

%% 3. Backward Zak-transform
% Backward Fourier transform
Zo = Zo.';
Go = ifft(Zo);
Go = Go.';

%% 4. Obtaining an output WH-function
i=1;
for k=1:L2
    for n=1:M2
        gopt(1,i)=Go(n,k);
        i=i+1;
    end
end
end