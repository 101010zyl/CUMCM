% result(1, 1:3) : A1
% result(2, 1:3) : B1
% result(3, 1:3) : C1
% result(4, 1:3) : D1
% result(5, 1:3) : A2
% result(6, 1:3) : B2
% result(7, 1:3) : C2
% result(8, 1:3) : D2
% result(9, 1)   : BC1
% result(9, 2)   : BC2
% 
% 
% 
function result = oneLine3D(beta, step, offset, depth, theta, alpha)
    betaVec = [cos(beta) sin(beta) 0];
    normalAlpha = [sin(alpha), 0, cos(alpha)];

    newAlphaVect3D = cross(betaVec, normalAlpha);
    newCosAlpha2D = norm(newAlphaVect3D(1:2), 2) ./ norm(newAlphaVect3D, 2);
    newAlpha2D = acos(newCosAlpha2D);
    begin2D = oneLine2D(0, depth, theta, newAlpha2D.*sign(sin(beta)));

    normalDetect = [sin(beta), -cos(beta), 0];
    newCosSlope3D = cross(normalAlpha, normalDetect);
    newCosSlope2D = norm(newCosSlope3D(1:2), 2) ./ norm(newCosSlope3D, 2);
    newSlope = acos(newCosSlope2D);
    end2D = oneLine2D(0, depth-step.*tan(newSlope).*sign(newCosSlope3D(3)), theta, newAlpha2D.*sign(sin(beta)));
    
    result(1:4, 1) = begin2D(1:4, 1).*(-sin(beta)) + offset(1);
    result(1:4, 2) = begin2D(1:4, 1).*(cos(beta)) + offset(2);
    result(1:4, 3) = begin2D(1:4, 2);
    result(9, 1) = begin2D(8, 1);
    
    result(5:8, 1) = end2D(1:4, 1).*(-sin(beta)) + offset(1) + step.*cos(beta);
    result(5:8, 2) = end2D(1:4, 1).*(cos(beta)) + offset(2) + step.*sin(beta);
    result(5:8, 3) = end2D(1:4, 2);
    result(9, 2) = end2D(8, 1);


end
    