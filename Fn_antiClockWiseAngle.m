function[theta] = Fn_antiClockWiseAngle(x,y)



        if (x >= 0 && y >=0 )
            theta = atan(y/x);
        elseif (x <0 && y >= 0)
            theta = 0.5*pi + atan(x/y);
        elseif (x < 0 && y < 0)
            theta = atan(y/x);
        elseif (x >= 0 && y <0 )
            theta = 2.0*pi - atan(y/x);
        end
        
        return
        
end