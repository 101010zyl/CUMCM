% Find line with proper overlay.
% result(1:8; 1:2) : newRight
% result(9, 1)     : newOffset
% result(9, 2)     : newDepth
% result(10, 1)     : newLeftRate
% result(10, 2)     : newRightRate

function result = findOverlay(goal, initStep, offset, depth, theta, alpha)
    times = 10000;
    step = 1;

    left = oneLine2D(offset, depth, theta, alpha);
    leftShape = polyshape(left(1:3, 1:2));

    plot(leftShape);
    hold on;
    
    rightOffsetOld = offset + initStep;
    rightDepthOld = depth-initStep.*tan(alpha);
    rightRateOld = 0;
    leftRateOld = 0;

    rightOffset = rightOffsetOld;
    rightDepth = rightDepthOld;
    rightRate = 0;
    leftRate = 0;


    while(leftRate < goal)
        right = oneLine2D(rightOffset, rightDepth, theta, alpha);
    
        overlayLength = norm(right(2,1:2)-left(3,1:2),2);
        leftRate = overlayLength ./ left(8, 1);
        rightRate = overlayLength ./ right(8, 1);
        
        if(leftRate < goal)
            leftRateOld = leftRate;
            rightRateOld = rightRate;
            rightOffsetOld = rightOffset;
            rightDepthOld = rightDepth;
            rightOffset = rightOffset - step;
            rightDepth = rightDepth + step.*tan(alpha);
        end
    end

    for i = 1 : times
        newOffset = (rightOffset+rightOffsetOld)./2;
        newDepth = (rightDepth+rightDepthOld)./2;
        newRight = oneLine2D(newOffset, newDepth, theta, alpha);
        overlayLength = norm(newRight(2,1:2)-left(3,1:2),2);
        newLeftRate = overlayLength ./ left(8, 1);
        newRightRate = overlayLength ./ newRight(8,1);
        if((abs(newLeftRate-goal)<eps) )
            result(1:size(newRight, 1), 1:size(newRight, 2)) = newRight;
            result(size(newRight, 1)+1, 1) = newOffset;
            result(size(newRight, 1)+1, 2) = newDepth;
            result(size(newRight, 1)+2, 1) = newLeftRate;
            result(size(newRight, 1)+2, 2) = newRightRate;
            break;
        elseif(newLeftRate>goal)
            rightOffset = newOffset;
            rightDepth = newDepth;
        elseif(newLeftRate<goal)
            rightOffsetOld = newOffset;
            rightDepthOld = newDepth;
        end

    end
    rightShape = polyshape(result(1:3, 1:2));
    plot(rightShape);
    hold on;

end
