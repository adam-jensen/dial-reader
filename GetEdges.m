%extract the edges from the intensity values (could be a colormap one day)
function edges = GetEdges(imdata)
    imdata = double(rgb2gray(imdata));
    edges = edge(imdata, 'sobel');
    %dilate the image with a small structuring element
    dilator = strel('square', 3);
    edges = imdilate(edges, dilator);
end
