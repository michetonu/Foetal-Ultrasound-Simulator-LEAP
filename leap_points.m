function leap_points(handles)

if ~get(handles.pushbutton11,'UserData')
    
    [leapCoordinates,normal,v1,v2]=getHandCoordinates(1);
    v1Size=size(v1);
    v1Size=v1Size(1);
    
    meshCoordinates = mapCoordinates(leapCoordinates,points);
    [n, m] = size(normal);
    [a b] = size(meshCoordinates);
    disp('n plus a');
    point = [meshCoordinates(1),meshCoordinates(2),meshCoordinates(3)];
    if((n + a) == 2)
        xyzp = giveNearPoints([meshCoordinates(1),meshCoordinates(2),meshCoordinates(3)],[normal(1) normal(2) normal(3)],points);
        [d e] = size(xyzp);
        if(d>10)
            d = -point*normal'; 
            [xx,yy]=ndgrid(1:10,1:10);
            z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
            r=load('X+Y.mat');
            scatter(xyzp(:,1),xyzp(:,2),30,'black','Filled');
            axis(handles.size);
            drawnow
        end     
    end
end
end