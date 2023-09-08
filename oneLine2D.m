% 输入角度theta, alpha为角度制
% result(1, 1:2) : A
% result(2, 1:2) : B
% result(3, 1:2) : C
% result(4, 1:2) : D
% result(5, 1:2) : E
% result(6, 1:2) : F
function result = oneLine2D(depth, theta, alpha)
    theta = deg2rad(theta);
    alpha = deg2rad(alpha);
    delta = (pi - theta) ./ 2 - alpha;
    % x = D .* sin(theta/2) ./ sin(delta);
    A = [0 0];
    D = [0 depth];
    % BE = DEcotalpha
    % (AD+DE)tantheta/2=BE
    DE = (depth .* tan(theta./2)) ./ (cot(alpha) - tan(theta./2));
    E = [0 depth+DE];
    BE = DE .* cot(alpha);
    B = [-BE E(2)];
    F = [BE E(2)];
    C = [0 0];
    

    result = [A; 
              B;
              C;
              D;
              E;
              F];
    plot(result(:, 1), result(:, 2))