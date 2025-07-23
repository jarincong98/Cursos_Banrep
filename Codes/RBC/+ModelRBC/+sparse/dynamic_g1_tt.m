function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 22
    T = [T; NaN(22 - size(T, 1), 1)];
end
T(13) = 1/(1-params(4))*getPowerDeriv(y(10)/(1-params(4)),1-params(4),1);
T(14) = 1/params(4)*getPowerDeriv(y(11)/params(4),params(4),1);
T(15) = 1/y(18)*T(14);
T(16) = getPowerDeriv(y(13),1-params(4),1);
T(17) = params(5)*getPowerDeriv(y(13),params(6),1);
T(18) = getPowerDeriv(y(5),params(4),1);
T(19) = y(18)*T(18);
T(20) = getPowerDeriv(y(17),params(1),1);
T(21) = params(2)*getPowerDeriv(y(26),(-params(1)),1);
T(22) = T(11)*getPowerDeriv(y(9),params(7),1);
end
