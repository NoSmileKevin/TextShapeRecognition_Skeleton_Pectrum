%%%%%%%%%%%%%%%%%%%   Function shapcomplx   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      calculate pecstrum of image X
%
% Input Variables:
%     X     Pattern spectrum ( Pecstrum ) of a object measured
%     B     structuring element   
%     rmax  maximum radius of structuring element B
%      
% Returned Results:
%     Pec  Pecstrum of image X
%
% Processing Flow:
%      1.  calculate nB and n+1B
%      2.  implement openings of X by nB and n+1B
%      3.  get the difference of openings of X by nB and n+1B
%         
%  Restrictions/Notes:
%      None
%
%  The following functions are called:
%      multise, opening
%
%  Author:      WEI-KAI SU
%  Date:        02/18/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Pec = Pecstrum (X,B,rmax)
for r = 1:rmax
    nB = multise(r,B);      % calculate nB
    n1B = multise(r+1,B);   % calculate n+1B
    XnBop = opening(X,nB);  % opening of X by nB
    Xn1Bop = opening(X,n1B); % opening of X by n+1B
    Pec(r) = ( sum( sum(XnBop) ) - sum( sum(Xn1Bop) ) ) / sum( sum(X) );
end