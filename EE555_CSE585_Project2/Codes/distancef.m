%%%%%%%%%%%%%%%%%%%   Function distancef   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Calculate distance between two pecstrums with weighting factor C
%
% Input Variables:
%      f,fref       input two pecstrums
%      C            weighting factor 
% Returned Results:
%      dis        distance between f and fref
%
% Processing Flow:
%      1. calculate the difference with respect to different radius
%      2. multipy the corresponding weighting factor 
%      3. sum all multiplied difference
%      4. get square root of this sum
%  Restrictions/Notes:
%      None  
%
%  The following functions are called:
%      None
%
%  Author:      WEI-KAI SU
%  Date:        02/15/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dis = distancef(f,fref,C)
L = length(f);
dsq=0;

for i = 1:L
    dsq = dsq + C(i)*( f(i) - fref(i) )^2;
end

dis = sqrt( dsq );