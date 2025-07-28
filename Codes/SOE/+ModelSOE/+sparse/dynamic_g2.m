function [g2_v, T_order, T] = dynamic_g2(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(13, 1);
end
[T_order, T] = ModelSOE.sparse.dynamic_g2_tt(y, x, params, steady_state, T_order, T);
g2_v = NaN(27, 1);
g2_v(1)=(-params(8));
g2_v(2)=(-(T(1)*(-2)));
g2_v(3)=(-params(8));
g2_v(4)=(-(y(20)*T(12)));
g2_v(5)=(-T(6));
g2_v(6)=params(5)*getPowerDeriv(y(19),params(6),2);
g2_v(7)=(1+params(8)*(y(24)-y(12)))*T(12);
g2_v(8)=T(6)*(-params(8));
g2_v(9)=params(8)*T(6);
g2_v(10)=(-((1-params(3)+y(33)-params(8)*(y(36)-y(24)))*params(2)*getPowerDeriv(y(30),(-params(1)),2)));
g2_v(11)=(-T(9));
g2_v(12)=(-(params(8)*T(9)));
g2_v(13)=(-(T(9)*(-params(8))));
g2_v(14)=T(8)*(-((-y(30))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18))+T(7)*T(7)*T(13);
g2_v(15)=T(8)*(-1)/(y(18)*y(18))+T(7)*1/y(18)*T(13);
g2_v(16)=1/y(18)*1/y(18)*T(13);
g2_v(17)=(-(params(15)*params(10)*params(10)*exp(params(10)*(y(14)-params(13)))));
g2_v(18)=(-(T(4)*T(10)));
g2_v(19)=(-(T(5)*T(11)));
g2_v(20)=(-(y(13)*T(4)*getPowerDeriv(y(19),1-params(4),2)));
g2_v(21)=(-(T(10)*y(13)*T(11)));
g2_v(22)=(-(T(5)*y(13)*getPowerDeriv(y(12),params(4),2)));
g2_v(23)=(-(params(4)*(-1)/(y(12)*y(12))));
g2_v(24)=(-(params(4)*(-((-y(17))*(y(12)+y(12))))/(y(12)*y(12)*y(12)*y(12))));
g2_v(25)=(-((-(1-params(4)))/(y(19)*y(19))));
g2_v(26)=(-((-((-(y(17)*(1-params(4))))*(y(19)+y(19))))/(y(19)*y(19)*y(19)*y(19))));
g2_v(27)=(-1);
end
