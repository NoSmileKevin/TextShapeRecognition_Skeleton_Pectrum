%%%%%%%%%%%%%%%%%%%   Function shapcomplx   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Calculate the shape complexity of a object
%
% Input Variables:
%     pec      Pattern spectrum ( Pecstrum ) of a object measured
%      
% Returned Results:
%     entropy  entropy of object measured
%
% Processing Flow:
%      1.  get the length of input pecstrum 
%      2.  calculate the entropy of input pecstrum
%         
%  Restrictions/Notes:
%      This function should take zero for special consideraton since that
%      0*log(0) is undefined in Matlab. There, we should exclude zero when
%      calculate entropy.
%
%  The following functions are called:
%      None
%
%  Author:      WEI-KAI SU
%  Date:        02/18/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function entropy = shapcomplx(pec)
L = length(pec);
temp=0;
for i=1:L
    if pec(i)>0 
        temp = temp-pec(i)*log2(pec(i));
    else
        temp = temp; % when zero appears, remain the value of sum
    end
end
entropy = temp;