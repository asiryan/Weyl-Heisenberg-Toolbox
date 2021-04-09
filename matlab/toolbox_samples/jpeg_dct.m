%% Weyl-Heisenberg Bases Toolbox
% Script "jpeg_dct.m"
%% Description:
% Implements JPEG compression algorithm of a monochrome image using the 
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
RGB = imread('Images/barbara.png');
I = double(rgb2gray(RGB));
%before = huffparam(I);
%disp('Huffman parameter (before compression)');
%disp(before);

figure(1);
imshow(uint8(I));
title('Image');
[n, m] = size(I);

%% Basis params
M = 8;
W = dctmtx(M);

%% Forward DCT
I = I - 128;
A = bdt(I, W);

Z = [16,11,10,16,24,40,51,61;
    12,12,14,19,26,58,60,55;
    14,13,16,24,40,57,69,56;
    14,17,22,29,51,87,80,62;
    18,22,37,56,68,109,103,77;
    24,35,55,64,81,104,113,92;
    49,64,78,87,103,121,120,101;
    72,92,95,98,112,100,103,99];
Z = 1;

disp('Quantization matrix:');
disp(Z);

% block shift
r = M;
l = M;

N = fix(n./ r);
M = fix(m./ l);

% Block compression
Nnz = 0;
stream = [];

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
       
       % stream filling (only theoretical)
%        for k=1:length(qblock)
%            if (qblock(k)~=0)
%                stream = [stream qblock(k)];
%            end
%        end
   end
end

%after = huffparam(stream);
%disp('Huffman parameter (after compression)');
%disp(after);

figure(2);
imshow(uint8(A));
title('Forward DCT');

%% Backward DCT
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
title('Backward DCT');

%% Properties
I = I + 128;
X = I - B;
figure(4);
imshow(uint8(X*2));
title('Difference');

E = norm(X);
K = 1.0 - Nnz ./ (n * m);
PSNR = psnr(uint8(B), uint8(I));
%bit = 1.0 - after/before;

disp(['Compression ratio K: ', num2str(K)]);
%disp(['Bit criteria T: ', num2str(bit)]);
disp(['PSNR (dB): ', num2str(PSNR)]);
disp(['Quality losses, E: ', num2str(E)]);