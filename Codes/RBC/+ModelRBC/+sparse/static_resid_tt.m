function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 5
    T = [T; NaN(5 - size(T, 1), 1)];
end
T(1) = y(9)^params(4);
T(2) = y(7)^(1-params(4));
T(3) = params(5)*y(7)^params(7);
T(4) = y(4)^params(1);
T(5) = params(9)^(1-params(8));
end
