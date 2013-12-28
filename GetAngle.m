function angle = GetAngle(v1, v2)
     angle = acos(dot(v1, v2) / (norm(v1) * norm(v2)) );
end
