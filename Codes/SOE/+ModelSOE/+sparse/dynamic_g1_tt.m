function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = ModelSOE.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(6) = getPowerDeriv(y(18),(-params(1)),1);
T(7) = (-y(30))/(y(18)*y(18));
T(8) = getPowerDeriv(y(30)/y(18),params(1),1);
T(9) = T(8)*1/y(18);
T(10) = getPowerDeriv(y(19),1-params(4),1);
T(11) = getPowerDeriv(y(12),params(4),1);
end
