function Y = opening(X,B)
Y = erosion1(X,sym1(B));
Y = dilation1(Y,B);
