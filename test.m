theta = 120;
alpha = 1.5;
depth0 = 70;

theta = deg2rad(theta);
alpha = deg2rad(alpha);

% figure
% 
% % oneLine2D(depth0, theta, alpha)
% twoLine2D(0,200, depth0, theta,alpha)
% axis ij
% % axis equal

% x = -2:0.25:2;
% y = x;
% [X,Y] = meshgrid(x);
% F = X.*exp(-X.^2-Y.^2);
% surf(X,Y,F)

x = -2:0.2:2;
y = x';
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z);
figure
contour(x,y,z);
hold on
quiver(x,y,px,py);


