%% Weyl-Heisenberg Bases Toolbox
% Script "basis.m"
%% Описание:
% Реализует построение комплексных базисов: Габора и оптимального базиса
% Вейля-Гейзенберга.
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

% Построение прямоугольной матрицы базиса Габора:
G = gabor(M, L, a, sigma);
% Построение прямоугольной матрицы оптимального базиса Вейля-Гейзенберга:
W = weylhzp(M, L, a, sigma);

% Вывод результатов симуляции:
% Временная область:
TP0 = real(G);
TP1 = real(W);

%set(0,'DefaultAxesFontSize',9,'DefaultAxesFontName','Arial');
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 

figure('Color','white');
subplot(2,1,1);
hold on;
plot(TP0(:,1),'k--','linewidth',2.2);
plot(TP1(:,1),'k-','linewidth',2.2);
legend('Базис Габора', 'Опт. WH-базис');
grid on;
title('Временная область');
ylabel('Амплитуда');
xlabel('Отсчеты n');
ylim([0, 0.6]);
hold off;

% Частотная область:
SP0 = abs(fft(G));
SP1 = abs(fft(W));
subplot(2,1,2);
hold on;
plot(SP0(:,fix(M/2 + 1)),'k--','linewidth',2.2);
plot(SP1(:,fix(M/2 + 1)),'k-','linewidth',2.2);
legend('Базис Габора', 'Опт. WH-базис');
grid on;
title('Частотная область');
ylabel('Модуль');
xlabel('Отсчеты n');
hold off;