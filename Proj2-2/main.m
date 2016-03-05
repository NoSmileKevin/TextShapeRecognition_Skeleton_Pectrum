clc,clear;
f=imread('TextExcerpt.gif');
X = threholdv(f,20);
figure(1),imshow(X);
X=clm(X);
impixelinfo;
B=ones(19,1);
B2=ones(3,3);

X0=opening(X,B);
figure(2),imshow(X0);

X1=dilation1(X0,B2);
X1=X1&X;
figure(3),imshow(X1);

X2=dilation1(X1,B2) & X;
figure(4),imshow(X2);

X3=dilation1(X2,B2) & X;
figure(5),imshow(X3);

X4=dilation1(X3,B2) & X;
figure(6),imshow(X4);

X5=dilation1(X4,B2) & X;
figure(7),imshow(X5);

X6=dilation1(X5,B2) & X;
figure(8),imshow(X6);

X6=dilation1(X5,B2) & X;
figure(9),imshow(X6);

X7=dilation1(X6,B2) & X;
figure(10),imshow(X7);

X8=dilation1(X7,B2) & X;
figure(11),imshow(X8);

X9=dilation1(X8,B2) & X;
figure(12),imshow(X9);

X10=dilation1(X9,B2) & X;
figure(13),imshow(X10);

X11=dilation1(X10,B2) & X;
figure(14),imshow(X11);