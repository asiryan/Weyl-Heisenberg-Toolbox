%% Weyl-Heisenberg Bases Toolbox
% Script "shifts.m"
% Описание:
%% Визуализирует сдвиги оптимального базиса Вейля-Гейзенберга по времени и 
% частоте.
%% Примечание: 
% В качестве матрицы оптимального базиса Вейля-Гейзенберга
% может быть также использован один из различных продуктов других 
% способов ортогонализации (процесс Грама-Шмидта, полифазное разложение). 
% Для этого необходимо произвести соответсвующую замену в строке кода на 
% "weylhzg" или "weylhzp".
%
%% Ввод данных:
M     = input('Количество сдвигов по частоте M = ');
L     = input('Количество сдвигов по времени L = ');
a     = input('Параметр альфа a = ');
sigma = input('Среднеквадратическое отклонение sigma = ');

% Построение матрицы оптимального базиса Вейля-Гейзенберга:
W = weylhz(M, L, a, sigma);

% Вывод результатов симуляции:
% Временная область:
TP0 = real(W);

%set(0,'DefaultAxesFontSize',9,'DefaultAxesFontName','Arial');
set(0,'DefaultTextFontSize',10,'DefaultTextFontName','Times New Roman');

figure(1);
subplot(2,1,1);
hold on;
for i = 1 : M
    plot(TP0(:,1 + M * i),rndcolor(i),'linewidth',2.5);
end;
grid on;
title('Временная область');
ylabel('Амплитуда');
xlabel('Отсчеты n');
hold off;

% Частотная область:
SP0 = abs(fft(W));
subplot(2,1,2);
hold on;
for j = 1 : L
    plot(SP0(:,j),rndcolor(j),'linewidth',2.5);
end;
grid on;
title('Частотная область');
ylabel('Модуль');
xlabel('Отсчеты n');
hold off;