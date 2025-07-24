function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = ModelRBC.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(2)) - (y(1)*T(1)*T(2));
    residual(2) = (y(7)) - (params(4)*y(2)/y(8));
    residual(3) = (y(8)) - (y(8)*(1-params(3))+y(4));
    residual(4) = (y(5)) - ((1-params(4))*y(2)/y(6));
    residual(5) = (T(3)*T(4)) - (y(5));
    residual(6) = (1) - (params(2)*(y(7)+1-params(3)));
    residual(7) = (y(1)) - (y(1)^params(8)*T(5)*(1+x(1)));
    residual(8) = (y(2)) - (y(4)+y(3));
end
