function nB = multise (n,B)
Xtemp = B;
[wm wn] = size(B);
nB = B;
for k = 1:n-1
    [M N] = size(nB); %image x's row = N

    % Process Structing Element
    SE_coodi = findcoodi(B);                   % find all the coordinate of the structuring elements

    % set the coodinate of structuring element as the central point is origin
    origin(1) = (wm+1)/2;
    origin(2) = (wn+1)/2;
    SE_coodi(:,1) = SE_coodi(:,1) - origin(1); 
    SE_coodi(:,2) = SE_coodi(:,2) - origin(2);

    Xtemp = zeros( M + wm-1,N+wn-1);

    for i = 1:size(SE_coodi(:,1))               % Structuring element's is stored as N by 2 array

        Xtemp1 = zeros(M+wm-1,N+wn-1);          % empty image X , the size is the same as Xtemp
        % (g1,g2) is coordinate
        g1 = SE_coodi(i,1) + (wm-1)/2;          % (wm-1)/2 is the radius of SE
        g2 = SE_coodi(i,2) + (wn-1)/2;          % IMAGE X SHOULD BE MOVED TO THE MIDDLE OF THE XTEMP 

        Xtemp1( g1+1:g1+M, g2+1:g2+N )= nB;      % select location and put the image X
        Xtemp = Xtemp | Xtemp1;                         
    end
    nB = Xtemp;
end
