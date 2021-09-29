function characteristic_curves_scaled
% characteristic curves for Zhou Turbine
%   written by Kristina Franke on Apr 10th, 2014

%figure window set-up
f=figure('visible','off','position',[360,700,1000,755]);
hTitle=uicontrol('style','text','string','Scaled Characteristic Curves for the Chosen Turbine','position',[350,720,300,15]);
hP=uicontrol('style','text','string','Polyfit 3','position',[800,375,70,15]);
hZeta=uicontrol('style','text','string','Polyfit 3','position',[800,10,70,15]);
%hZetaE=uicontrol('style','text','string','e-function','position',[500,10,70,15]);
haP=axes('units','pixels','position',[50,420,900,285]);
haZeta=axes('units','pixels','position',[50,60,900,285]);
%haZetaE=axes('units','pixels','position',[60,60,600,205]);

%data from Zhou Turbine
c2=[1;1.3;1.6;1.85;2;2.25;2.6;3;3.2;3.75;4];
A=[1;2;3;4;4.4;5;6;6.6;7;8;8.4];
P_el=(A*12).*32;
V_dot=(c2*(0.077)).*8;
Zeta_el=(2*P_el*((0.077*4).^2))./(1000*0.8*V_dot.^3);

%curve fitting
x=[(0.06*8):0.001:(0.32*8)];
p=polyfit(V_dot,Zeta_el,3)
q=polyfit(V_dot,P_el,3)
y=polyval(p,x);
z=polyval(q,x);
%e=0.9*exp(-5*x)-0.2;
%plot(haZetaE,V_dot,Zeta_el,x,e);
plot(haZeta,V_dot,Zeta_el,'x',x,y);
plot(haP,V_dot,P_el,'x',x,z);
ylabel(haP,'Power Output / W');
xlabel(haP,'Flow Rate / m^3/s');
ylabel(haZeta,'Zeta-Turbine');
xlabel(haZeta,'Flow Rate / m^3/s');
%ylabel(haZetaE,'Zeta-Turbine');
%xlabel(haZetaE,'Flow Rate / m^3/s');

%figure window finalisation
set(f,'name','Characteristic Curves');
movegui(f,'center');
set(f,'visible','on');

%p =
%    0.0207   -0.0019   -0.3445    0.6067

%q =
%   1.0e+03 *
%    0.1243   -1.0138    3.6825   -1.5601
    
end