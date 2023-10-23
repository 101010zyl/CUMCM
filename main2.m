theta = 120;
alpha = 1.5;
depth0 = 120;
distance = 200;
gap = 0.3 .* 1852;


theta = deg2rad(theta);
alpha = deg2rad(alpha);

figure
ax=gca;
for i = 1 : 8
    beta = -45 + 45 .* i;
    beta = deg2rad(beta);
    newDepth = depth0;
    offset = [0 0];
    for j = 1 : 8
        result = oneLine3D(beta, gap, offset, newDepth, theta, alpha);
        newDepth = result(8, 3);
        offset = result(8, 1:2);
        main2result(i, j) = result(9, 1);
        plotData = [result(2, 1:3); ...
               result(3, 1:3); ...
               result(7, 1:3); ...
               result(6, 1:3)]';
        fill3(plotData(1, :), plotData(2, :), plotData(3, :), [0.5 i/8 j/8]);
        hold on
        ax.ZDir = 'reverse';
    end
end


