%find the intersection of two lines, specified by a pair of points on each line
function point = GetIntersection(pair1, pair2)
    line1 = polyfit(pair1(:, 1), pair1(:, 2), 1);
    line2 = polyfit(pair2(:, 1), pair2(:, 2), 1);
    %function searches near here
    x = line2(2) - line1(2);
    x = x / (line1(1) - line2(1));
    y = polyval(line2, x);
    point = [x, y];
end
