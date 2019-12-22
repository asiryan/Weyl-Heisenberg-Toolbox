%% Weyl-Heisenberg Bases Toolbox
% Script "filter.m"
%% Описание:
% Реализует формирование частотно-временных банков фильтров Габора и оптимального 
% базиса Вейля-Гейзенберга, а также строит графики АЧХ и ИХ.
%
%% Ввод данных
M     = input('Количество сдвигов по частоте M = ');
L     = input('Количество сдвигов по частоте L = ');
beta  = input('Параметр бета = ');

%% Определение дополнительных параметров
N = L*M;
sigma = sigmaparam(M, beta);
alfa = phaseparam(M, L);
disp(sigma);
disp(alfa);

%% Построение базисных функций
g0=discret(sigma, N);
gopt = dzakt(g0, M); % Discrete Zak-Transform
%gopt = viener(g0, M); % Discrete Viener Transform

%% Построение графиков
set(0,'DefaultAxesFontSize',10,'DefaultAxesFontName','Arial');
figure('Color','white');

% Импульсная характеристика
subplot(2,1,1);
hold on;
plot(abs(g0),'k--','linewidth',2);
plot(abs(gopt),'k-','linewidth',2);
grid on;
title('Временная область');  
xlabel('Отсчеты n');
ylabel('Амплитуда');
legend('Базис Габора','Опт. WH-базис');
hold off;

% Амплитудно-частотная характеристика (АЧХ)
subplot(2,1,2);
hold on;
plot(abs(ufft(g0)),'k--','linewidth',2);
plot(abs(ufft(gopt)),'k-','linewidth',2);
grid on;
title('Частотная область');
xlabel('Отсчеты n');
ylabel('Модуль спектра');
legend('Базис Габора','Опт. WH-базис');
hold off;