function U = sizedistr(X,B,rmax)
for r = 1:rmax
    nB = multise(r,B);
    Xtemp = opening(X,nB);
    U(r)=sum(sum(Xtemp));
end