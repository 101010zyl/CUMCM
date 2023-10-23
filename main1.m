theta = 120;
alpha = 1.5;
depth0 = 70;
distance = 200;

theta = deg2rad(theta);
alpha = deg2rad(alpha);

figure
result=zeros(9,4,9);
% oneLine2D(depth0, theta, alpha)
for i = 1 : 8
    main1result(1,i) = -800+i.*distance;
    main1result(2,i) = depth0 - (i-4).*tan(alpha)*distance;
    result(:,:,i) = twoLine2D(-800+i.*distance, distance, depth0 - (i-4).*tan(alpha)*distance, theta, alpha);
    main1result(3,i) = result(size(result,1)-1, 1, i);
    main1result(4,i) = result(size(result,1), 3, i);

end
% twoLine2D(0,200, depth0, theta,alpha)
result


axis ij
% axis equal