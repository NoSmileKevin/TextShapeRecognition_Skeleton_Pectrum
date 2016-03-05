clc,clear;

f = imread('bear.gif'); % load bear.gif as f
% f = imread('penn256'); % load penn256.gif as f
f = double(f);

figure(1),imtool(f);
B = ones(3,3); % B is structuring element: 3 by 3 square
N = 0;
% Find the possible largest N
for n = 1:30  %for penn256, N is 6; for bear, N is 30
    nB = multise (n,B);
    
    eroResult = erosion1 (f,nB);
      
    if ( sum(sum( eroResult)) == 0 )
        N = n; 
        break;        
    end
    
end

% sk(X) = U Sn(X); Sn(X) = (X erosion nB) - (X erosion nB)B  
%      = (X erosion nB) interect ( (X erosion nB)B)^complement
% calculate morphological skeleton 
[Row, Column] = size(f);
Sk = zeros(Row, Column);
XB = opening(f,B);
S0 = f & clm(XB);
Sk = Sk | S0;  % S0
figure(2), imshow(Sk)
for n = 1:N
    nB = multise (n,B);
    eroResult = erosion1 (f,nB);
    eroROpening = opening(eroResult,B);  
    Sn = eroResult & clm(eroROpening); % & is set operation  ; && is logical operation   
    Sk = Sk | Sn;  % union of Sn and Sn-1
end
figure(2), imshow(Sk)

% implement partial reconstruction
% X2B
XkB = part_Reconstruct(2, N, f, B); % part_Reconstruct(k, N, f, B) 
figure(3), imshow(XkB)
% X3B
XkB = part_Reconstruct(3, N, f, B); % part_Reconstruct(k, N, f, B) 
figure(4), imshow(XkB)
% X4B
XkB = part_Reconstruct(4, N, f, B); % part_Reconstruct(k, N, f, B) 
figure(5), imshow(XkB)

%Verify by opening
% X2B
nB = multise (2,B);
y1 = opening(f,nB)
figure(6), imshow(y1)
% X3B
nB = multise (3,B);
y2 = opening(f,nB)
figure(7), imshow(y2)
% X4B
nB = multise (4,B);
y3 = opening(f,nB)
figure(8), imshow(y3)


