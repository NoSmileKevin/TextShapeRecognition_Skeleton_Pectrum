clc,clear;
f1 = imread('shadow1.gif');
f2 = imread('shadow1rotated.gif');
X1 = double(f1);    % 
X2 = double(f2);    
B=ones(3,3);
% In problem 3.(b), since we just have to identify four solid objects in shadow1.jpg  to
% corresponding objects in shadow1rotated.gif, we allpy the conditional
% dilation method we used in the first guestion to remove the hollow
% objects in these two images: 
% First, from observing both hollow and solid objects, we can choose 
% a structuring element B1 (pixels 25 X 5),through opening
% original image ( shadow1.gif ), and remove hollow object,
% which thick are less less 25 X 5, and remain some part of solid ones.
% Second, through using dilating the result of first step by B2 (5x5), we
% can get a image only remaining these four solid objects. The reason why
% we choose B2 (5x5) is that a square structuring object can dilate a image
% in 8-direction, that is, left,right,upper,lower,and two diagonal
% direction. In additon, 5x5 can reconstruct the solid objects more quickly
% than a 3x3 structuring element.
B1 = ones(25,5);    % for opening in order to remove hollow object and remain some part of solid ones.
Xs1 = opening(X1,B1);   
Xs2 = opening(X2,B1);
B2 = ones(5,5);     % for dilation of the opened image in 8-direction.
% product two images only with solid objects by conditional dilation
 for i = 1:25
 Xs1 = dilation1(Xs1,B2) & X1;
 Xs2 = dilation1(Xs2,B2) & X2;
 end
figure(1), imshow(Xs1);
impixelinfo;
figure(2), imshow(Xs2);
impixelinfo;

% implement minimun boundary rectangles for each objects
MBR1 = minbounrec(Xs1); % get the boundaries of solid object in shadow1.gif
MBR2 = minbounrec(Xs2); % get the boundaries of solid object in shadow1rotated.gif

object1 = Xs1(MBR1(1,1,1):MBR1(1,2,1),MBR1(2,1,1):MBR1(2,2,1));
object2 = Xs1(MBR1(1,1,2):MBR1(1,2,2),MBR1(2,1,2):MBR1(2,2,2));
object3 = Xs1(MBR1(1,1,3):MBR1(1,2,3),MBR1(2,1,3):MBR1(2,2,3));
object4 = Xs1(MBR1(1,1,4):MBR1(1,2,4),MBR1(2,1,4):MBR1(2,2,4));
% show 4 solid objects in shadow1.gif
figure(3),  subplot(2,2,1), imshow(object1); title('object1');
            subplot(2,2,2), imshow(object2); title('object2');
            subplot(2,2,3), imshow(object3); title('object3');
            subplot(2,2,4), imshow(object4); title('object4');
% calculate size distribution                       
U1 =  sizedistr(object1,B,20); 
U2 =  sizedistr(object2,B,20); 
U3 =  sizedistr(object3,B,20); 
U4 =  sizedistr(object4,B,20);
% show size distribution
figure(4),  subplot(2,2,1), stem(U1); title('object1'); 
            subplot(2,2,2), stem(U2); title('object2'); 
            subplot(2,2,3), stem(U3); title('object3'); 
            subplot(2,2,4), stem(U4); title('object4'); 
%  calculate pecstrum                        
 P1 = Pecstrum (object1,B,20);
 P2 = Pecstrum (object2,B,20);
 P3 = Pecstrum (object3,B,20);
 P4 = Pecstrum (object4,B,20);
%  show pecstrum
figure(5),  subplot(2,2,1), stem(P1); title('object1'); axis([1 20 0 0.5]);
            subplot(2,2,2), stem(P2); title('object2'); axis([1 20 0 0.5]);
            subplot(2,2,3), stem(P3); title('object3'); axis([1 20 0 0.5]);
            subplot(2,2,4), stem(P4); title('object4'); axis([1 20 0 0.5]);

object1 = Xs2(MBR2(1,1,1):MBR2(1,2,1),MBR2(2,1,1):MBR2(2,2,1));
object2 = Xs2(MBR2(1,1,2):MBR2(1,2,2),MBR2(2,1,2):MBR2(2,2,2));
object3 = Xs2(MBR2(1,1,3):MBR2(1,2,3),MBR2(2,1,3):MBR2(2,2,3));
object4 = Xs2(MBR2(1,1,4):MBR2(1,2,4),MBR2(2,1,4):MBR2(2,2,4));
% show 4 solid objects in shadow1rotated.gif
figure(6),  subplot(2,2,1), imshow(object1); title('object1');
            subplot(2,2,2), imshow(object2); title('object2');
            subplot(2,2,3), imshow(object3); title('object3');
            subplot(2,2,4), imshow(object4); title('object4');
% calculate size distribution
U1r =  sizedistr(object1,B,20); 
U2r =  sizedistr(object2,B,20); 
U3r =  sizedistr(object3,B,20); 
U4r =  sizedistr(object4,B,20);
% show size distribution
figure(7),  subplot(2,2,1), stem(U1r); title('object1');
            subplot(2,2,2), stem(U2r); title('object2');
            subplot(2,2,3), stem(U3r); title('object3');
            subplot(2,2,4), stem(U4r); title('object4');
% calculate pecstrum                       
 P1r = Pecstrum (object1,B,20);
 P2r = Pecstrum (object2,B,20);
 P3r = Pecstrum (object3,B,20);
 P4r = Pecstrum (object4,B,20);
% show pecstrum
figure(8),  subplot(2,2,1), stem(P1r); title('object1'); axis([1 20 0 0.5]);
            subplot(2,2,2), stem(P2r); title('object2'); axis([1 20 0 0.5]);
            subplot(2,2,3), stem(P3r); title('object3'); axis([1 20 0 0.5]);
            subplot(2,2,4), stem(P4r); title('object4'); axis([1 20 0 0.5]);
            
C = ones(20,1);

%  RefPecstrumArray(1,:)=P1r;
%  RefPecstrumArray(2,:)=P2r;
%  RefPecstrumArray(3,:)=P3r;
%  RefPecstrumArray(4,:)=P4r;
%  
% Matched_ref_for_object1 = bestmatch (P1,RefPecstrumArray,C)
% Matched_ref_for_object2 = bestmatch (P2,RefPecstrumArray,C)
% Matched_ref_for_object3 = bestmatch (P3,RefPecstrumArray,C)
% Matched_ref_for_object4 = bestmatch (P4,RefPecstrumArray,C)

% distance2bwt3 = distancef(P2,P3r,C)
% distance3bwt3 = distancef(P3,P3r,C)
% distance4bwt3 = distancef(P4,P3r,C)
% 
% distance2bwt1 = distancef(P2,P1r,C)
% distance2bwt2 = distancef(P2,P2r,C)
% distance2bwt4 = distancef(P2,P4r,C) 
% 
% distance3bwt1 = distancef(P3,P1r,C)
% distance3bwt2 = distancef(P3,P2r,C)
% distance3bwt4 = distancef(P3,P4r,C) 


Matched_object_for_ref1 = bestmatch1 ([P1;P2;P3;P4],P1r,C) % 3
Matched_object_for_ref2 = bestmatch1 ([P1;P2;P3;P4],P2r,C) % 4 --> should not be 4 
Matched_object_for_ref3 = bestmatch1 ([P1;P2;P3;P4],P3r,C) % 4 
Matched_object_for_ref4 = bestmatch1 ([P1;P2;P3;P4],P4r,C) % 1

distance_ob4_ref2 = distancef(P4,P2r,C) % 1.7657
distance_ob4_ref3 = distancef(P4,P3r,C) % 0.1666

distance_ob2_ref1 = distancef(P2,P1r,C)  % 0.6038
distance_ob2_ref2 = distancef(P2,P2r,C)  % 0.5145
distance_ob2_ref3 = distancef(P2,P3r,C)  % 0.3024
distance_ob2_ref4 = distancef(P2,P4r,C)  % 0.4058

distance_ob3_ref1 = distancef(P3,P1r,C) % 0.5061
distance_ob4_ref3 = distancef(P4,P3r,C) % 0.0469
distance_ob1_ref4 = distancef(P1,P4r,C) % 0.1171


