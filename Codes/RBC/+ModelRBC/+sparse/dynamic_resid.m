function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(11)) - (y(10)*T(1)*T(2));
    residual(2) = (y(17)) - (params(4)*y(11)/y(9));
    residual(3) = (y(18)) - (y(9)*(1-params(3))+y(14)+T(3));
    residual(4) = (y(15)) - ((1-params(4))*y(11)/y(16));
    residual(5) = (T(4)*T(5)) - (y(15));
    residual(6) = ((y(22)/y(13))^params(1)) - (params(2)*(y(17)+1-params(3)+params(6)*(y(18)-y(9))));
    residual(7) = (y(10)) - (T(7)*(1+x(1)));
    residual(8) = (y(11)) - (T(3)+y(14)+y(13));
    residual(9) = (y(12)) - (y(11)/(steady_state(2)));
end
