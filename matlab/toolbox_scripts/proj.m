%% Weyl-Heisenberg Toolbox
% Function "proj.m"
%% Description:
% Finds the projection of the vector "a" is collinear to the vector "e".
%% Notation:
% Used in the Gram-Schmidt process.
%
%% Input:
% e - first vector,
% a - second vector.
%
%% Output:
% p - projection of the vector "a" is collinear to the vector "e".
function [ p ] = proj( e, a )
p = (e' * a)./ (e' * e) .* e;
end