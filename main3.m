
% 
nautical = 1852;

theta = 120;
alpha = 1.5;
depth0 = 110;
distance = 200;

theta = deg2rad(theta);
alpha = deg2rad(alpha);

length = 4 .* nautical;
halfLength = 2 .* nautical;

maxDepth = 110 + halfLength.*tan(alpha);
minDepth = 110 - halfLength.*tan(alpha);

deepestLineBE = maxDepth.*tan(theta./2);
deepestLineOffset = -halfLength+deepestLineBE;
deepestLineDepth = maxDepth - deepestLineBE.*tan(alpha);

figure;

offset = deepestLineOffset;
depth = deepestLineDepth;

i = 2;
result(1,1)=0;
result(1,2)=0;
result(1,3)=offset;
result(1,4)=depth;
while(offset < halfLength)
    temp = findOverlay(0.1, 620, offset, depth, theta, alpha);
    result(i, 1:2)=temp(10,1:2);
    result(i, 3:4)=temp(9,1:2);
    offset = temp(1,1);
    depth = temp(4,2);


    i = i+1;
end

result1 = findOverlay(0.1, 620, deepestLineOffset, deepestLineDepth, theta, alpha);
axis ij;
