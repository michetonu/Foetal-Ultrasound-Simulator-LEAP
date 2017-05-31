function xyzReturn = replaceOrigin(xyz)
%% Place the origin of the mesh at the middle of mesh
totalX=0;
totalY=0;
totalZ=0;
avgX=0;
avgY=0;
avgZ=0;

i=0;
for i=1:size(xyz)
    totalX=totalX+xyz(i,1);
    totalY=totalY+xyz(i,2);
    totalZ=totalZ+xyz(i,3);
end
[n,m]=size(xyz);
if (n>0)
    avgX=totalX/n;
    avgY=totalY/n;
    avgZ=totalZ/n;
end
for i=1:size(xyz)
    xyz(i,1)=(xyz(i,1)-avgX);
    xyz(i,2)=(xyz(i,2)-avgY);
    xyz(i,3)=(xyz(i,3)-avgY);
end

xyzReturn = xyz;
end

