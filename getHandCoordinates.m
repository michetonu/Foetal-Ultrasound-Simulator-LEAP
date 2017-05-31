function [value,normal,v1,v2] = getHandCoordinates(i)
        
        x3=0;
        y3=0;
        z3=0;
        f(1,i)=matleap(1);   
        normal = [];
        v1=[];
        v2=[];
      
        if ~isempty(f(i).pointables)
            f(i).pointables(1).position;
            
            
           % Finger 3
            x3 = f(i).pointables(3).position(1);
            z3 = f(i).pointables(3).position(2);
            y3 = f(i).pointables(3).position(3);
            u3 = f(i).pointables(3).direction(1)*f(i).pointables(3).length;
            w3 = f(i).pointables(3).direction(2)*f(i).pointables(3).length;
            v3 = f(i).pointables(3).direction(3)*f(i).pointables(3).length;
            
            % Finger 4
            x4 = f(i).pointables(4).position(1);
            z4 = f(i).pointables(4).position(2);
            y4 = f(i).pointables(4).position(3);
            u4 = f(i).pointables(4).direction(1)*f(i).pointables(4).length;
            w4 = f(i).pointables(4).direction(2)*f(i).pointables(4).length;
            v4 = f(i).pointables(4).direction(3)*f(i).pointables(4).length;
            
            % Finger 5
            x5 = f(i).pointables(5).position(1);
            z5 = f(i).pointables(5).position(2);
            y5 = f(i).pointables(5).position(3);
            u5 = f(i).pointables(5).direction(1)*f(i).pointables(5).length;
            w5 = f(i).pointables(5).direction(2)*f(i).pointables(5).length;
            v5 = f(i).pointables(5).direction(3)*f(i).pointables(5).length;
            
            vect_1 = [x5-x4 y5-y4 z5-z4];
            vect_2 = [x4-x3 y4-y3 z4-z3];
            
            
            
            %# Transform points to x,y,z
%             x = [x3 u3+x3 x4 u4+x4];
%             y = [y3 v3+y3 y4 v4+y4];
%             z = [z3 w3+z3 z4 w4+z4];
            
     
%             h = patch(x,y,z,'b');
%              pause(0.05) 
%             delete(h);
%             
%             grid on;
        normal = cross(vect_1,vect_2);
        v1=vect_1/norm(vect_1);
        v2=vect_2/norm(vect_2);
            
        end
        
        
        value=[x3,y3,z3];

    
end