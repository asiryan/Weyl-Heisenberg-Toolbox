%% Weyl-Heisenberg Bases Toolbox
% Script "plotwh.m"
%% Описание:
% Реализует быстрый алгоритм получения формирующей WH-функции
% с использованием полифазного разложения для случая N-1 симметрии 
% и строит графики функций базиса Габора и оптимального базиса 
% Вейля-Гейзенберга.
% 
%% Ввод данных
M     = input('Количество сдвигов по частоте M = ');
L     = input('Количество сдвигов по времени L = ');
sigma = input('Среднеквадратическое отклонение = ');

%% Определение вторичных параметров
N = L * M; % количество осчетов
disp('Количество отсчетов N:');
disp(N); % вывод на экран.

%% Дискретизация усеченного гауссиана
g0 = discret(sigma, N);

%% Получение оптимальной формирующей функции с использованием быстрого алгоритма синтеза
gopt = dzakt(g0, M); % Discrete Zak-Transform
%gopt = viener(g0, M); % Discrete Viener Transform

%% Построение графиков функций Габора и Вейля-Гейзенберга
set(0,'DefaultAxesFontSize',10,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',10,'DefaultTextFontName','Times New Roman'); 
figure(1);
hold on;
grid on;
S = -N/2+0.5:1:N/2;
plot(S,   g0, 'b-', 'linewidth', 2.5);
plot(S, gopt, 'r-', 'linewidth', 2.5);
legend('Базис Габора', 'Базис В-Г');
title('Временная область');
ylabel('Амплитуда');
xlabel('Отсчеты n');
hold off;