function result=searchOneLine(data,num,line,slope, theta)
    
    [dx, dy]=gradient(data);
    for i = 1:num/2
        
        scatter(line(1,i),line(2,i));
        hold on;

        alpha=slope(round(line(1,i)),round(line(2,i)));
        depth=data(round(line(1,i)),round(line(2,i)));
        angle=atan(dy(round(line(1,i)),round(line(2,i)))./dx(round(line(1,i)),round(line(2,i))));
        wide1=oneLine2D(0, depth, theta, alpha);
        C=[wide1(3,1).*sin(angle), wide1(3,1).*cos(angle)];
        B=[wide1(2,1).*sin(angle), wide1(2,1).*cos(angle)];
        
        alpha=slope(round(line(1,i+1)),round(line(2,i+1)));
        depth=data(round(line(1,i+1)),round(line(2,i+1)));
        angle=atan(dy(round(line(1,i+1)),round(line(2,i+1)))./dx(round(line(1,i+1)),round(line(2,i+1))));
        wide2=oneLine2D(0, depth, theta, alpha);
        C2=[wide2(3,1).*sin(angle), wide2(3,1).*cos(angle)];
        B2=[wide2(2,1).*sin(angle), wide2(2,1).*cos(angle)];

        scatter(B(1),B(2));
        hold on;
        scatter(C(1),C(2));
        hold on;
        scatter(B2(1),B2(2));
        hold on;
        scatter(C2(1),C2(2));
        hold on;

    end



end