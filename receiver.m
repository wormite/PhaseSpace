function receiver(x_1,z_1,x_2,z_2)
global g_rayData;
figure(1);
%debug
plotLine(x_1,z_1,x_2,z_2,[.5,.2,.2]);
%% calculate all the crossing points.
% if two lines, from p to p+r cross with q to q+s, then exists 
% p+tr=q+us
% then t = (q-p) x s/(r x s)
% p 
p = [x_1,z_1,0];
r = [x_2-x_1,z_2-z_1,0];
% from g_rayData;
%i = 1;
%size(g_rayData,2);
phaseSpaceData = [];
for i=1:size(g_rayData,2)
    q = [g_rayData(1,i),g_rayData(2,i),0];
    s = [g_rayData(3,i)-g_rayData(1,i),g_rayData(4,i)-g_rayData(2,i),0];
    numerator = cross((q-p),s);
    denominator = cross(r,s);
    t = numerator(3)/denominator(3);
    cross_point = (p+t.*r);
    %debug
    % plot(cross_point(2),cross_point(1),'*');
    % plotLine(g_rayData(1,i),g_rayData(2,i),g_rayData(3,i),g_rayData(4,i),[0,0,0]);
    cross_direction_cosine = dot(r,s)/sqrt((dot(r,r))*(dot(s,s)));
    phaseSpaceData = [phaseSpaceData,[t*sqrt(dot(r,r));cross_direction_cosine]];
end
plotPhaseSelfCenter(phaseSpaceData);
end
