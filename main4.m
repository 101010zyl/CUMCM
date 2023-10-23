% 
% 
% 
% 
% 

nautical = 1852;
scale=0.02.*nautical;
x=0:250;
y=0:200;

theta = 120;
alpha = 1.5;

theta = deg2rad(theta);
alpha = deg2rad(alpha);

data = csvread('data.csv');

test = [contourInfo(175,2:135)./scale;contourInfo(176,2:135)./scale];

[dx, dy]=gradient(data);
% quiver(dx,dy);

slope = atan(abs((dx+dy)./sqrt(dx.^2+dy.^2)));
searchTime = zeros(205, 201);

n=80;
num=contourInfo(2*n, 1);
test=contourInfo(2.*n-1:2.*n, 2:1+num);
% scatter(test(1,:), test(2,:));
% searchOneLine(data,num, test,slope,theta);


sum(slope(1, :))/size(slope,2)

sum(slope(:,1))/size(slope,1)

data(126,101)

