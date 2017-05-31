function meshCoordinates = mapCoordinates(leapCoordinates,xyz)
    xMin=min(xyz(:,1));
    xMax=max(xyz(:,1));
    yMin=min(xyz(:,2));
    yMax=max(xyz(:,2));
    zMin=min(xyz(:,3));
    zMax=max(xyz(:,3));
    
    leapXmax=200;
    leapXmin=-200;
    leapYmax=200;
    leapYmin=-200;
    leapZmax=300;
    leapZmin=50;
    
    x=xMin + (xMax-xMin)*(leapCoordinates(1) - leapXmin)/(leapXmax-leapXmin);
    y=yMin + (yMax-yMin)*(leapCoordinates(2) - leapYmin)/(leapYmax-leapYmin);
    z=zMin + (zMax-zMin)*(leapCoordinates(3) - leapZmin)/(leapZmax-leapZmin);
    meshCoordinates=[x,y,z];
    
end
