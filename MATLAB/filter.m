%% Weyl-Heisenberg Bases Toolbox
% Script "filter.m"
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
g0=discret(sigma, N);
gopt = dzakt(g0, M); % Discrete Zak-Transform
%gopt = wigner(g0, M); % Discrete Wigner Transform

%% Plotting
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Arial');
figure('Color','white');

% Impulse response
subplot(2,1,1);
hold on;
plot(abs(g0),'k--','linewidth',2);
plot(abs(gopt),'k-','linewidth',2);
grid on;
title('Time domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;

% Frequency response
subplot(2,1,2);
hold on;
plot(abs(ufft(g0)),'k--','linewidth',2);
plot(abs(ufft(gopt)),'k-','linewidth',2);
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;