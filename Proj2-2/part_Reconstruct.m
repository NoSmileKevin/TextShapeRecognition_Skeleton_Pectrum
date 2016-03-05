function XkB = part_Reconstruct( k, N, f, B )


[Row, Column] = size(f)
XkB = zeros(Row, Column)

for n = k:N
    nB = multise (n,B);
    
    eroResult = erosion1 (f,nB);
    eroROpening = opening(eroResult,B);
    
    Sn = eroResult & clm(eroROpening); %& is set operation  ; && is logical operation
    
    dilaResult = dilation1(Sn, nB);
    XkB = XkB | dilaResult;
end




end

