clc;
clear all;

addpath ../marine_hydro/matlab_tools/altmany-export_fig-36efb99/;

% set your desired case: available options: 1. kitchenSink, 2.
% flowPastCylinder, 3. flowPastCylinderLifting etc..

demoCase = 'flowPastCylinder'; 

%% define all your input here %%

Lambda= 5;
cylinderRadius = 2;
rCal = 2.02;
vInfinity = 1.;
tau = 10;
%%

nData = 500;
midLength = 3;
xx = linspace(-midLength,midLength,nData);
yy = linspace(-midLength,midLength,nData);

[xg,yg] = meshgrid(xx,yy);

psi = zeros(nData);
prCoeff = zeros(nData);




for ik = 1:nData
    for jk = 1:nData
        
        x = xg(ik,jk);
        y = yg(ik,jk);

        r = sqrt(x^2 + y^2);
        theta = atan2(y,x);
        
        if (strcmp(demoCase,'kitchenSink'))
%            psi(ik,jk) =  Fn_kitchenSink(x,y,tau,Lambda);
            fprintf('= = under development = = \n')
            return;
        elseif (strcmp(demoCase,'flowPastCylinder'))
           Fn_flowPastCylinder;
        elseif (strcmp(demoCase,'flowPastCylinderLifting'))
           Fn_flowPastCylinderLifting;
%             fprintf('= = under development = = \n')
%             return;
        else
            
            fprintf('= = invalid option for case = = \n')
            return;
        end

    
        psi(ik,jk) = psiTemp;
        prCoeff(ik,jk) = prCoeffTemp;

        
    end
    
end


% below calculation for pressure coefficient from theory is dummy for lifting case %%

nDataSurface = 100;
thetaSurface = linspace(0,2*pi,nDataSurface);

prCoeffTheta = zeros(nDataSurface,1);
prCoeffTheory = 1.0 - 4.0*sin(thetaSurface).^2;

%% Report task 2 %%

% how we can now interpolate the gridded pressure coefficient on the
% surface of the circle and show the variation as a function over theta ?
% Let us consider this function as 'prCoeffTheta'



figure(1)
contourf(xg,yg,psi)
colorbar



Fn_editPlotDetails
xlabel('x')
ylabel('z')

figure(2)
contourf(xg,yg,prCoeff)
colorbar

Fn_editPlotDetails
xlabel('x')
ylabel('z')


%% only for the no-lift case we would like to compare the solutions for pressure coefficients %%
if (strcmp(demoCase,'flowPastCylinder'))
figure(3)
plot(thetaSurface,prCoeffTheta);
hold on;

plot(thetaSurface,prCoeffTheory,'--')
end



% set(gca,'xTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5])
% set(gca,'yTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5])


% x0=400;
% y0=450;
% width=800;
% height=800;
% set(gcf,'position',[x0,y0,width,height])

% export_fig psi_tau_5_Lambda_1 -pdf -nocrop -transparent '-r600'