%% Weyl-Heisenberg Bases Toolbox
% Function "compress.m"
%% Описание:
% Функция сжатия элементов массива по заданному коэффициенту сжатиия.
%
%% Входные данные:
% I - двумерный массив,
% coefficient - количество дискретных отсчетов по времени.
%
%% Выходные данные:
% J - двумерный массив,
% compressed - количество сжатых элементов,
% total - общее число элементов.
function [ J, compressed, total ] = compress( I, coefficient )
% Определение параметров массива
l0 = size(I, 1);
l1 = size(I, 2);
ll = l0 * l1;
H = zeros(1, ll);

% Преобразование в вектор
for i = 1 : l0
    for j = 1 : l1
        H(1, i * l0 + j) = abs(I(i, j));
    end
end
H = sort(H);

% Вычисление порога
threshold = H(1, floor(ll * coefficient));

% Сжатие по пороговому значению
J = zeros(l0, l1);
compressed = 0;
total = 0;

for i = 1 : l0
    for j = 1 : l1
        if (abs(I(i, j)) <= threshold)
            J(i, j) = 0;
            compressed = compressed + 1;
        else
            J(i, j) = I(i, j);
        end
        total = total + 1;
    end
end
end
