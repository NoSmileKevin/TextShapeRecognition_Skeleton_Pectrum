function dis=distancef(f,fref,C)
L = length(f);
dsq=0;

for i = 1:L
    dsq = dsq + C(i)*( f(i) - fref(i) )^2;
end

dis = sqrt( dsq );