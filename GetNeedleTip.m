%use the hough transform to find the two biggest lines
%Find out where they intersect, that's the needle tip
%currently has no heuristics whatsoever
%eventually should make sure that
%each line starts near the center and ends near the edge
function point = GetNeedleTip(edgeimage)
    [H, theta, rho] = hough(edgeimage);
    peaks = houghpeaks(H, 2);
    gap = size(edgeimage, 1);
    lines = houghlines(edgeimage, theta, rho, peaks, 'FillGap', gap);
    if length(lines) < 2
        error('something bad happened, fewer than two lines')
    end
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        plot(xy(:, 1), xy(:, 2), 'g-x', 'LineWidth', 1);
    end
    %find where the lines intersect (needle tip)
    %using the corresponding theta and rho
    pair1 = [lines(1).point1; lines(1).point2];
    pair2 = [lines(2).point1; lines(2).point2];
    point = GetIntersection(pair1, pair2);
end
