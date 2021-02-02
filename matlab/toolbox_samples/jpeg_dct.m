%% Weyl-Heisenberg Bases Toolbox
% Script "jpeg_dct.m"
%% Description:
% Implements JPEG compression algorithm of a monochrome image using the 
% discrete cosine transform and evaluates the identity of the original and 
% recovered images. It also determines the degree of compression monochrome
% image.
%
%% Input
K = input('Compression factor K = ');

%% Properties
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

%% Image matrix
RGB = imread('Images/restaurant.png');
I = double(rgb2gray(RGB));
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

disp('Quantization matrix:');
disp(Z);

% block shift
r = M;
l = M;

N = fix(n./ r);
M = fix(m./ l);

% Block compression
J = zeros(n, m);
q = 0;

for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       block = A(y:y+r-1,x:x+l-1);
       Qblock = round(block ./ (K*Z));
       A(y:y+r-1,x:x+l-1) = Qblock;
       
       % summary of non-zero elements after quantization
       qblock = reshape(Qblock, [], 1);
       q = q + sum(qblock~=0);
   end
end

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
       A(y:y+r-1,x:x+l-1) = block .* (K*Z);
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
imshow(uint8(X));
title('Difference');

E = norm(X);
R = 1.0 - q ./ (n * m);
disp(['Norm of the matrices difference: ', num2str(E)]);
disp(['Compression ratio: ', num2str(R)]);