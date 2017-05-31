%% Add noise to the output images in order to resemble a real ultrasound scan

function [d, a] = addnoise(handles)

[leapCoordinates,normal,v1,v2]=getHandCoordinates(1);
meshCoordinates = mapCoordinates(leapCoordinates,handles.points);
%normal
[n, m] = size(normal);
[a, b] = size(meshCoordinates);
if((n + a) == 2)
    xyzp = giveNearPoints([meshCoordinates(1),meshCoordinates(2),meshCoordinates(3)],[v2(1) v2(2) v2(3)],handles.points);
    [d, e] = size(xyzp);
    if(d>10)
        xyzp(:,1) = xyzp(:,1)+abs(min(xyzp(:,1)))+30;
        xyzp(:,2) = xyzp(:,2)+abs(min(xyzp(:,2)))+30;
        xyzp = xyzp.*2;
        a =spotmaker([300,300],length(xyzp),'spot_pos',xyzp(:,1:2),'plot',1,'noise_mu',50,'noise_std',50,'int_mu',10,'int_std',1,'wid_std',1,'wid_mu',1);     
    end
end