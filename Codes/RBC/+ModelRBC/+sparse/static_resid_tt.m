function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = y(4)^params(4);
T(2) = y(8)*T(1);
T(3) = y(3)^(1-params(4));
T(4) = params(5)*y(3)^params(6);
T(5) = y(7)^params(1);
T(6) = y(7)^(-params(1));
T(7) = params(8)^(1-params(7));
end
