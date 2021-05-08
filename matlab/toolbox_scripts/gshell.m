%% Weyl-Heisenberg Toolbox
% Function "gshell.m"
%% Description:
% Constructs the basis shell: complex matrices [Gr] and [Gi].
% 
%% Input:
% g - input vector of samples of the function.
% M - number of frequency shifts,
% a - alfa-parameter.
%
%% Output:
% Gr - matrix of real components [N, N],
% Gi - matrix of imaginary components [N, N].
function [ Gr, Gi ] = gshell( g, M, a )
N = length(g); % samples
L = N / M;     % number of time shifts

%% Complex basis: Gr[N, N] and Gi[N, N]
Gr = zeros(N, N);
Gi = zeros(N, N);
for n = 0 : N - 1
    for k = 0 : M - 1
        for l = 0 : L - 1
            u = l * M + k ;                             % element
            i = mod(n - l * M, N);                      % time shift
            j = mod(n + fix(M / 2) - l * M, N);         % frequency shift
            p = 2 * pi * 1i * k / M * (n - a / 2);      % argument
           
                
            Gr(n + 1, u + 1) =      g(i + 1) * exp(p);            
            Gi(n + 1, u + 1) = 1i * g(j + 1) * exp(p);
            % We are forced to add a unit to the element numbers of arrays,
            % because n=0...N-1, k=0...M-1, l=0...L-1.
        end
    end
end
end