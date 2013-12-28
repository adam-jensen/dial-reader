%extract the edges from the intensity values (could be a colormap one day)
function edges = GetEdges(imdata)
    imdata = double(rgb2gray(imdata));
    blackwhite = edge(imdata, 'sobel');
    %dilate the image with a small structuring element
    dilator = strel('disk', 1, 0);
    edges = imdilate(blackwhite, dilator);
end
