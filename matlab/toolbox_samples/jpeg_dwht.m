%% Weyl-Heisenberg Bases Toolbox
% Script "jpeg_dwht.m"
%% Description:
% Implements JPEG compression algorithm of a monochrome image using the 
% discrete Weyl-Heisenberg transform and evaluates the identity of the 
% original and recovered images. It also determines the degree of 
% compression monochrome image.
%
%% Input
R = input('Compression factor R = ');

%% Properties
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

%% Image matrix
RGB = imread('Images/barbara.png');

figure(1);
imshow(uint8(I));
title('Image');

%% RGB 2 Gray
I = double(rgb2gray(RGB));
[n, m] = size(I);

before = huffparam(I);
disp('Huffman parameter (before compression)');
disp(before);

%% Basis params
M = 8;                            % frequency shifts
sigma = sigmaparam(M, 2);         % sigma parameter
L = n/M;                          % number of time shifts
a = phaseparam(M, L);             % alfa-parameter

% Construction of transform matrix
W = weylhzc(M, L, a, sigma);
W = real(W) - imag(W);
W = W';

%% Forward DWHT
I = I - 128;
A = bdt(I, W);

%% Quantization
z = [2:2:M];
z = [z flip(z)]'; 
Z = 2 * (z * z');

disp('Quantization matrix:');
disp(Z);

% block shift
r = M;
l = M;

N = fix(n./ r);
M = fix(m./ l);

% block compression
Nnz = 0;

for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       block = A(y:y+r-1,x:x+l-1);
       Qblock = round(block ./ (R*Z));
       A(y:y+r-1,x:x+l-1) = Qblock;
       
       % summary of non-zero elements after quantization
       qblock = reshape(Qblock, [], 1);
       Nnz = Nnz + sum(qblock~=0);
   end
end

after = huffparam(A);
disp('Huffman parameter (after compression)');
disp(after);

figure(2);
imshow(uint8(A));
title('Forward DWHT');

%% Backward DWHT
% Block decompression
for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       block = A(y:y+r-1,x:x+l-1);
       A(y:y+r-1,x:x+l-1) = block .* (R*Z);
   end
end

B = ibdt(A, W);
B = B + 128;
figure(3);
imshow(uint8(B));
title('Backward DWHT');

%% Properties
I = I + 128;
X = I - B;
figure(4);
imshow(uint8(X));
title('Difference');

E = norm(X);
K = 1.0 - Nnz ./ (n * m);
PSNR = psnr(uint8(B), uint8(I));
bit = 1.0 - after/before;

disp(['Compression ratio K: ', num2str(K)]);
disp(['Bit criteria T: ', num2str(bit)]);
disp(['PSNR (dB): ', num2str(PSNR)]);
disp(['Quality losses, E: ', num2str(E)]);