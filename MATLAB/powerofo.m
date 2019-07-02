%% Weyl-Heisenberg Bases Toolbox
% Script "powerofo.m"
%% Описание:
% Реализует построение графиков зависимости операционной сложности при
% преобразовании Вейля-Гейзенберга (стандартный алгоритм и быстрый).
%%close all;
M = 0:1:32;
L = 8;

N = M .* L;

% slow algorithm:
O1 = N.^2;
% fast algorithm:
O2 = 2 * (N.*L) + 2 * N.* log2(M) + 4.*N;

%% Построение зависимостей:
set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');
figure('Color', 'White')
hold on;
plot(M,O1,'k--','linewidth',2);
plot(M,O2,'r-','linewidth',2);
hold off;
grid on;
xlabel('Количество сдвигов по частоте M');
ylabel('Количество затраченных комплексных операций');
%title(['Зависимость кол-ва комплексных операций при' ' L=' int2str(L)])
legend('Стандартный алгоритм','Предложенный алгоритм')

M = [16, 32, 64];
L = 16;
N = M.*L;
O11 = N.^2;
O22 = 2 * (N.*L) + 2 * N.* log2(M) + 4.*N;

disp(O11);
disp(O22);