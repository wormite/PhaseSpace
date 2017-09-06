%% Plot the 2D condition for the phase space change.

function PhaseSpace()
clear;
close all;
clf;
global g_x_length;
global g_x_spacing;
global g_theta;
global g_theta_step;
global g_emitter;
global g_lineLength;

global g_currPhaseColor;
global g_currPhaseMarker;

g_currPhaseColor = 1;
g_currPhaseMarker = 1;
global g_phaseSpaceFigure;
global g_rayTraceFigure;

g_x_length = 10;
g_theta = 30/180*pi;
g_emitter = [];
g_x_spacing = g_x_length/20;
g_theta_step = g_theta/20;

g_phaseSpaceFigure = figure(1);
ylabel('x');
xlabel('z');
figRange = g_x_length*4;
g_lineLength = g_x_length*4;
%axis([0 figRange g_x_length/2-.5*figRange g_x_length/2+.5*figRange]);

global g_rayData;
g_rayData = [];

hold on;


source();
for i=1:size(g_emitter,2)
    plotLine(g_emitter(1,i),g_emitter(2,i),g_emitter(3,i),g_emitter(4,i),[1,.5,.5]);
end;

g_rayTraceFigure = figure(2);
hold on;
plotPhase(g_emitter);
g_rayData = g_emitter;
%receiver(-15,25,15,0);
%receiver(-15,20,20,0)
%receiver(0,10,20,15)
for i =5:10;
    receiver(-20,i,20,i);
   % pause(1);
end
end