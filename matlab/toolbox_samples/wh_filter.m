%% Weyl-Heisenberg Toolbox
% Script "wh_filter.m"
%% Description:
% Implements the construction of frequency-time banks of Gabor and 
% Weyl-Heisenberg filters, and also plots graphs of the frequency response 
% and the impulse response.
%
%% Input
M     = input('Number of frequency shifts M = ');
L     = input('Number of time shifts L = ');
beta  = input('Beta-parameter = ');

%% Parameters
N = L*M;
sigma = sigmaparam(M, beta);
alfa = phaseparam(M, L);
disp(sigma);
disp(alfa);

%% Basis functions
g = tgvec(N,sigma);
gopt = dzakt(g, M);

%% Plotting
figure(1);
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman');

% Impulse response
subplot(2,1,1);
hold on;
plot(abs(g),'k--','linewidth',2);
plot(abs(gopt),'r-','linewidth',2);
grid on;
title('Time domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;

% Frequency response
subplot(2,1,2);
hold on;
plot(abs(fft(g)),'k--','linewidth',2);
plot(abs(fft(gopt)),'r-','linewidth',2);
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;