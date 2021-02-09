%% Weyl-Heisenberg Bases Toolbox
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
disp(['Sigma: ', num2str(sigma)]);
disp(['Alpha: ', num2str(alfa)]);

%% Basis functions
x = [0:1:N-1];
g = (2.*sigma).^(0.25).*exp(-pi.*sigma*x.^2);
disp(g');
%g = cos(0:N-1);
gopt = dzakt(g, M); % Discrete Zak-Transform
%gopt = wigner(g, M); % Discrete Wigner Transform

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
plot(abs(ufft(g)),'k--','linewidth',2);
plot(abs(ufft(gopt)),'r-','linewidth',2);
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;