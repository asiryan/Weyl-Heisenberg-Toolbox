%% Weyl-Heisenberg Bases Toolbox
% Script "basis.m"
%% Description:
% Implements the construction of bases: Gabor and Weyl-Heisenberg, and also 
% plots graphs of the frequency response and the impulse response.
%
%% Notation:
% As a matrix of the Weil-Heisenberg optimal basis can also be used one 
% of various other products methods of orthogonalization (eigenvalue 
% decomposition, Gram-Schmidt process, polyphase decomposition).
% To do this, make the appropriate replacement in the line of code by
% "weylhz", "weylhzg" or "weylhzp".
%
%% Input
M     = input('Number of frequency shifts M = ');
L     = input('Number of time shifts L = ');
a     = input('Alfa-parameter = ');
sigma = input('Standard deviation = ');

%% Bases construction
% Construction of a rectangular matrix of a Gabor basis:
G = gabor(M, L, a, sigma); % complex Gabor matrix
%G = gaborreal(M, L, a, sigma); % real Gabor matrix

% Construction of a rectangular matrix of the optimal Weyl-Heisenberg basis:
W = weylhzg(M, L, a, sigma); % complex W-H matrix
%W = weylhzreal(M, L, a, sigma); % real W-H matrix

%% Plots
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
figure('Color','white');

% Time domain
TP0 = abs(G);
TP1 = abs(W);
subplot(2,1,1);
hold on;
plot(TP0(:,1),'k--','linewidth',2.2);
plot(TP1(:,1),'k-','linewidth',2.2);
grid on;
title('Time domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;

% Frequency domain
SP0 = abs(fft(G));
SP1 = abs(fft(W));
subplot(2,1,2);
hold on;
plot(SP0(:,1),'k--','linewidth',2.2);
plot(SP1(:,1),'k-','linewidth',2.2);
legend('Gabor basis', ' WH-basis');
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
hold off;