%% Weyl-Heisenberg Bases Toolbox
% Function "compress2.m"
%% Описание:
% Функция сжатия данных массива комплексных чисел по пороговому значению. 
% Процедура сжатия проходит отдельно для действительной и мнимой частей.
%
%% Входные данные:
% I - двумерный массив,
% tRe - пороговое значение действительных значений,
% tIm - пороговое значение мнимых значений.
%
%% Выходные данные:
% J - двумерный массив-результат,
% total - число сжатых элементов.
function [ J, total ] = compress2( I, tRe, tIm )
%% Определение параметров массива:
l0 = size(I, 1);
l1 = size(I, 2);
J = zeros(l0, l1);
total = 0;
%% Сжатие по пороговому значению:
for i = 1 : l0
    for j = 1 : l1
        Re = real(I(i, j));
        Im = imag(I(i, j));
        
        if (abs(Re) < tRe)
            Re = 0;
            total = total + 1;
        end;
        if (abs(Im) < tIm)
            Im = 0;
            total = total + 1;
        end;
        J(i, j) = Re + 1i * Im;
    end;
end;
end