function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 6
    T = [T; NaN(6 - size(T, 1), 1)];
end
T(1) = y(8)^params(4);
T(2) = y(14)^(1-params(4));
T(3) = params(5)*y(14)^params(7);
T(4) = y(11)^params(1);
T(5) = params(9)^(1-params(8));
T(6) = y(1)^params(8)*T(5);
end
