%%%%%%%%%%%%%%%%%%%   Function minbounrec   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Find boundaries of minimun boundary rectangles in input image X
%
% Input Variables:
%      X       MxN input 2D binary image
%      
% Returned Results:
%     MBR      2x2xk matrix, that is, 2 rows, 2 columns and k layers.
%              the first row record the boundaris in y-direction; 
%              first columns is upper boundary,and the other is lower boundary.
%              the second row record the boundaris in x-direction; 
%              first columns is left boundary,and the other is right boundary.
%              k means the number of all minimun boundary rectangle
%
% Processing Flow:
%      1.  get the dimension of input image X
%      2.  use two built-in function,bwconncomp and labelmatrix, to get a
%          labeled image
%      3.  build up a forloop to get all coordinates with different lablel
%          number and find the boundaries of these lableded region(object)
% 
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      bwconncomp, labelmatrix
%
%  Author:      WEI-KAI SU
%  Date:        02/15/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
 