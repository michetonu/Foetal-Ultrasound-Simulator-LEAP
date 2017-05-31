function [h,on] = intersect(handles)

if handles.on
    delete(handles.a);
end
[leapCoordinates,normal]=getHandCoordinates(1);
meshCoordinates = mapCoordinates(leapCoordinates,handles.v);

plane = createPlane(meshCoordinates, normal);

[h,on] = drawPlane3d(plane);

drawnow;

end

