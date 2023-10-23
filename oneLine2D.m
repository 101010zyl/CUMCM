% 输入角度theta, alpha为弧度制
% result(1, 1:2) : A
% result(2, 1:2) : B
% result(3, 1:2) : C
% result(4, 1:2) : D
% result(5, 1:2) : E
% result(6, 1:2) : F
% result(7, 1:2) : G
% result(8, 1)   : BC
% result(8, 2)   : 0
function result = oneLine2D(offset, depth, theta, alpha)
    % theta = deg2rad(theta);
    % alpha = deg2rad(alpha);
    % delta = (pi - theta) ./ 2 - alpha;
    % x = D .* sin(theta/2) ./ sin(delta);
    A = [0+offset 0];
    D = [0+offset depth];
    % BE = DEcotalpha
    % (AD+DE)tantheta/2=BE
    DE = (depth .* tan(theta./2)) ./ (cot(alpha) - tan(theta./2));
    E = [0+offset depth+DE];
    BE = DE .* cot(alpha);
    B = [-BE+offset E(2)];
    F = [BE+offset E(2)];
    AG = depth./(1 + tan(theta./2).*tan(alpha));
    GC = AG .* tan(theta./2);
    G = [0+offset AG];
    C = [GC+offset AG];
    BC = norm(B-C, 2);
    
    if(alpha==0)
        result = [[offset 0];
                  [-depth.*tan(theta./2) depth];
                  [depth.*tan(theta./2) depth];
                  [0 depth];
                  [0 depth];
                  [depth.*tan(theta./2) depth];
                  [0 depth];
                  [2.*depth.*tan(theta./2) 0]
                  ];
    elseif(alpha~=0)
        result = [A; 
                  B;
                  C;
                  D;
                  E;
                  F;
                  G;
                  [BC 0]];
    end
    % ABC=polyshape([A; B; C]);
    % ABD=polyshape([A; B; D]);
    % ACD=polyshape([A; C; D]);
    % plot(ABC);
    % hold on;
    % plot(ABD);
    % hold on;
    % plot(ACD);
    % hold on;
    %plot(result(:, 1), result(:, 2));

end