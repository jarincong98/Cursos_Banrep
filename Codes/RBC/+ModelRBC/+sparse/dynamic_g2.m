function [g2_v, T_order, T] = dynamic_g2(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(22, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_g2_tt(y, x, params, steady_state, T_order, T);
g2_v = NaN(30, 1);
g2_v(1)=(-(T(2)*getPowerDeriv(y(13),1-params(4),2)));
g2_v(2)=(-(T(16)*T(19)));
g2_v(3)=(-(T(1)*T(16)));
g2_v(4)=(-(T(3)*y(18)*getPowerDeriv(y(5),params(4),2)));
g2_v(5)=(-(T(3)*T(18)));
g2_v(6)=(-(params(4)*(-y(15))/(y(5)*y(5))));
g2_v(7)=(-(params(4)*1/y(5)));
g2_v(8)=(-(params(4)*y(12)*(-((-y(15))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))));
g2_v(9)=(-(params(4)*y(12)*(-1)/(y(5)*y(5))));
g2_v(10)=(-((1-params(4))*(-y(15))/(y(13)*y(13))));
g2_v(11)=(-((1-params(4))*1/y(13)));
g2_v(12)=(-((1-params(4))*y(12)*(-((-y(15))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13))));
g2_v(13)=(-((1-params(4))*y(12)*(-1)/(y(13)*y(13))));
g2_v(14)=(-(T(5)*1/(1-params(4))*1/(1-params(4))*getPowerDeriv(y(10)/(1-params(4)),1-params(4),2)));
g2_v(15)=(-(T(13)*T(15)));
g2_v(16)=(-(T(13)*T(4)*(-1)/(y(18)*y(18))));
g2_v(17)=(-(T(6)*1/y(18)*1/params(4)*1/params(4)*getPowerDeriv(y(11)/params(4),params(4),2)));
g2_v(18)=(-(T(6)*T(14)*(-1)/(y(18)*y(18))));
g2_v(19)=(-(T(6)*T(4)*(y(18)+y(18))/(y(18)*y(18)*y(18)*y(18))));
g2_v(20)=T(8)*params(5)*getPowerDeriv(y(13),params(6),2);
g2_v(21)=T(17)*T(20);
g2_v(22)=T(7)*getPowerDeriv(y(17),params(1),2);
g2_v(23)=(-(T(9)*(-((-(params(4)*y(24)))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14))));
g2_v(24)=(-(T(9)*(-params(4))/(y(14)*y(14))));
g2_v(25)=(-((-(params(4)*y(24)))/(y(14)*y(14))*T(21)));
g2_v(26)=(-(params(4)/y(14)*T(21)));
g2_v(27)=getPowerDeriv(y(17),(-params(1)),2);
g2_v(28)=(-(T(10)*params(2)*getPowerDeriv(y(26),(-params(1)),2)));
g2_v(29)=(-((1+x(1))*T(11)*getPowerDeriv(y(9),params(7),2)));
g2_v(30)=(-T(22));
end
