%% Weyl-Heisenberg Bases Toolbox
% Function "compress.m"
%% Описание:
% Функция сжатия данных массива вещественных чисел по пороговому значению.
%
%% Входные данные:
% I - двумерный массив,
% threshold - пороговое значение.
%
%% Выходные данные:
% J - двумерный массив-результат,
% total - число сжатых элементов.
function [ J, total ] = compress( I, threshold )
%% Определение параметров массива:
l0 = size(I, 1);
l1 = size(I, 2);
J = zeros(l0, l1);
total = 0;
%% Сжатие по пороговому значению:
for i = 1 : l0
    for j = 1 : l1
        if (abs(I(i, j)) < threshold)
            J(i, j) = 0;
            total = total + 1;
        else
            J(i, j) = I(i, j);
        end;
    end;
end;
end