%%%%%%%%%%%%%%%%%%%   Function opening   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      implement opening operation for input X by a structuring element
%
% Input Variables:
%      X     MxN input 2-D binary image 
%      B     wm x wn structuring element
%      
% Returned Results:
%      Y     MxN output 2-D binary image after opening
%
% Processing Flow:
%      1.  implement erosion operation of X by B
%      2.  implement erosion operation of X by B;
%          in other word, implement Minkowski set addition of X by B
% 
%  Restrictions/Notes:
%      None
%
%  The following functions are called:
%      erosion1, dilation1, sym1
%
%  Author:      WEI-KAI SU
%  Date:        02/15/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Y = opening(X,B)
Y = erosion1(X,B);
Y = dilation1(Y,sym1(B));
