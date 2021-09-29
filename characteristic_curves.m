function characteristic_curves
% characteristic curves for Zhou Turbine
%   written by Kristina Franke on Mar 25th, 2014

%figure window set-up
f=figure('visible','off','position',[360,500,700,925]);
hTitle=uicontrol('style','text','string','Characteristic Curves for the Chosen Turbine','position',[250,930,250,15]);
hP=uicontrol('style','text','string','Polyfit 3','position',[500,620,70,15]);
hZeta=uicontrol('style','text','string','Polyfit 3','position',[500,315,70,15]);
hZetaE=uicontrol('style','text','string','e-function','position',[500,10,70,15]);
haP=axes('units','pixels','position',[60,670,600,205]);
haZeta=axes('units','pixels','position',[60,365,600,205]);
haZetaE=axes('units','pixels','position',[60,60,600,205]);

%data from Zhou Turbine
c2=[1;1.3;1.6;1.85;2;2.25;2.6;3;3.2;3.75;4];
A=[1;2;3;4;4.4;5;6;6.6;7;8;8.4];
P_el=A*12;
V_dot=c2*0.077;
Zeta_el=(2*P_el*(0.077^2))./(1000*0.8*V_dot.^3);

%curve fitting
x=[0.06:0.001:0.32];
p=polyfit(V_dot,Zeta_el,3);
q=polyfit(V_dot,P_el,3);
y=polyval(p,x);
z=polyval(q,x);
e=0.9*exp(-5*x)-0.2;
plot(haZetaE,V_dot,Zeta_el,x,e);
plot(haZeta,V_dot,Zeta_el,x,y);
plot(haP,V_dot,P_el,x,z);
ylabel(haP,'Power Output / W');
xlabel(haP,'Flow Rate / m^3/s');
ylabel(haZeta,'Zeta-Turbine');
xlabel(haZeta,'Flow Rate / m^3/s');
ylabel(haZetaE,'Zeta-Turbine');
xlabel(haZetaE,'Flow Rate / m^3/s');

%figure window finalisation
set(f,'name','Characteristic Curves');
movegui(f,'center');
set(f,'visible','on');

%p =
%   10.5752   -0.1225   -2.7559    0.6067

%q =
%   1.0e+03 *
%    1.9891   -2.0277    0.9206   -0.0488
    
end