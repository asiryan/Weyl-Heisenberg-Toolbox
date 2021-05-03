%% Weyl-Heisenberg Bases Toolbox
% Script "jpeg_dwht_color.m"
%% Description:
% Implements JPEG compression algorithm of a color image using the 
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
M = 8;                            % frequency shifts
sigma = sigmaparam(M, 2);         % sigma parameter
L = n/M;                          % number of time shifts
a = phaseparam(M, L);             % alfa-parameter

% Construction of transform matrix
W = weylhzc(M, L, a, sigma);
W = real(W) - imag(W);
W = W';


%% Forward DWHT
YCbCr = YCbCr - 128;
YCbCr_DWHT = zeros(n, m, p);

for k=1:p
    YCbCr_DWHT(:,:,k) = bdt(YCbCr(:,:,k), W);
end

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

% Block compression
Nnz = 0;

for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       
       for k=1:p
           block = YCbCr_DWHT(y:y+r-1,x:x+l-1,k);
           Qblock = round(block ./ (R*Z));
           YCbCr_DWHT(y:y+r-1,x:x+l-1,k) = Qblock;

           % summary of non-zero elements after quantization
           qblock = reshape(Qblock, [], 1);
           Nnz = Nnz + sum(qblock~=0);
       end
   end
end

after = huffparam(YCbCr_DWHT);
disp('Huffman parameter (after compression)');
disp(after);

figure(2);
imshow(uint8(YCbCr_DWHT));
title('Forward DWHT');

%% Backward DWHT
% Block decompression
for i=1:N
   for j=1:M
       for k=1:p
           y = (i-1)*r+1;
           x = (j-1)*l+1;
           block = YCbCr_DWHT(y:y+r-1,x:x+l-1,k);
           YCbCr_DWHT(y:y+r-1,x:x+l-1,k) = block .* (R*Z);
       end
   end
end

for k=1:p
    YCbCr_DWHT(:,:,k) = ibdt(YCbCr_DWHT(:,:,k), W);
end


YCbCr_DWHT = YCbCr_DWHT + 128;
RGB_DWHT = ycbcr2rgb(uint8(YCbCr_DWHT));

figure(3);
imshow(RGB_DWHT);
title('Backward DWHT');

%% Properties
X = sum(double(RGB) - double(RGB_DWHT), p);
figure(4);
imshow(uint8(X*2));
title('Difference');

E = norm(X);
K = 1.0 - Nnz ./ (n * m * p);
PSNR = psnr(uint8(RGB_DWHT), uint8(RGB));
bit = 1.0 - after/before;

disp(['Compression ratio K: ', num2str(K)]);
disp(['Bit criteria T: ', num2str(bit)]);
disp(['PSNR (dB): ', num2str(PSNR)]);
disp(['Quality losses, E: ', num2str(E)]);