function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 5
    T = [T; NaN(5 - size(T, 1), 1)];
end
T(1) = params(8)/2;
T(2) = y(18)^(-params(1));
T(3) = params(2)*y(30)^(-params(1));
T(4) = y(12)^params(4);
T(5) = y(19)^(1-params(4));
end
