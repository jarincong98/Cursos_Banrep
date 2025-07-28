function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = ModelSOE.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(44, 1);
g1_v(1)=(-params(7));
g1_v(2)=(-(1+y(15)));
g1_v(3)=(-params(9));
g1_v(4)=(-(T(1)*(-(2*(y(24)-y(12))))-(1-params(3))));
g1_v(5)=T(2)*(-params(8));
g1_v(6)=(-(T(5)*y(13)*T(11)));
g1_v(7)=(-(params(4)*(-y(17))/(y(12)*y(12))));
g1_v(8)=(-(T(4)*T(5)));
g1_v(9)=1;
g1_v(10)=(-(params(15)*params(10)*exp(params(10)*(y(14)-params(13)))));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=(-y(2));
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=(-(params(4)*1/y(12)));
g1_v(19)=(-((1-params(4))/y(19)));
g1_v(20)=(-1);
g1_v(21)=(-1);
g1_v(22)=(-(y(20)*T(6)));
g1_v(23)=(1+params(8)*(y(24)-y(12)))*T(6);
g1_v(24)=T(7)*T(8);
g1_v(25)=1;
g1_v(26)=1;
g1_v(27)=params(5)*getPowerDeriv(y(19),params(6),1);
g1_v(28)=(-(y(13)*T(4)*T(10)));
g1_v(29)=(-((-(y(17)*(1-params(4))))/(y(19)*y(19))));
g1_v(30)=(-T(2));
g1_v(31)=1;
g1_v(32)=1;
g1_v(33)=(-1);
g1_v(34)=1;
g1_v(35)=1;
g1_v(36)=(-(1+T(1)*2*(y(24)-y(12))));
g1_v(37)=params(8)*T(2)-params(8)*T(3);
g1_v(38)=(-params(2));
g1_v(39)=(-((1-params(3)+y(33)-params(8)*(y(36)-y(24)))*T(9)));
g1_v(40)=T(8)*1/y(18);
g1_v(41)=(-T(3));
g1_v(42)=(-(T(3)*(-params(8))));
g1_v(43)=(-1);
g1_v(44)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 38);
end
