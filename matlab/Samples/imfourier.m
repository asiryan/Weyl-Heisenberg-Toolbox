%% Weyl-Heisenberg Bases Toolbox
% Script "imfourier.m"
%% Description:
% Implements compression of a monochrome image using the Fourier basis
% and evaluates the identity of the original and restored images.
% A also determines the compression ratio of a monochrome image.
%
%% Input
t = input('Threshold (0, 1) = ');

%% Properties
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

%% Image matrix
RGB = imread('Images/lena256.png');
I = double(rgb2gray(RGB));
figure(1);
imshow(uint8(I));
title('Image');
N = size(I, 1);

%% Construction of transform matrix
F = dftmtx(N);

%% Forward DFT
A = F * I * F';
A = A / N;
[A, compressed, total] = compress(A, t);
figure(2);
imshow(uint8(real(A)));
title('Forward DFT');

%% Backward DFT
B = F' * A * F;
B = real(B / N);
figure(3);
imshow(uint8(B));
title('Backward DFT');

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