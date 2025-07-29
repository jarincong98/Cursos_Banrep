function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = ModelSOE.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(16)) - (y(24)-(1-params(3))*y(12)+T(1)*(y(24)-y(12))^2);
    residual(2) = (params(5)*y(19)^params(6)) - (T(2)*y(20));
    residual(3) = (T(3)*(1+params(8)*(y(24)-y(12)))) - (params(2)*(1-params(3)+y(33)-params(8)*(y(36)-y(24))));
    residual(4) = (T(3)) - (params(2)*(1+y(27)));
    residual(5) = (y(15)) - (params(15)*exp(params(10)*(y(14)-params(13))));
    residual(6) = (y(17)) - (y(13)*T(4)*T(5));
    residual(7) = (y(21)) - (params(4)*y(17)/y(12));
    residual(8) = (y(20)) - (y(17)*(1-params(4))/y(19));
    residual(9) = (y(14)+y(16)+y(18)) - (y(17)+(1+y(15))*y(2)+y(22));
    residual(10) = (y(13)) - (y(1)*params(7)+params(12)*(1-params(7))+x(1));
    residual(11) = (y(22)) - (y(10)*params(9)+params(14)*(1-params(9))+x(2));
    residual(12) = (y(23)) - (y(17)-y(18)-y(16));
end
