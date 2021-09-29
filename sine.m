function sine
% sine used to replace actual tidal data
%   written by Kristina Franke on Feb 11th, 2014

%figure window set-up
f=figure('visible','off','position',[360,500,750,855]);
htitle=uicontrol('style','text','string','Actual Tidal Data - Blue','position',[50,695,200,15]);
hweek=uicontrol('style','text','string','Sine for Calculations - Green','position',[50,680,200,15]);
hday=uicontrol('style','text','string','Daily Cycle','position',[850,450,70,15]);
hweek=uicontrol('style','text','string','Weekly Cycle','position',[850,230,70,15]);
hfull=uicontrol('style','text','string','Full Cycle','position',[850,10,70,15]);
haday=axes('units','pixels','position',[50,490,950,165]);
haweek=axes('units','pixels','position',[50,270,950,165]);
hafull=axes('units','pixels','position',[50,50,950,165]);

%data management for comparison purposes
load('data.mat');
plot(haday,data(1:144,5)+data(1:144,4)*60,data(1:144,7)); %day
plot(haweek,data(1:1008,5)+data(1:1008,4)*60+(data(1:1008,1)-1)*1440,data(1:1008,7)); %week
plot(hafull,data(1:8784,5)+data(1:8784,4)*60+(data(1:8784,1)-1)*1440+(data(1:8784,2)-10)*44640,data(1:8784,7)); %full

%plotting the sines
t1=0:1:1450;
plot(haday,data(1:144,5)+data(1:144,4)*60,data(1:144,7),t1,1.5*sin(0.0083*t1));
t2=0:1:10000;
plot(haweek,data(1:1008,5)+data(1:1008,4)*60+(data(1:1008,1)-1)*1440,data(1:1008,7),t2,sin(0.0083*t2));
t3=0:1:90000;
plot(hafull,data(1:8784,5)+data(1:8784,4)*60+(data(1:8784,1)-1)*1440+(data(1:8784,2)-10)*44640,data(1:8784,7),t3,sin(0.0083*t3));
ylabel(haday,'Water Level / m');
xlabel(haday,'Time / min');
ylabel(haweek,'Water Level / m');
xlabel(haweek,'Time / min');
ylabel(hafull,'Water Level / m');
xlabel(hafull,'Time / min');

%figure window finalisation
set(f,'name','Tidal data between Oct.1st,2007 and Nov.30th,2007');
movegui(f,'center');
set(f,'visible','on');


end

