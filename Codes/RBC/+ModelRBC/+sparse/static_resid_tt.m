function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(1) = y(5)^params(4);
T(2) = y(9)*T(1);
T(3) = y(4)^(1-params(4));
T(4) = (y(2)/params(4))^params(4);
T(5) = 1/y(9)*T(4);
T(6) = (y(1)/(1-params(4)))^(1-params(4));
T(7) = params(5)*y(4)^params(6);
T(8) = y(8)^params(1);
T(9) = y(8)^(-params(1));
T(10) = params(8)^(1-params(7));
end
