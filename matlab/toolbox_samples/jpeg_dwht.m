%% Weyl-Heisenberg Bases Toolbox
% Script "jpeg_dwht.m"
%% Description:
% Implements JPEG compression algorithm of a monochrome image using the 
% discrete Weyl-Heisenberg transform and evaluates the identity of the 
% original and recovered images. It also determines the degree of 
% compression monochrome image.
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
M = 8;                % frequency shifts
sigma = 0.01;         % sigma parameter
L = n/M;              % number of time shifts
a = phaseparam(M, L); % alfa-parameter

%% Construction of transform matrix
W = weylhzc(M, L, a, sigma);
W = real(W) + imag(W);
W = W';

%% Forward DWHT
I = I - 128;
A = W * I * W';

z = [2 4 6 8 12 8 6 4]';
Z = z * z';
disp('Quantization matrix:');
disp(Z);

% block shift
r = M;
l = M;

N = fix(n./ r);
M = fix(m./ l);

% block compression
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
title('Forward DWHT');

%% Backward DWHT
% Block decompression
for i=1:N
   for j=1:M
       y = (i-1)*r+1;
       x = (j-1)*l+1;
       block = A(y:y+r-1,x:x+l-1);
       A(y:y+r-1,x:x+l-1) = block .* (K*Z);
   end
end

B = W' * A * W;
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
R = 1.0 - q ./ (n * m);
disp(['Norm of the matrices difference: ', num2str(E)]);
disp(['Compression ratio: ', num2str(R)]);