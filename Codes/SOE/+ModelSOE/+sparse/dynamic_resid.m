function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = ModelSOE.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(18)) - (y(24)-(1-params(3))*y(12)+T(1)*(y(24)-y(12))^2);
    residual(2) = (params(5)*y(20)^params(6)) - (T(2)*y(21));
    residual(3) = (T(3)*(1+params(8)*(y(24)-y(12)))) - (params(2)*(1-params(3)+y(34)-params(8)*(y(36)-y(24))));
    residual(4) = (T(3)) - (params(2)*(1+y(27)));
    residual(5) = (y(15)) - (params(14)*exp(params(10)*(y(14)-params(12))));
    residual(6) = (y(16)) - (y(13)*T(4)*T(5));
    residual(7) = (y(22)) - (params(4)*y(16)/y(12));
    residual(8) = (y(21)) - (y(16)*(1-params(4))/y(20));
    residual(9) = (y(14)+y(18)+y(17)) - (y(16)+(1+y(15))*y(2)+y(23));
    residual(10) = (y(13)) - (y(1)*params(7)+params(11)*(1-params(7))+x(1));
    residual(11) = (y(23)) - (y(11)*params(9)+params(13)*(1-params(9))+x(2));
    residual(12) = (y(19)) - (y(16)-y(17)-y(18));
end
