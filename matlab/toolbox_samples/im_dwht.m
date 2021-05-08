%% Weyl-Heisenberg Toolbox
% Script "im_dwht.m"
%% Description:
% Implements DWHT of a monochrome image.
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
M = 16;                            % frequency shifts
sigma = sigmaparam(M, 2);         % sigma parameter
L = n/M;                          % number of time shifts
a = phaseparam(M, L);             % alfa-parameter

%% Construction of transform matrix
W = weylhzh(M, L, a, sigma);
W = W';

%% Forward DWHT
A = W * I * W';
A = A * 2;

figure(2);
imshow(uint8(A));
title('Forward DWHT');

%% Backward DWHT
B = W' * A * W;
figure(3);
imshow(uint8(B));
title('Backward DWHT');

%% Subplot
figure(4)
subplot(1,2,1)
imshow(uint8(I));
title('Image')

subplot(1,2,2)
imshow(uint8(A));
title('Forward DWHT')
