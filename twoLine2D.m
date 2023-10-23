% Calculate the overlay rate between two.
% 
%
function result = twoLine2D(xoffset, distance, depth, theta, alpha)
    triangle1 = oneLine2D(xoffset, depth, theta, alpha);
    triangle2 = oneLine2D(xoffset-distance, depth + distance .* tan(alpha), theta, alpha);
    result(:, 1:2)=triangle1;
    result(:, 3:4)=triangle2;
    if(triangle2(3,1)>triangle1(2,1))
        result(size(triangle1,1)+1,1) = 1;
    elseif(triangle2(3,1)==triangle1(2,1))
        result(size(triangle1,1)+1,1) = 0;
    elseif(triangle2(3,1)<triangle1(2,1))
        result(size(triangle1,1)+1,1) = -1;
    end
    overlayLength = result(size(triangle1,1)+1,1) .* norm(triangle1(2,1:2)-triangle2(3,1:2),2);
    result(size(triangle1,1)+1,2) = overlayLength;
    result(size(triangle1,1)+1,3) = overlayLength ./ result(size(triangle1,1),1);
    result(size(triangle1,1)+1,4) = overlayLength ./ result(size(triangle1,1),3);
