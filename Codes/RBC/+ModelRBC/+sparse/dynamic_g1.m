function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(22, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(32, 1);
g1_v(1)=(-(T(3)*T(19)));
g1_v(2)=(-(params(4)*y(12)*(-y(15))/(y(5)*y(5))));
g1_v(3)=(-(1-params(3)));
g1_v(4)=(-((1+x(1))*T(22)));
g1_v(5)=1;
g1_v(6)=(-(T(5)*T(13)));
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=(-(T(6)*T(15)));
g1_v(10)=(-(params(4)*y(15)/y(5)));
g1_v(11)=(-((1-params(4))*y(15)/y(13)));
g1_v(12)=1;
g1_v(13)=(-(T(2)*T(16)));
g1_v(14)=(-((1-params(4))*y(12)*(-y(15))/(y(13)*y(13))));
g1_v(15)=T(8)*T(17);
g1_v(16)=1;
g1_v(17)=(-(T(9)*(-(params(4)*y(24)))/(y(14)*y(14))));
g1_v(18)=1;
g1_v(19)=(-(params(4)*y(12)*1/y(5)));
g1_v(20)=(-((1-params(4))*y(12)*1/y(13)));
g1_v(21)=1;
g1_v(22)=(-1);
g1_v(23)=(-1);
g1_v(24)=T(7)*T(20);
g1_v(25)=getPowerDeriv(y(17),(-params(1)),1);
g1_v(26)=(-1);
g1_v(27)=(-(T(1)*T(3)));
g1_v(28)=(-(T(6)*T(4)*(-1)/(y(18)*y(18))));
g1_v(29)=1;
g1_v(30)=(-(T(9)*params(4)/y(14)));
g1_v(31)=(-(T(10)*T(21)));
g1_v(32)=(-T(12));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 28);
end
