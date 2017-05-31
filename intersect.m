function [h,on] = intersect(handles)

% 
% [f, v] = stlread(figure_des);
% fv = stlread(figure_des);
% 
% 
% h = patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
%     'EdgeColor',       'none',        ...
%     'FaceLighting',    'gouraud',     ...
%     'AmbientStrength', 0.15);
% camlight('headlight');
% material('dull');
% axis('image');
% hold on;
% set(gcf, 'renderer', 'opengl');
% view([135 35]);
% a = [];
% on=0;
% i = 1;
    
    if handles.on
        delete(handles.a);
    end
    [leapCoordinates,normal]=getHandCoordinates(1);
    meshCoordinates = mapCoordinates(leapCoordinates,handles.v);
    
    plane = createPlane(meshCoordinates, normal);
    
    [h,on] = drawPlane3d(plane);
    %a = findobj(gca,'color','r');
    %delete(a);
    drawnow;
    %i = i+1;
    
    %     axis([-10 20 -10 20 -10 20]); view(3);
    
    

end

