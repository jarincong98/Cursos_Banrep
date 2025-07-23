function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(1) = y(5)^params(4);
T(2) = y(18)*T(1);
T(3) = y(13)^(1-params(4));
T(4) = (y(11)/params(4))^params(4);
T(5) = 1/y(18)*T(4);
T(6) = (y(10)/(1-params(4)))^(1-params(4));
T(7) = params(5)*y(13)^params(6);
T(8) = y(17)^params(1);
T(9) = params(2)*y(26)^(-params(1));
T(10) = 1-params(3)+params(4)*y(24)/y(14);
T(11) = params(8)^(1-params(7));
T(12) = y(9)^params(7)*T(11);
end
