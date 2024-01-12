function[z] = Fn_flowPastCylinder(x,y,vInfinity, cylinderRadius)

        r = sqrt(x^2 + y^2);

        theta = Fn_antiClockWiseAngle(x,y);
        

        z = vInfinity*r*sin(theta)*(1-(cylinderRadius/r)^2);
        if(r < cylinderRadius)
            z = NaN;
        end 
        
        return
        
end
        
        