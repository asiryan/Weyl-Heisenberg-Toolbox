%% Weyl-Heisenberg Bases Toolbox
% Function "huffparam.m"
%% Description:
% Huffman encoding parameter function of array elements.
%
%% Input:
% I - matrix.
%
%% Output:
% parameter - encoding parameter.
function [ parameter ] = huffparam( I )
% Reshape current matrix to array
symbols = reshape(I, [], 1);
z = length(symbols);

% Get unique elements
uni = unique(symbols);
n = length(uni);
%disp(['Unique elements: ', num2str(n)]);
count = zeros(1,n);

% Finding count of each element
for k = 1:n
    count(k) = sum(symbols==uni(k));
end

% Finding probability of each element
prob = zeros(1,length(uni));
                
for k = 1:n
    prob(k) = count(k)/z;
end

%disp(['Summary of probabilities: ', num2str(sum(prob))])

% Huffman encoding
dict = huffmandict(uni, prob);
code = huffmanenco(symbols, dict);
parameter = length(code);
end
