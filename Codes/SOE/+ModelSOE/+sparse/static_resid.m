function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = ModelSOE.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(6)) - (y(12)-y(12)*(1-params(3)));
    residual(2) = (params(5)*y(8)^params(6)) - (T(1)*y(9));
    residual(3) = (1) - (params(2)*(1-params(3)+y(10)));
    residual(4) = (1) - (params(2)*(1+y(3)));
    residual(5) = (y(3)) - (params(14)*exp(params(10)*(y(2)-params(12))));
    residual(6) = (y(4)) - (y(1)*T(2)*T(3));
    residual(7) = (y(10)) - (params(4)*y(4)/y(12));
    residual(8) = (y(9)) - (y(4)*(1-params(4))/y(8));
    residual(9) = (y(2)+y(6)+y(5)) - (y(4)+(1+y(3))*y(2)+y(11));
    residual(10) = (y(1)) - (y(1)*params(7)+params(11)*(1-params(7))+x(1));
    residual(11) = (y(11)) - (y(11)*params(9)+params(13)*(1-params(9))+x(2));
    residual(12) = (y(7)) - (y(4)-y(5)-y(6));
end
