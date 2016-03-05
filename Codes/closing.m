function Y = closing(X,B)
Y = dilation1(X,sym1(B));
Y = erosion1(Y,B);
