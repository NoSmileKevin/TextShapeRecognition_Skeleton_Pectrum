clc,clear;
% For question 3, we have several works to do: First, we have to find
% minimum boundary rectangles in match1.gif for each object,clover, spade,
% steer, and airplane, respectively. We implement this operation in
% minbounrec.m: we use build-in functions built-in function,bwconncomp and labelmatrix, 
% divide the whole image to four different labeded regions, and we define
% these four regions as four distinct objects.
% Second, we use the formulas expressed through L6-11 to L6-15 to calculate size
% distribution, pattern spectrum and shape complexity, and the corresponding operation
% shown in sizedistr.m, Pecstrum.m and shapcomplx.m, respectively. In
% addition, we find the most complex object in match1 is airplane.
% Third, we implement the method described in L6-15 to decide what is best
% matching objects between match1 and mathc3. These operation is realized
% in  bestmatch1.In addition, since we have no special concern, we set all
% complement to 1 in C.

f=imread('match1.gif');
f1=imread('match3.gif');
figure(1),imshow(f,[]);

B=ones(3,3);

X = double(f);
impixelinfo;

% implement minimun boundary rectangles for each objects
MBR = minbounrec(X);

object1 = X(MBR(1,1,1):MBR(1,2,1),MBR(2,1,1):MBR(2,2,1));
object2 = X(MBR(1,1,2):MBR(1,2,2),MBR(2,1,2):MBR(2,2,2));
object3 = X(MBR(1,1,3):MBR(1,2,3),MBR(2,1,3):MBR(2,2,3));
object4 = X(MBR(1,1,4):MBR(1,2,4),MBR(2,1,4):MBR(2,2,4));

% show 4 objects
figure(2),  subplot(2,2,1), imshow(object1); title('object1');
            subplot(2,2,2), imshow(object2); title('object2');
            subplot(2,2,3), imshow(object3); title('object3');
            subplot(2,2,4), imshow(object4); title('object4');

% calculate size distributions of the objects
U1 =  sizedistr(object1,B,20); 
U2 =  sizedistr(object2,B,20); 
U3 =  sizedistr(object3,B,20); 
U4 =  sizedistr(object4,B,20);
% show size distributions
figure(3),  subplot(2,2,1), stem(U1); title('object1');
            subplot(2,2,2), stem(U2); title('object2');
            subplot(2,2,3), stem(U3); title('object3');
            subplot(2,2,4), stem(U4); title('object4');
 % calculate pecstrum of the objects           
 P1 = Pecstrum (object1,B,20);
 P2 = Pecstrum (object2,B,20);
 P3 = Pecstrum (object3,B,20);
 P4 = Pecstrum (object4,B,20);

 % show pecstrum
figure(4),  subplot(2,2,1), stem(P1); title('object1'); axis([1 20 0 0.5]);
            subplot(2,2,2), stem(P2); title('object2'); axis([1 20 0 0.5]);
            subplot(2,2,3), stem(P3); title('object3'); axis([1 20 0 0.5]);
            subplot(2,2,4), stem(P4); title('object4'); axis([1 20 0 0.5]);
%  calculate shape complexity
 SC1 = shapcomplx(P1)
 SC2 = shapcomplx(P2)
 SC3 = shapcomplx(P3)
 SC4 = shapcomplx(P4)
 
figure(5),imshow(f1,[]);
X = double(f1);
impixelinfo;
% implement minimun boundary rectangles for each objects
MBR = minbounrec(X);
object1 = X(MBR(1,1,1):MBR(1,2,1),MBR(2,1,1):MBR(2,2,1));
object2 = X(MBR(1,1,2):MBR(1,2,2),MBR(2,1,2):MBR(2,2,2));
object3 = X(MBR(1,1,3):MBR(1,2,3),MBR(2,1,3):MBR(2,2,3));
object4 = X(MBR(1,1,4):MBR(1,2,4),MBR(2,1,4):MBR(2,2,4));

% show 4 objects
figure(6),  subplot(2,2,1),imshow(object1); title('object1');	
            subplot(2,2,2),imshow(object2); title('object2');
            subplot(2,2,3),imshow(object3); title('object3');
            subplot(2,2,4),imshow(object4); title('object4');
% calculate size distributions of the objects
U1r =  sizedistr(object1,B,20);
U2r =  sizedistr(object2,B,20);
U3r =  sizedistr(object3,B,20);
U4r =  sizedistr(object4,B,20);
% show size distributions
figure(7),  subplot(2,2,1),stem(U1r); title('object1'); 
            subplot(2,2,2),stem(U2r); title('object2'); 
            subplot(2,2,3),stem(U3r); title('object3'); 
            subplot(2,2,4),stem(U4r); title('object4'); 
            
 % calculate pecstrum of the objects         
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
C = [ 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

Matched_object_for_ref1 = bestmatch1 ([P1;P2;P3;P4],P1r,C) 
Matched_object_for_ref2 = bestmatch1 ([P1;P2;P3;P4],P2r,C)
Matched_object_for_ref3 = bestmatch1 ([P1;P2;P3;P4],P3r,C)
Matched_object_for_ref4 = bestmatch1 ([P1;P2;P3;P4],P4r,C) 

