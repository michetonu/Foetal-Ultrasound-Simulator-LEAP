function leap_points(handles)

%fv = stlread(figure);
% load('heart_polyh_matrix_2.mat');
% points = newmatrix(:,1:3);
% points = replaceOrigin(points);
% xyzp = giveNearPoints([0 0 0],[0 0 1],points);
% normal=[0 0 0];
% meshCoordinates=[0 0 0];

% h = patch(xyzp(:,1),xyzp(:,2),xyzp(:,3),'FaceColor',       [0.8 0.8 1.0], ...
%          'EdgeColor',       'none',        ...
%          'FaceLighting',    'gouraud',     ...
%          'AmbientStrength', 0.15);

%i=1
if ~get(handles.pushbutton11,'UserData') 
    
    [leapCoordinates,normal,v1,v2]=getHandCoordinates(1);
     v1Size=size(v1);
     v1Size=v1Size(1);
%      if v1Size==0
%          continue;
%      end
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
        
            scatter(xyzp(:,1),xyzp(:,2),30,'black','Filled');
            axis(handles.size);
            drawnow
        end
        
    end
    %i=i+1;
    
    %
    % plot(xyzp(:,1),xyzp(:,2),'.r')
    % xlabel('x') % x-axis label
    % ylabel('y') % y-axis label
    % % Add a camera light, and tone down the specular highlighting
    % camlight('headlight');
    % material('dull');
    %
    % % Fix the axes scaling, and set a nice view angle
    % axis('image');
    % axis equal
    % %view([-135 35]);
end
end