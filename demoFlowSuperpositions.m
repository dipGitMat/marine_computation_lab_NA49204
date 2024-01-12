clc;
clear all;

addpath ../marine_hydro/matlab_tools/altmany-export_fig-36efb99/;

demoCase = 'flowPastCylinder'; % set your desired case: available options: 1. kitchenSink, 2. flowPastCylinder

%% define all your input here %%
tau = 5;
Lambda= 5;
cylinderRadius = 2;
vInfinity = 1;
%%

nData = 1000;
midLength = 5;
xx = linspace(-midLength,midLength,nData);
yy = linspace(-midLength,midLength,nData);

[xg,yg] = meshgrid(xx,yy);

psi = zeros(nData);




for ik = 1:nData
    for jk = 1:nData
        
        x = xg(ik,jk);
        y = yg(ik,jk);

        
        
        if (strcmp(demoCase,'kitchenSink'))
%            psi(ik,jk) =  Fn_kitchenSink(x,y,tau,Lambda);
        elseif (strcmp(demoCase,'flowPastCylinder'))
           psi(ik,jk) =  Fn_flowPastCylinder(x,y,vInfinity, cylinderRadius);
        else
            
            fprintf('\n = = invalid option for case = = ')
        end

    


        
    end
    
end

contourf(xg,yg,psi)
colorbar

fsz3=20;
set(gca, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'off'      , ...
  'YMinorTick'  , 'off'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'FontName'    , 'Times New Roman', ...
  'FontSize'    ,fsz3,  ...
  'LineWidth'   , 1         );

% set(gca,'xTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5])
% set(gca,'yTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5])
xlabel('x')
ylabel('z')

x0=400;
y0=450;
width=800;
height=800;
set(gcf,'position',[x0,y0,width,height])

% export_fig psi_tau_5_Lambda_1 -pdf -nocrop -transparent '-r600'