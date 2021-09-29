function characteristic_curves
% characteristic curves for Zhou Turbine
%   written by Kristina Franke on Mar 25th, 2014

%figure window set-up
f=figure('visible','off','position',[360,700,1000,755]);
hP=uicontrol('style','text','string','not fitted','position',[800,395,70,15]);
hXi=uicontrol('style','text','string','e-function','position',[800,10,70,15]);
haP=axes('units','pixels','position',[50,445,900,285]);
haXi=axes('units','pixels','position',[50,60,900,285]);

%data from Zhou Turbine
c2=[0.8;1;1.3;1.6;1.85;2;2.25;2.6;3;3.2;3.75;4];
A=[0;1;2;3;4;4.4;5;6;6.6;7;8;8.4];
P_el=A*12;
V_dot=c2*0.077;
Xi_el=(2*P_el*(0.077^2))./(1000*0.8*V_dot.^3);
plot(haP,V_dot,P_el); %Power
%plot(haXi,V_dot,Xi_el); %Xi
ylabel(haP,'Power Output / W');
xlabel(haP,'Flow Rate / m^3/s');

%curve fitting
x=[0.06:0.001:0.32];
y=0.9*exp(-5*x)-0.2;
plot(haXi,V_dot,Xi_el,x,y);
ylabel(haXi,'Xi-Turbine');
xlabel(haXi,'Flow Rate / m^3/s');

%figure window finalisation
set(f,'name','Turbinenkennlinien');
movegui(f,'center');
set(f,'visible','on');


end

