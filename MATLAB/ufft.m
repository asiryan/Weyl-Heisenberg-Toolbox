%% Weyl-Heisenberg Bases Toolbox
% Function "ufft.m"
%% Описание:
% Функция, реализующая прямое преобразование Фурье.
%
%% Входные данные:
% U - вектор или матрица,
% Ncar - размерность вектора или матрицы.
%
%% Выходные данные:
% X - вектор или матрица.
function X = ufft(U,Ncar)
if (nargin < 2)
    Ncar=length(U(:,1));
end
X = fft(U)/sqrt(Ncar);
end