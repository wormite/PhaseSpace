%source function for light.
%% divide into blocks and then divide the data points into a 2 dimension phase space.
%% given the amount of points on x axis and evenly spreaded directions on Z within angle theta, generate lines.
function source()
global g_x_length;
global g_x_spacing;
global g_theta;
global g_theta_step;
global g_emitter;
global g_lineLength;
for x = -g_x_length/2:g_x_spacing:g_x_length/2;
        g_emitter = [g_emitter,[x;0;x;g_lineLength]];
    for theta = pi/2-[g_theta_step:g_theta_step:g_theta];
        
        g_emitter = [g_emitter,[x;0;x+g_lineLength*cos(theta);g_lineLength*sin(theta)]];
        g_emitter = [g_emitter,[x;0;x-g_lineLength*cos(theta);g_lineLength*sin(theta)]];
    end;
end;   
