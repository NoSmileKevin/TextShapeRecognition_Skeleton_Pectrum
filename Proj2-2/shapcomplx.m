function entropy = shapcomplx(pec)
L = length(pec);
temp=0;
for i=1:L
    if pec(i)>0 
        temp = temp-pec(i)*log2(pec(i));
    else
        temp = temp;
    end
end
entropy = temp;