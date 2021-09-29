function PvA
% Power vs. Area plot
%   written by Kristina Franke on Apr 7th, 2014

%figure window set-up
f=figure('visible','off','position',[360,700,1000,755]);
hTitle=uicontrol('style','text','string','Theoretical Power vs. Area Graphs','position',[400,720,200,15]);
%hP=uicontrol('style','text','string','P-A-curve','position',[800,375,70,15]);
%hPel=uicontrol('style','text','string','P_el-A-curve','position',[800,10,70,15]);
haP=axes('units','pixels','position',[50,425,900,285]);
haPel=axes('units','pixels','position',[50,60,900,285]);

%data
A = [5;10;15;20;25;30;35;40;45;50];
Pel = [3.601;39.09;71.38;92.02;105.7;115.8;123.6;129.6;134.3;137.8];
Phyd = [21.64;219.5;810.9;1799;2990;4177;5217;6047;6702;7194];

%plotting
plot(haP,A,Pel,A,Phyd);
ylabel(haP,'Power / W');
xlabel(haP,'Tank Area / m^2');
legend(haP,'Electric Power','Hydraulic Power');
plot(haPel,A,Pel);
ylabel(haPel,'Electric Power / W');
xlabel(haPel,'Tank Area / m^2');

%figure window finalisation
set(f,'name','P-A_plot');
movegui(f,'center');
set(f,'visible','on');


end

