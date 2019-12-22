%% Weyl-Heisenberg Bases Toolbox
% Function "uifft.m"
%% Описание:
% Функция, реализующая прямое преобразование Фурье.
%
%% Входные данные:
% X - вектор или матрица,
% Ncar - размерность вектора или матрицы.
%
%% Выходные данные:
% U - вектор или матрица.
function U = uifft(X,Ncar)   
if (nargin < 2)
    Ncar=length(X(:,1));
end
U = ifft(X)*sqrt(Ncar);
end