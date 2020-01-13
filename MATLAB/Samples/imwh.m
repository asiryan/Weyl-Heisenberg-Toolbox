%% Weyl-Heisenberg Bases Toolbox
% Script "imwh.m"
%% Description:
% Implements compression of a monochrome image using the Weyl-Heisenberg 
% basis and evaluates the identity of the original and recovered images. 
% It also determines the degree of compression monochrome image.
%
%% Input
M     = input('Number of time shifts M = ');
sigma = input('Standard deviation = ');
t     = input('Threshold (0, 1) = ');

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

%% Basis params
L = N/M; % number of time shifts
a = phaseparam(M, L); % alfa-parameter

%% Construction of transform matrix
W = weylhzf(M, L, a, sigma);

%% Forward DWHT
A = real(W' * I * W);
[A, compressed, total] = compress(A, t);
figure(2);
imshow(uint8(A));
title('Forward DWHT');

%% Backward DWHT
B = W * A * W';
B = real(B./2);
figure(3);
imshow(uint8(B));
title('Backward DWHT');

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