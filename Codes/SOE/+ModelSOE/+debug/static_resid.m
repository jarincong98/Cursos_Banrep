function [lhs, rhs] = static_resid(y, x, params)
T = NaN(3, 1);
lhs = NaN(13, 1);
rhs = NaN(13, 1);
T(1) = y(4)^(-params(1));
T(2) = y(13)^params(4);
T(3) = y(10)^(1-params(4));
lhs(1) = y(5);
rhs(1) = y(13)-y(13)*(1-params(3));
lhs(2) = params(5)*y(10)^params(6);
rhs(2) = T(1)*y(11);
lhs(3) = 1;
rhs(3) = params(2)*(1-params(3)+y(12));
lhs(4) = 1;
rhs(4) = params(2)*(1+y(8));
lhs(5) = y(8);
rhs(5) = params(14)*exp(params(10)*(y(7)-params(12)));
lhs(6) = y(2);
rhs(6) = y(1)*T(2)*T(3);
lhs(7) = y(12);
rhs(7) = params(4)*y(2)/y(13);
lhs(8) = y(11);
rhs(8) = y(2)*(1-params(4))/y(10);
lhs(9) = y(7)+y(5)+y(4);
rhs(9) = y(2)+(1+y(8))*y(7);
lhs(10) = y(1);
rhs(10) = y(1)*params(7)+params(11)*(1-params(7))+x(1);
lhs(11) = y(9);
rhs(11) = y(9)*params(9)+params(13)*(1-params(9))+x(2);
lhs(12) = y(6);
rhs(12) = y(2)-y(4)-y(5);
lhs(13) = y(3);
rhs(13) = y(2)/(y(2));
end
