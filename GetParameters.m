%returns the locations of the axle/pin, and the locations of the
%high and low tic marks
function [highloc, highvalue, lowloc, lowvalue, pinloc] = GetParameters(imdata)
    %ask for the locations of center, open a bizzare figure so you don't
    %trample anything
    figure(124), imshow(imdata, []);
    uiwait(warndlg('Where is the axle that the needle spins on?'));
    [pinx, piny] = ginput(1);
    pinloc = [pinx piny];
    %location and value of the high end
    uiwait(warndlg('Where is the tic mark for the maximum value? Please enter the value in the console after clicking on its tic mark'));
    [highx, highy] = ginput(1);
    highloc = [highx highy];
    highvalue = getDouble('What is the maximum value? ');
    %location and value of the low end
    uiwait(warndlg('Where is the tic mark for the miniumum value? Please enter the value in the console after clicking on its tic mark'));
    [lowx, lowy] = ginput(1);
    lowloc = [lowx lowy];
    lowvalue = getDouble('What is the minumum value? ');
    close(124);
end

function result = getDouble(prompt)
    result = str2double(input(prompt, 's'));
    if isnan(result) 
        result = str2double(input(prompt, 's'));
    end
end
