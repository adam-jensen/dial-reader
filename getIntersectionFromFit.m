%find the intersection of two lines in polar coordinates
%result is either wrong, or not in image coordinates
function [x, y] = getIntersectionFromFit(pair1, pair2)
    line1 = polyfit(pair1(:, 1), pair1(:, 2), 1);
    line2 = polyfit(pair2(:, 1), pair2(:, 2), 1);
    %function searches near here
    guess = 100;
    x = fzero(@(x) polyval(line1 - line2, x), guess);
    y = polyval(line1, x);
end
