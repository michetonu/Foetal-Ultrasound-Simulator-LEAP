function nearPts = giveNearPoints(p0,p1,xyz)
% p0 is the point of surface to cut. p1 is the normal vector to the plane
    p1=p1/norm(p1);
    nearPtsTmp=[];
    nearPts=[];
    p1Dotp1 = dot(p1,p1);
    p0Dotp1=dot(p0,p1);
    
     rotMat = vrrotvec2mat(vrrotvec([0 0 1],p1));
     rotMat(1,4)=p0(1);
     rotMat(2,4)=p0(2);
     rotMat(3,4)=p0(3);
     rotMat(4,:)=[0 0 0 1];
    for i=1:size(xyz)
       lambda = (dot(p1,xyz(i,:))-p0Dotp1)/p1Dotp1;
       dist=norm(lambda*p1);
       if(dist<6)
            q=(xyz(i,:)-lambda*p1)';
            q(4)=1;
            q=inv(rotMat)*q;
            point = q;
            nearPtsTmp=[nearPtsTmp,point];
       end
    end
    
    nearPts=nearPtsTmp';
end


