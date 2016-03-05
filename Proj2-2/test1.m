clc,clear;
f=imread('TextExcerpt.gif');
X = threholdv(f,20);
X=clm(X);
figure,imshow(X)
k=imopen(X,ones(19,1));
figure,imshow(k)
ke=imerode(X,ones(19,1));
figure,imshow(ke)
kk=imreconstruct(ke,k);
figure,imshow(kk)

