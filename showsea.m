Z=csvread('data.csv');
% a=[0:0.02:4].*1852;
% b=[0:0.02:5].*1852;

a=[1:201];
b=[1:251];
[X,Y]=meshgrid(a,b);
surf(X,Y,Z);
ax=gca;
ax.ZDir = 'reverse';

figure
M=contour(X, Y, Z, 100);
xlabel("WE(m)");
ylabel("SN(m)");

k=1;
num = 1;
while(k<size(M,2))
    j=1;
    contourInfo(2*num-1:2*num, 1:M(2,k)+1)=M(1:2, k:k+M(2,k));

    k=k+M(2,k)+1;
    num=num+1;
end

% for k=1:1:100
%     contourInfo(2*k+1,1)-contourInfo(2*k-1,1)
% end

n = 1;
% scatter3(X,Y,contourInfo(1:2,2:176));




