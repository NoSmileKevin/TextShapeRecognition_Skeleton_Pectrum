%%%%%%%%%%%%%%%%%%%   Function part_Reconstruct   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     implement Partial Reconstruction
%
% Input Variables:
%     k   lower limit of radiu of structuring element
%     N   upper limit of radiu of structuring element
%     f   input 2-D MxN binary image
%     B   structuring element
%      
% Returned Results:
%     Partial Reconstruction of image f
%
% Processing Flow:
%      1.  calculate Sn
%      2.  implement dilation of Sn and sk(n)
%         
%  Restrictions/Notes:
%      None
%
%  The following functions are called:
%      erosion1, opening, dilation1
%
%  Author:      WEI-KAI SU
%  Date:        02/18/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function XkB = part_Reconstruct( k, N, f, B )

[Row, Column] = size(f);
XkB = zeros(Row, Column);

for n = k:N
    nB = multise (n,B);
    eroResult = erosion1 (f,nB);
    eroROpening = opening(eroResult,B);  
    Sn = eroResult & clm(eroROpening); % & is set operation  ; && is logical operation
    dilaResult = dilation1(Sn, nB);
    XkB = XkB | dilaResult;
end




end

