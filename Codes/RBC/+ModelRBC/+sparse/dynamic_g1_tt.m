function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 15
    T = [T; NaN(15 - size(T, 1), 1)];
end
T(9) = getPowerDeriv(y(11),1-params(4),1);
T(10) = params(5)*getPowerDeriv(y(11),params(6),1);
T(11) = getPowerDeriv(y(4),params(4),1);
T(12) = y(16)*T(11);
T(13) = getPowerDeriv(y(15),params(1),1);
T(14) = params(2)*getPowerDeriv(y(23),(-params(1)),1);
T(15) = T(7)*getPowerDeriv(y(8),params(7),1);
end
