function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = y(4)^params(4);
T(2) = y(16)*T(1);
T(3) = y(11)^(1-params(4));
T(4) = params(5)*y(11)^params(6);
T(5) = y(15)^params(1);
T(6) = params(2)*y(23)^(-params(1));
T(7) = params(8)^(1-params(7));
T(8) = y(8)^params(7)*T(7);
end
