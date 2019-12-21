%% Weyl-Heisenberg Bases Toolbox
% Script "plotgauss3.m"
%% Описание:
% Реализует дискретизацию усеченного гауссиана и строит трехмерный график 
% функции по дискретным отсчетам.
%
%% Ввод данных
N     = input('Количество дискретных отсчетов = ');
sigma = input('Среднеквадратическое отклонение = ');

%% Дискретизация усеченного гауссиана
g0 = discret(sigma, N);

%% Построение трехмерной функции
maximum = max(g0);
Z = g0' * g0./ maximum;
S = 1:N;

%% Построение трехмерного графика функции усеченного гауссиана
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman');
figure(1);
surf(S,S,real(Z));
shading interp;
title('Временная область');
xlabel('Отсчеты n');
ylabel('Отсчеты n');
zlabel('Амплитуда');