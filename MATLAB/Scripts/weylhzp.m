%% Weyl-Heisenberg Bases Toolbox
% Function "weylhzp.m"
%% Description:
% Constructs the complex matrix of the Weyl-Heisenberg basis.
% 
%% Input:
% M - number of frequency shifts,
% L - number of time shifts,
% a - alfa-parameter,
% sigma - standard deviation.
%
%% Output:
% G - Weyl-Heisenberg matrix [N, 2N].
function [ G ] = weylhzp( M, L, a, sigma )
N = M * L; % samples

%% 1. Discretization
g0 = discret(sigma, N);

%% 2. Obtaining the WH-function using fast synthesis algorithm
%g0 = dzakt(g0, M); % Discrete Zak-Transform
g0 = wigner(g0, M); % Discrete Wigner Transform

% 3. Complex basis: Gr[N, N] and Gi[N, N]
Gr = zeros(N, N);
Gi = zeros(N, N);
for n = 0 : N - 1
    for k = 0 : M - 1
        for l = 0 : L - 1
            u = l * M + k ;                             % element
            i = mod(n - l * M, N);                      % time shift
            j = mod(n + fix(M / 2) - l * M, N);         % frequency shift
            p = 2 * pi * 1i * k / M * (n - a / 2);      % argument
            
            Gr(n + 1, u + 1) =      g0(i + 1) * exp(p);            
            Gi(n + 1, u + 1) = 1i * g0(j + 1) * exp(p);
            % We are forced to add a unit to the element numbers of arrays,
            % because n=0...N-1, k=0...M-1, l=0...L-1.
        end
    end
end

%% 3. Weyl-Heisenberg matrix: G=[Gr, Gi] => [N, 2N]
G = [Gr, Gi];
end