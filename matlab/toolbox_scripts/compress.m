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
% params
l0 = size(I, 1);
l1 = size(I, 2);
ll = l0 * l1;
J = zeros(l0, l1);
compressed = 0;
total = 0;

if (coefficient == 0)
    J = I;
    total = ll;
    return;
end

% reshaping and calculating threshold
H = abs(reshape(I, ll, 1));
H = sort(H);
threshold = H(floor(ll * coefficient), 1);

% compression
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
