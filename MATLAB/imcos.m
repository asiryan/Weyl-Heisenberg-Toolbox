%% Weyl-Heisenberg Bases Toolbox
% Script "imcos.m"
%% Description:
% Implements compression of a monochrome image using a basis
% cosine transform and evaluates the identity of the original
% and recovered images. It also determines the degree of compression
% monochrome image.
%
%% Input
t = input('Threshold (0, 1) = ');

%% Image matrix
RGB = imread('Images/lena256.png');
I = double(rgb2gray(RGB));
figure(1);
imshow(uint8(I));
title('Image');
N = size(I, 1);

%% Construction of transform matrix
T = dctmtx(N);

%% Forward DCT
A = T * I * T';
[A, compressed, total] = compress(A, t);
figure(2);
imshow(uint8(A));
title('Forward DCT');

%% Backward DCT
B = T' * A * T;
figure(3);
imshow(uint8(B));
title('Backward DCT');

%% Properties
E = norm(I - B);
disp('Norm of the difference between the matrices of the original image and the reconstructed:')
disp(E)
disp('Number of compressed elements:')
disp(compressed)
disp('Total number of elements:')
disp(total)
disp('Ratio of the number of compressed elements to the total number of image elements:')
disp(compressed / total)