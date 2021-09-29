function tidal_data
% Graphic desciption of actual tidal data
%   written by Kristina Franke on Feb 5th, 2014

%figure window set-up
f=figure('visible','off','position',[360,500,1000,855]);
hday=uicontrol('style','text','string','Daily Cycle','position',[450,580,70,15]);
hweek=uicontrol('style','text','string','Weekly Cycle','position',[450,295,70,15]);
hfull=uicontrol('style','text','string','Full Cycle','position',[450,10,70,15]);
haday=axes('units','pixels','position',[50,630,900,185]);
haweek=axes('units','pixels','position',[50,345,900,185]);
hafull=axes('units','pixels','position',[50,60,900,185]);

%data management
load('data.mat');
plot(haday,data(1:144,5)+data(1:144,4)*60,data(1:144,7)); %day
plot(haweek,data(1:1008,5)+data(1:1008,4)*60+(data(1:1008,1)-1)*1440,data(1:1008,7)); %week
plot(hafull,data(1:8784,5)+data(1:8784,4)*60+(data(1:8784,1)-1)*1440+(data(1:8784,2)-10)*44640,data(1:8784,7)); %full

%figure window finalisation
set(f,'name','Gezeitenverlauf von 1.10.2007 bis 30.11.2007');
movegui(f,'center');
set(f,'visible','on');

end

