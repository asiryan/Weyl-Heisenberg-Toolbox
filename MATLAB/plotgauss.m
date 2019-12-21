%% Weyl-Heisenberg Bases Toolbox
% Script "plotgauss.m"
%% Описание:
% Реализует дискретизацию усеченного гауссиана и строит график по 
% дискретным отсчетам.
%
%% Ввод данных
N     = input('Количество дискретных отсчетов = ');
sigma = input('Среднеквадратическое отклонение = ');

%% Дискретизация усеченного гауссиана
g0 = discret(sigma, N);

%% Построение трехмерного графика функции усеченного гауссиана
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman');
figure(1)
plot(g0, 'k','linewidth',2.5);
grid on;
title('График функции усеченного гауссиана');
ylabel('Амплитуда');
xlabel('Отсчеты n');