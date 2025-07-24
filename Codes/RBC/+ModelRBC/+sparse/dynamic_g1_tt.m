function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(7) = getPowerDeriv(y(19)/y(11),params(1),1);
end
