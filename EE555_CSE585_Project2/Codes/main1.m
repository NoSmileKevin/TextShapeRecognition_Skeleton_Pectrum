clc,clear;
f=imread('TextExcerpt.gif');
% Thresholding, by observing the grey-level distribution in TextExcerp.gif
% , we find the background at 25 level, thus we choose critical value = 20
X = threholdv(f,20);
figure(1),imshow(X); % X is a binary image
% Inversing image, for computational conveniency, we inverse the image make
% "White" is frontviwe while "Black" is background.
X=clm(X);
figure(2),imshow(X);
impixelinfo;
% From observing, we find the height of short characters is less and equal
% to 14, and of tall characters is greater and equal to 18. Therefore, at
% first we choose a structuring element B1 to be 18x1 in order to make part
% of tall characters remained. Then, choose structuring element B2 to be
% 3x3 to achieve conditional dilation.

B1 = ones(18,1);  % B1 is a structuring element for opening

B2 = ones(3,3);   % B2 is a structuring element for conditional dilation
                  % a 3x3 structuring element can make sure the objects
                  % "dilation in 8-direction.
X0 = opening(X,B1);
figure,imshow(X0);
Xn = X0;
% Conditional Dilation
n = 21; % to level 21
for i=1:n
Xn = dilation1(Xn,B2) & X ;  
figure,imshow(Xn);
end


