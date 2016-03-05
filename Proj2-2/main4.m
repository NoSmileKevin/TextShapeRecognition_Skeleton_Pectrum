clc,clear;
f=imread('match1.gif');
f1=imread('match3.gif');
figure(1),imshow(f,[]);

B=ones(3,3);

X = double(f);
impixelinfo;
% implement minimun boundary rectangles for each objects
MBR = minbounrec(f);
Region1 = X(MBR(1,1,1):MBR(1,2,1),MBR(2,1,1):MBR(2,2,1));
Region2 = X(MBR(1,1,2):MBR(1,2,2),MBR(2,1,2):MBR(2,2,2));
Region3 = X(MBR(1,1,3):MBR(1,2,3),MBR(2,1,3):MBR(2,2,3));
Region4 = X(MBR(1,1,4):MBR(1,2,4),MBR(2,1,4):MBR(2,2,4));

figure(2),  subplot(2,2,1), imshow(Region1); title('region1');
            subplot(2,2,2), imshow(Region2); title('region2');
            subplot(2,2,3), imshow(Region3); title('region3');
            subplot(2,2,4), imshow(Region4); title('region4');


U1 =  sizedistr(Region1,B,20); 
U2 =  sizedistr(Region2,B,20); 
U3 =  sizedistr(Region3,B,20); 
U4 =  sizedistr(Region4,B,20);

figure(3),  subplot(2,2,1), plot(U1); title('region1');
            subplot(2,2,2), plot(U2); title('region2');
            subplot(2,2,3), plot(U3); title('region3');
            subplot(2,2,4), plot(U4); title('region4');
            
 P1 = Pecstrum (Region1,B,20)
 P2 = Pecstrum (Region2,B,20)
 P3 = Pecstrum (Region3,B,20)
 P4 = Pecstrum (Region4,B,20)

 
figure(4),  subplot(2,2,1), plot(P1); title('region1');
            subplot(2,2,2), plot(P2); title('region2');
            subplot(2,2,3), plot(P3); title('region3');
            subplot(2,2,4), plot(P4); title('region4');
 
 
 SC1 = shapcomplx(P1)
 SC2 = shapcomplx(P2)
 SC3 = shapcomplx(P3)
 SC4 = shapcomplx(P4)
 
figure(5),imshow(f1,[]);
X = double(f1);
impixelinfo;
% implement minimun boundary rectangles for each objects
MBR = minbounrec(X);
Region1 = X(MBR(1,1,1):MBR(1,2,1),MBR(2,1,1):MBR(2,2,1));
Region2 = X(MBR(1,1,2):MBR(1,2,2),MBR(2,1,2):MBR(2,2,2));
Region3 = X(MBR(1,1,3):MBR(1,2,3),MBR(2,1,3):MBR(2,2,3));
Region4 = X(MBR(1,1,4):MBR(1,2,4),MBR(2,1,4):MBR(2,2,4));

figure(6),  subplot(2,2,1),imshow(Region1); title('region1');	
            subplot(2,2,2),imshow(Region2); title('region2');
            subplot(2,2,3),imshow(Region3); title('region3');
            subplot(2,2,4),imshow(Region4); title('region4');


U1r =  sizedistr(Region1,B,20);
U2r =  sizedistr(Region2,B,20);
U3r =  sizedistr(Region3,B,20);
U4r =  sizedistr(Region4,B,20);

figure(7),  subplot(2,2,1),plot(U1r); title('region1');
            subplot(2,2,2),plot(U2r); title('region2');
            subplot(2,2,3),plot(U3r); title('region3');
            subplot(2,2,4),plot(U4r); title('region4');
            
 P1r = Pecstrum (Region1,B,20)
 P2r = Pecstrum (Region2,B,20)
 P3r = Pecstrum (Region3,B,20)
 P4r = Pecstrum (Region4,B,20)

 
figure(8),  subplot(2,2,1), plot(P1r); title('region1');
            subplot(2,2,2), plot(P2r); title('region2');
            subplot(2,2,3), plot(P3r); title('region3');
            subplot(2,2,4), plot(P4r); title('region4');
            
 SC1r = shapcomplx(P1r)
 SC2r = shapcomplx(P2r)
 SC3r = shapcomplx(P3r)
 SC4r = shapcomplx(P4r)
 
C=ones(1,20);
d41 = distancef(P4,P1r,C)
d42 = distancef(P4,P2r,C) 
d43 = distancef(P4,P3r,C)
d44 = distancef(P4,P4r,C)
 
 