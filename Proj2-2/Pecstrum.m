function Pec = Pecstrum (X,B,rmax)
for r = 1:rmax
    nB = multise(r,B);
    n1B = multise(r+1,B);
    XnBop = opening(X,nB);
    Xn1Bop = opening(X,n1B);
    Pec(r) = ( sum( sum(XnBop) ) - sum( sum(Xn1Bop) ) ) / sum( sum(X) );
end