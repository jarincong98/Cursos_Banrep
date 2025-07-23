function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(15)) - (T(2)*T(3));
    residual(2) = (y(11)) - (params(4)*y(12)*y(15)/y(5));
    residual(3) = (y(10)) - ((1-params(4))*y(12)*y(15)/y(13));
    residual(4) = (y(12)) - (T(5)*T(6));
    residual(5) = (y(14)) - (y(5)*(1-params(3))+y(16));
    residual(6) = (T(7)*T(8)) - (y(10));
    residual(7) = (y(17)^(-params(1))) - (T(9)*T(10));
    residual(8) = (y(18)) - (T(12)*(1+x(1)));
    residual(9) = (y(15)) - (y(16)+y(17));
end
