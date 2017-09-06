%plotPhase using the straight value of direction cosines and position, this
%function does automatic centering on x, and L.
% takes input as length and direction cosine.
function plotPhaseSelfCenter(data)
global g_currPhaseColor;
global g_currPhaseMarker;
%set(0,'DefaultAxesColorOrder',[1 0 0;0 0 1]);
[max_value,max_pos]=max(data');
[min_value,min_pos]=min(data');
mid_pos = (max_value(1)+min_value(1))/2;
count = size(data,2);
plotData = data-mid_pos*([ones(1,count);zeros(1,count)]);

figure(2);

%set(gca,Ytick,-1:0.1:1);
color='mrgbk'
markers = '+o*.xd'
%plot(t,y,[markers(2) color(3)])
f = plot(plotData(1,:),plotData(2,:),[markers(g_currPhaseMarker) color(g_currPhaseColor)],'MarkerSize',8);

g_currPhaseColor = mod((g_currPhaseColor),5)+1;
g_currPhaseMarker = mod((g_currPhaseMarker),6)+1;
xlabel('x');
ylabel('P_x');
%plot(plotData(1,:),plotData(2,:),'.','color',rand(1,3));
%plot(plotData(1,:),plotData(2,:),'.');
ylim([-1 1]);
end