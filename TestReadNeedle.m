%This script runs through the ReadNeedle functionality.
%at present, you should set a workspace variable called
%initialized to false before running it
directoryname = 'test_round_dial/';
directory = dir(directoryname);
fileIndex = find(~[directory.isdir]);

for i = 1:length(fileIndex)
    imagename = strcat(directoryname, directory(fileIndex(i)).name);
    imdata = imread(imagename);
    figure(i), imshow(imdata, []);
    hold on;
    if ~initialized
        [highloc, highvalue, lowloc, lowvalue, pinloc] = GetParameters(imdata);
        initialized = 1;
    end
    strcat('result for ', imagename, ' is: ')
    output = ReadNeedle(highloc, highvalue, lowloc, lowvalue, pinloc, imdata)
    hold off
end
