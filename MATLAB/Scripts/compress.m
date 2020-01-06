%% Weyl-Heisenberg Bases Toolbox
% Function "compress.m"
%% Description:
% Compression function of array elements at a given compression ratio.
%
%% Input:
% I - matrix,
% coefficient - compress coefficent.
%
%% Output:
% J - matrix,
% compressed - number of compressed elements,
% total - total number of elements.
function [ J, compressed, total ] = compress( I, coefficient )
% Params
l0 = size(I, 1);
l1 = size(I, 2);
ll = l0 * l1;
H = zeros(1, ll);

% Convert to vector
for i = 1 : l0
    for j = 1 : l1
        H(1, i * l0 + j) = abs(I(i, j));
    end
end
H = sort(H);

% Threshold
threshold = H(1, floor(ll * coefficient));

% Compress
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
