function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(6, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(10)) - (y(9)*T(1)*T(2));
    residual(2) = (y(15)) - (params(4)*y(10)/y(8));
    residual(3) = (y(16)) - (y(8)*(1-params(3))+y(12)+params(6)/2*(y(16)-y(8))^2);
    residual(4) = (y(13)) - ((1-params(4))*y(10)/y(14));
    residual(5) = (T(3)*T(4)) - (y(13));
    residual(6) = ((y(19)/y(11))^params(1)) - (params(2)*(y(15)+1-params(3)+params(6)*(y(16)-y(8))));
    residual(7) = (y(9)) - (T(6)*(1+x(1)));
    residual(8) = (y(10)) - (y(12)+y(11));
end
