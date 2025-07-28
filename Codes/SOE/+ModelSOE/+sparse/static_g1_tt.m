function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = ModelSOE.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 4
    T = [T; NaN(4 - size(T, 1), 1)];
end
T(4) = getPowerDeriv(y(6),(-params(1)),1);
end
