function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = ModelSOE.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 15
    T = [T; NaN(15 - size(T, 1), 1)];
end
T(12) = getPowerDeriv(y(30)/y(18),params(1),2);
T(13) = T(8)*(-((-y(30))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18))+T(7)*T(7)*T(12);
T(14) = T(8)*(-1)/(y(18)*y(18))+T(7)*1/y(18)*T(12);
T(15) = 1/y(18)*1/y(18)*T(12);
end
