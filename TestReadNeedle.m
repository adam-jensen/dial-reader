directoryname = 'test_round_dial/';
directory = dir(directoryname);
fileIndex = find(~[directory.isdir]);


for i = 1:length(fileIndex)
    imagename = strcat(directoryname, directory(fileIndex(i)).name);
    imdata = imread(imagename);
    figure(i), imshow(imdata, []);
    
    if ~initialized
        [highloc, highvalue, lowloc, lowvalue, pinloc] = GetParameters(imdata);
        initialized = 1;
    end
    
    unitsperradian = GetUnitsPerRadian(highloc, highvalue, lowloc, lowvalue, pinloc);
    blackwhite = GetEdges(imdata);
    hold on;
    needletip = GetNeedleTip(blackwhite);
    
    plot(needletip(1), needletip(2), 'rx', 'MarkerSize', 20, 'LineWidth', 3);
    %express that point relative to the pin
    pinneedletip = [needletip(1) - pinloc(1), needletip(2) - pinloc(2)];
    %find the angle from the low end to the needle tip
    low = [lowloc(1) - pinloc(1), lowloc(2) - pinloc(2)];
    angle = GetAngle(low, pinneedletip);
    
    % if the needle is on the left of the pin, subtract the angle
    %from two pi radians
    %NB: this will cause bugs on different dials, and a rough draft
    %of a more general approach is in scratch.m, to be used in 
    %cases where the slope of the line between the start and the pin
    %isn't infinite
    if needletip(1) < pinloc(1)
        angle = 2 * pi - angle;
    end
    %add the low end, plus the units/radian * radians
    %to get the best guess of where the dial is
    strcat('result for ', imagename, 'is:')
    output = lowvalue + (angle * unitsperradian)
    hold off
end
