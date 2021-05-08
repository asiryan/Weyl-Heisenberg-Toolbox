%% Weyl-Heisenberg Components
% Script "wh_basis_shifts.m"
%% Description:
% Visualizes the time and frequency shifts of the optimal Weyl-Heisenberg 
% basis.
% 
%% Notation: 
% As a matrix of the Weyl-Heisenberg optimal basis can also be used one 
% of various other products methods of orthogonalization (eigenvalue 
% decomposition, Gram-Schmidt process, fast algorithm).
% 
% Rectangular complex matrices: "gabor", "weylhz", "weylhzf", "weylhzg".
% Square real matrices: "gaborr", "weylhzr".
% Square complex matrices: "gaborc", "weylhzc".
%
%% Input
M     = input('Number of frequency shifts M = ');
L     = input('Number of time shifts L = ');
sigma = input('Standard deviation = ');
a     = phaseparam(M, L);
N = M * L;

%% Bases construction
W = weylhzc(M, L, a, sigma);

%% Plotting
% Time domain
TP0 = real(W);

set(0,'DefaultTextFontSize',10,'DefaultTextFontName','Times New Roman');

figure(1);
subplot(2,1,1);
hold on
for i = 1 : M-1
    plot(TP0(:,M*i+1),rndcolor(i),'linewidth',2.5);
end
grid on;
title('Time domain');
ylabel('Amplitude');
xlabel('Samples, n');
hold off;

% Frequency domain
SP0 = abs(fft(W));
subplot(2,1,2);
hold on;
for j = 1 : L
    plot(SP0(:,j),rndcolor(j),'linewidth',2.5);
end
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
hold off;

%% Weyl-Heisenberg Basis Components
% Function "rndcolor.m"
%% Description:
% The function returns the color and line type of the chart.
%
%% Input:
% k - numeric.
%
%% Output:
% color - color.
function [ color ] = rndcolor(k)
n = 4;
k = floor(k);
c = mod(k, n);

if (c == 0)
    color = 'r-';
elseif (c == 1)
    color = 'm--';
elseif (c == 2)
    color = 'b:';
elseif (c == 3)
    color = 'k--';
end
end