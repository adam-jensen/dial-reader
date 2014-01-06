%returns the locations of the axle/pin, and the locations of the
%high and low tic marks
function [highloc, highvalue, lowloc, lowvalue, pinloc] = GetParameters(imdata)
    highvalue = getDouble('What is the maximum value? ');
    lowvalue = getDouble('What is the minumum value? ');
    uiwait(warndlg('Where is the axle that the needle spins on?'));
    [pinx, piny] = ginput(1);
    pinloc = [pinx piny];
    %location and value of the high end
    uiwait(warndlg('Where is the tic mark for the maximum value?'));
    [highx, highy] = ginput(1);
    highloc = [highx highy];
    %location and value of the low end
    uiwait(warndlg('Where is the tic mark for the miniumum value?'));
    [lowx, lowy] = ginput(1);
    lowloc = [lowx lowy];
end

function result = getDouble(prompt)
    result = str2double(input(prompt, 's'));
    if isnan(result) 
        result = str2double(input(prompt, 's'));
    end
end
