%return the change per each radian
function result = GetUnitsPerRadian(highloc, highvalue, lowloc, lowvalue, pinloc)
    %express the low and high end relative to the pin
    pinhigh = [highloc(1) - pinloc(1), highloc(2) - pinloc(2)];
    pinlow = [lowloc(1) - pinloc(1), lowloc(2) - pinloc(2)];
    %figure out the angle between them
    angle = GetAngle(pinhigh, pinlow);
    %This will create a bug
    %if the needle's range is less than pi radians:
    angle = 2 * pi - angle;
    %divide difference between the high & low by the angle
    %then you have units (temperature, pressure, etc) per radian
    result = (highvalue - lowvalue) / angle;
end
