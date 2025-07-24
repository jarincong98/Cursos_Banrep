function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(13)) - (T(2)*T(3));
    residual(2) = (y(10)) - (params(4)*y(13)/y(4));
    residual(3) = (y(12)) - (y(4)*(1-params(3))+y(14)+params(6)/2*(y(12)-y(4))^2);
    residual(4) = (y(9)) - ((1-params(4))*y(13)/y(11));
    residual(5) = (T(4)*T(5)) - (y(9));
    residual(6) = ((y(23)/y(15))^params(1)) - (params(2)*(y(10)+1-params(3)+params(6)*(y(12)-y(4))));
    residual(7) = (y(16)) - (T(7)*(1+x(1)));
    residual(8) = (y(13)) - (y(14)+y(15));
end
