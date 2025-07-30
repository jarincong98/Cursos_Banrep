function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = y(9)^params(4);
T(2) = y(16)^(1-params(4));
T(3) = params(6)/2*(y(18)-y(9))^2;
T(4) = params(5)*y(16)^params(7);
T(5) = y(13)^params(1);
T(6) = params(9)^(1-params(8));
T(7) = y(1)^params(8)*T(6);
end
