

        
        psiTemp = vInfinity*r*sin(theta)*(1-(cylinderRadius/r)^2);

        


        u = (1-cylinderRadius^2/r^2)*vInfinity*cos(theta); %vr component
        v = -(1 + cylinderRadius^2/r^2)*vInfinity*sin(theta); % v_theta component
        
        % calculate the pressure coefficient 
        prCoeffTemp = 1. - (u^2 + v^2)/vInfinity^2;


        if (r < cylinderRadius)
            psiTemp = NaN;
            prCoeffTemp = NaN;
        end 
        
