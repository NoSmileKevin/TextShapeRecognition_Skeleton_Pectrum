function MBR = minbounrec(X)
[M N]=size(X);
 cc = bwconncomp(X);
 lablelX = labelmatrix(cc); 
 nmMBR = max(max(lablelX));
 for n = 1:nmMBR
     k=1;
     point=[];
     for i = 1:M
         for j = 1:N
             if lablelX(i,j) == n
                point(k,1)=i;
                point(k,2)=j;
                k=k+1;
             end
         end
     end
    UppB = min(point(:,1));    % upper boundary
    LefB = min(point(:,2));    % left boundary
    
    lowB = max(point(:,1));    % lower boundary
    RigB = max(point(:,2));    % Right boundary
    
    MBR(1:2,1:2,n) = [ UppB lowB ; LefB  RigB ];
 end