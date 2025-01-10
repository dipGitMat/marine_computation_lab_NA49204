clc;
clear all;


addpath ../../../radiationYeung/;
addpath movie2gif\;


xLength = 50;
nDivs = 100;
endTime = 100.0;
nDivsTime = 20;

waveAmp = 0.1;

xDomain = linspace(0,xLength,nDivs);
g = 9.81;
timePeriod = 3;

dpt = 10.0;

omega = 2*pi/timePeriod;


sigma = omega^2/g;
nEqs = 3;
mroots = dispersion_free_surface_vMikeM(sigma,nEqs,dpt);
waveNumber = -1i*mroots(1,1);
waveLength = 2*pi/waveNumber;

% return;

times = linspace(0,endTime, nDivsTime);


h=figure;
set(h,'units','normalized')
set(gcf,'position',[0.1,0.6,0.8,0.25]) %old [0.1,0.2,0.8,0.7] 



% h.Visible= 'off';
M=moviein(nDivsTime);

for jk = 1:nDivsTime
    

        eta = zeros(nDivs,1);
        for ik = 1:nDivs
    
            arg = 1i*(waveNumber*xDomain(ik)+omega*times(jk));
        eta(ik) = waveAmp*real(exp(arg));
        end
%         return
        
        plot(xDomain, eta);
%         drawnow
        text(0.7*xLength,0.6*waveAmp,['time= ',num2str(times(jk)),' s']);
        xlabel('x(m)');
        ylabel('$\eta$(m)','interpreter', 'latex');
        

    
    M(jk) = getframe(gcf);
    
    
end

% h.Visible = 'off';
% movie(M,1,10)

movie2gif(M, 'waveProfileMove_lab_1.gif','DelayTime',0.1)