function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = ModelRBC.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(2)) - (y(1)*T(1)*T(2));
    residual(2) = (y(8)) - (params(4)*y(2)/y(9));
    residual(3) = (y(9)) - (y(9)*(1-params(3))+y(5));
    residual(4) = (y(6)) - ((1-params(4))*y(2)/y(7));
    residual(5) = (T(3)*T(4)) - (y(6));
    residual(6) = (1) - (params(2)*(y(8)+1-params(3)));
    residual(7) = (y(1)) - (y(1)^params(8)*T(5)*(1+x(1)));
    residual(8) = (y(2)) - (y(5)+y(4));
    residual(9) = (y(3)) - (y(2)/(y(2)));
end
