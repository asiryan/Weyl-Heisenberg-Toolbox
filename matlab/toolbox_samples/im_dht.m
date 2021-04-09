%% Weyl-Heisenberg Bases Toolbox
% Script "im_dht.m"
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

%% Forward DHT
A = W * I * W';
A = real(A) - imag(A);
A = A * 2;

figure(2);
imshow(uint8(A));
title('Forward DHT');

%% Backward DHT
B = W' * A * W;
figure(3);
imshow(uint8(B));
title('Backward DHT');

%% Subplot
figure(4)
subplot(1,2,1)
imshow(uint8(I));
title('Image')

subplot(1,2,2)
imshow(uint8(A));
title('Forward DHT')
