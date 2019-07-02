%% Weyl-Heisenberg Bases Toolbox
% Function "isdiag.m"
%% Описание:
% Функция проверки является ли матрица диагональной.
%% Входные данные:
% A - матрица.
%% Выходные данные:
% b - логическое значение (1 - true, 0 - false).
function [ b ] = isdiag( A )
l0 = size(A, 1);
l1 = size(A, 2);
b = 1;
for i=1:l0
    for j=1:l1
        if (i ~= j)
            if (A(i, j) ~= 0)
                b = 0;
                break;
            end;
        end;
    end;
end;
end