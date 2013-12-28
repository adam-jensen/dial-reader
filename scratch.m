
%first, fit a line from the low point, to the point pi radians across
pin = [pinx - piny]
oppositelow = 2 * pin - low %formula for reflection
midline = polyfit([pin(0) oppositelow(0)], [pin(1) oppositelow(1)], 1);
%inequality test to learn whether the needle traveled more than
%pi radians from the starting position



%version in polar
%x = (r1 / sin(alpha) - r2 / sin(beta));
%x = x / (cot(alpha) - cot(beta));
%y = -cot(alpha) * x + r1 / sin(alpha);
