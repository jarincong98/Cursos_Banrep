function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(10, 1);
end
[T_order, T] = ModelRBC.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(6)) - (T(2)*T(3));
    residual(2) = (y(2)) - (params(4)*y(3)*y(6)/y(5));
    residual(3) = (y(1)) - ((1-params(4))*y(3)*y(6)/y(4));
    residual(4) = (y(3)) - (T(5)*T(6));
    residual(5) = (y(5)) - (y(5)*(1-params(3))+y(7));
    residual(6) = (T(7)*T(8)) - (y(1));
    residual(7) = (T(9)) - (T(9)*params(2)*(1-params(3)+y(6)*params(4)/y(5)));
    residual(8) = (y(9)) - (y(9)^params(7)*T(10)*(1+x(1)));
    residual(9) = (y(6)) - (y(7)+y(8));
end
