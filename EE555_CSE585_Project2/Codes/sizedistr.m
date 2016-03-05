%%%%%%%%%%%%%%%%%%%   Function sizedistr   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Calculate size distribution of an object
%
% Input Variables:
%      ob      Input 2D object to be complemented
%      B      Structuring element
%      rmax   The maximum of radius of the input structuring element
%      
% Returned Results:
%      U       size distribution of input object
%
% Processing Flow:
%      1.  build up a loop to increase radius until to its maximum
%              a. In this loop, do opening of X by structuring element rB  
%                 of different (increasing) radius
%              b. measure the ares of the object aftering opening
% 
%  Restrictions/Notes:
%      None  
%
%  The following functions are called:
%      opening, multise
%
%  Author:      WEI-KAI SU
%  Date:        02/16/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function U = sizedistr(ob,B,rmax)
for r = 1:rmax
    rB = multise(r,B);      % get rB, that is, r times of B
    Xtemp = opening(ob,rB); 
    U(r) = sum(sum(Xtemp)); % measure the area after opening
end