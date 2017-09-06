%%plot phase space:
%giving new figure for each phasespace.
function plotPhase(data)
    numOfPoints = size(data,2);
    plotData = zeros(2,numOfPoints);
    for i = 1:1:numOfPoints;
        plotData(1,i) = data(1,i);
        %% direction cosine P_x
        dirTan = (data(4,i)-data(2,i))/(data(3,i)-data(1,i));       
        if(dirTan>0)
            dirCos = 1/sqrt(1+dirTan*dirTan);
        else
            dirCos = -1/sqrt(1+dirTan*dirTan);
        end
        plotData(2,i)= dirCos;
    end;
    figure;
    %plot(plotData(1,:),plotData(2,:),'.');
    plotPhaseSelfCenter(plotData);