clear all; close all;

 matrix = load('heart_polyh_matrix_2.mat');
 points = matrix.newmatrix(:,1:3);
 points = replaceOrigin(points);
 normal=[0 0 0];
 meshCoordinates=[0 0 0];
 
 figure;
 axis([-40,40,-40,40,-40,40])
 i=1;
 %xyzp = giveNearPoints([0 0 0],[0 0 1],points,[0 0 0],[0 0 0]);
% plot(xyzp(:,1),xyzp(:,2),'b.')
while(1)
     [leapCoordinates,normal,v1,v2]=getHandCoordinates(i);
     v1Size=size(v1);
     v1Size=v1Size(1);
     if v1Size==0
         continue;
     end
     meshCoordinates = mapCoordinates(leapCoordinates,points);
     %normal
     [n, m] = size(normal);
     [a b] = size(meshCoordinates);
     disp('n plus a');
     point = [meshCoordinates(1),meshCoordinates(2),meshCoordinates(3)];
     if((n + a) == 2)
         xyzp = giveNearPoints([meshCoordinates(1),meshCoordinates(2),meshCoordinates(3)],[normal(1) normal(2) normal(3)],points);
         [d e] = size(xyzp);
         if(d>10)
             
             d = -point*normal'; %'# dot product for less typing
             [xx,yy]=ndgrid(1:10,1:10);
             z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
              %surf(xx,yy,z)
             %hold on
              r=load('X+Y.mat');
              plot(xyzp(:,1),xyzp(:,2),'b.');
              %plot3(meshCoordinates(1),meshCoordinates(2),meshCoordinates(3),'.r')
              xlabel('X');
              ylabel('Y');
              zlabel('Z');
              hold off
            drawnow
         end
         
     end  
        i=i+1;
 end



