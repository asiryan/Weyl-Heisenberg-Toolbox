%% Weyl-Heisenberg Bases Toolbox
% Script "jpeg_dct_color.m"
%% Description:
% Implements JPEG compression algorithm of a color image using the 
% discrete cosine transform and evaluates the identity of the original and 
% recovered images. It also determines the degree of compression monochrome
% image.
%
%% Input
R = input('Compression factor R = ');

%% Properties
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman');
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

%% Image matrix
RGB = imread('Images/venice.png');

figure(1);
imshow(RGB);
title('Image');

%% RGB to YCbCr
YCbCr = double(rgb2ycbcr(RGB));
[n, m, p] = size(YCbCr);

before = huffparam(YCbCr);
disp('Huffman parameter (before compression)');
disp(before);

%% Basis params
M = 8;
W = dctmtx(M);

%% Forward DCT
YCbCr = YCbCr - 128;
YCbCr_DCT = zeros(n, m, p);

for k=1:p
    YCbCr_DCT(:,:,k) = bdt(YCbCr(:,:,k), W);
end

%% Quantization
Z = [16,11,10,16,24,40,51,61;
    12,12,14,19,26,58,60,55;
    14,13,16,24,40,57,69,56;
    14,17,22,29,51,87,80,62;
    18,22,37,56,68,109,103,77;
    24,35,55,64,81,104,113,92;
    49,64,78,87,103,121,120,101;
    72,92,95,98,112,100,103,99];

disp('Quantization matrix:');
disp(Z);

% block shift
r = M;
l = M;

N = fix(n./ r);
M = fix(m./ l);

% Block compression
Nnz = 0;

for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       
       for k=1:p
           block = YCbCr_DCT(y:y+r-1,x:x+l-1,k);
           Qblock = round(block ./ (R*Z));
           YCbCr_DCT(y:y+r-1,x:x+l-1,k) = Qblock;

           % summary of non-zero elements after quantization
           qblock = reshape(Qblock, [], 1);
           Nnz = Nnz + sum(qblock~=0);
       end
   end
end

after = huffparam(YCbCr_DCT);
disp('Huffman parameter (after compression)');
disp(after);

figure(2);
imshow(uint8(YCbCr_DCT));
title('Forward DCT');

%% Backward DCT
% Block decompression
for i=1:N
   for j=1:M
       for k=1:p
           y = (i-1)*r+1;
           x = (j-1)*l+1;
           block = YCbCr_DCT(y:y+r-1,x:x+l-1,k);
           YCbCr_DCT(y:y+r-1,x:x+l-1,k) = block .* (R*Z);
       end
   end
end

for k=1:p
    YCbCr_DCT(:,:,k) = ibdt(YCbCr_DCT(:,:,k), W);
end


YCbCr_DCT = YCbCr_DCT + 128;
RGB_DCT = ycbcr2rgb(uint8(YCbCr_DCT));

figure(3);
imshow(RGB_DCT);
title('Backward DCT');

%% Properties
X = sum(double(RGB) - double(RGB_DCT), p);
figure(4);
imshow(uint8(X*2));
title('Difference');

E = norm(X);
K = 1.0 - Nnz ./ (n * m * p);
PSNR = psnr(uint8(RGB_DCT), uint8(RGB));
bit = 1.0 - after/before;

disp(['Compression ratio K: ', num2str(K)]);
disp(['Bit criteria T: ', num2str(bit)]);
disp(['PSNR (dB): ', num2str(PSNR)]);
disp(['Quality losses, E: ', num2str(E)]);