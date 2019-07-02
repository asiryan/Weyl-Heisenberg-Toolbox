%% Weyl-Heisenberg Bases Toolbox
% Function "gaussian.m"
%% Описание:
% Функция усеченного гауссиана (функция Габора).
%
%% Входные данные:
% x - случайная величина (носитель),
% sigma - среднеквадратическое отклонение.
%
%% Выходные данные:
% g - значение функции.
function [ g ] = gaussian( x, sigma )
g = (2.*sigma).^(0.25).*exp(-pi.*sigma*x.^2);
end