%% Weyl-Heisenberg Bases Toolbox
% Script "basisreal.m"
%% Описание:
% Реализует построение вещественных базисов: Габора и оптимального базиса
% Вейля-Гейзенберга.
%
%% Ввод данных:
M     = input('Количество сдвигов по частоте M = ');
L     = input('Количество сдвигов по частоте L = ');
a     = input('Параметр альфа a = ');
sigma = input('Среднеквадратическое отклонение sigma = ');

% Построение квадратной матрицы базиса Габора:
G = gaborreal(M, L, a, sigma);
% Построение квадратной матрицы оптимального базиса Вейля-Гейзенберга:
W = weylhzreal(M, L, a, sigma);

% Вывод результатов симуляции:
% Временная область:
TP0 = real(G);
TP1 = real(W);

%set(0,'DefaultAxesFontSize',9,'DefaultAxesFontName','Arial');
set(0,'DefaultAxesFontSize',10,'DefaultAxesFontName','Times New Roman');

figure(1);
subplot(2,1,1);
hold on;
plot(TP0(:,1),'b-','linewidth',2.5);
plot(TP1(:,1),'r-','linewidth',2.5);
legend('Базис Габора', 'Базис В-Г', 1);
grid on;
title('Временная область');
ylabel('Амплитуда');
xlabel('Отсчеты n');
hold off;

% Частотная область:
SP0 = abs(fft(G));
SP1 = abs(fft(W));
subplot(2,1,2);
hold on;
plot(SP0(:,fix(M/2 + 1)),'b-','linewidth',2.5);
plot(SP1(:,fix(M/2 + 1)),'r-','linewidth',2.5);
legend('Базис Габора', 'Базис В-Г', 1);
grid on;
title('Частотная область');
ylabel('Модуль');
xlabel('Отсчеты n');
hold off;