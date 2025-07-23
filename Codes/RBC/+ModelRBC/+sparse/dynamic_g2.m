function [g2_v, T_order, T] = dynamic_g2(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(15, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_g2_tt(y, x, params, steady_state, T_order, T);
g2_v = NaN(17, 1);
g2_v(1)=(-(T(2)*getPowerDeriv(y(11),1-params(4),2)));
g2_v(2)=(-(T(9)*T(12)));
g2_v(3)=(-(T(1)*T(9)));
g2_v(4)=(-(T(3)*y(16)*getPowerDeriv(y(4),params(4),2)));
g2_v(5)=(-(T(3)*T(11)));
g2_v(6)=(-(params(4)*(-((-y(13))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4))));
g2_v(7)=(-(params(4)*(-1)/(y(4)*y(4))));
g2_v(8)=(-((1-params(4))*(-((-y(13))*(y(11)+y(11))))/(y(11)*y(11)*y(11)*y(11))));
g2_v(9)=(-((1-params(4))*(-1)/(y(11)*y(11))));
g2_v(10)=T(5)*params(5)*getPowerDeriv(y(11),params(6),2);
g2_v(11)=T(10)*T(13);
g2_v(12)=T(4)*getPowerDeriv(y(15),params(1),2);
g2_v(13)=(-T(14));
g2_v(14)=getPowerDeriv(y(15),(-params(1)),2);
g2_v(15)=(-((y(10)+1-params(3))*params(2)*getPowerDeriv(y(23),(-params(1)),2)));
g2_v(16)=(-((1+x(1))*T(7)*getPowerDeriv(y(8),params(7),2)));
g2_v(17)=(-T(15));
end
