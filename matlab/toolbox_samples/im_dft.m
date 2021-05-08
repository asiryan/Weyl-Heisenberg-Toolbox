%% Weyl-Heisenberg Toolbox
% Script "im_dft.m"
%% Description:
% Implements DFT of a monochrome image.
%
%% Properties
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman');
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

%% Image matrix
RGB = imread('Images/lena512.png');
I = double(rgb2gray(RGB));

figure(1);
imshow(uint8(I));
title('Image');
[n, m] = size(I);

%% Basis params
M = n;
W = dftmtx(M) ./ sqrt(M);

%% Forward DFT
A = W * I * W';
A = A * 2;

figure(2);
imshow(uint8(A));
title('Forward DFT');

%% Backward DFT
B = W' * A * W;
figure(3);
imshow(uint8(B));
title('Backward DFT');

%% Subplot
figure(4)
subplot(1,2,1)
imshow(uint8(I));
title('Image')

subplot(1,2,2)
imshow(uint8(A));
title('Forward DFT')
