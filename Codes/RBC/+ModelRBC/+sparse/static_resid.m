function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = ModelRBC.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(5)) - (T(2)*T(3));
    residual(2) = (y(2)) - (params(4)*y(5)/y(4));
    residual(3) = (y(4)) - (y(4)*(1-params(3))+y(6));
    residual(4) = (y(1)) - ((1-params(4))*y(5)/y(3));
    residual(5) = (T(4)*T(5)) - (y(1));
    residual(6) = (T(6)) - (T(6)*params(2)*(y(2)+1-params(3)));
    residual(7) = (y(8)) - (y(8)^params(7)*T(7)*(1+x(1)));
    residual(8) = (y(5)) - (y(6)+y(7));
end
