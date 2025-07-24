function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(27, 1);
g1_v(1)=(-(T(3)*y(16)*getPowerDeriv(y(4),params(4),1)));
g1_v(2)=(-(params(4)*(-y(13))/(y(4)*y(4))));
g1_v(3)=(-(1-params(3)+params(6)/2*(-(2*(y(12)-y(4))))));
g1_v(4)=(-(params(2)*(-params(6))));
g1_v(5)=(-((1+x(1))*T(6)*getPowerDeriv(y(8),params(8),1)));
g1_v(6)=1;
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=(-params(2));
g1_v(10)=(-(T(2)*getPowerDeriv(y(11),1-params(4),1)));
g1_v(11)=(-((1-params(4))*(-y(13))/(y(11)*y(11))));
g1_v(12)=T(5)*params(5)*getPowerDeriv(y(11),params(7),1);
g1_v(13)=1-params(6)/2*2*(y(12)-y(4));
g1_v(14)=(-(params(6)*params(2)));
g1_v(15)=1;
g1_v(16)=(-(params(4)*1/y(4)));
g1_v(17)=(-((1-params(4))*1/y(11)));
g1_v(18)=1;
g1_v(19)=(-1);
g1_v(20)=(-1);
g1_v(21)=T(4)*getPowerDeriv(y(15),params(1),1);
g1_v(22)=(-y(23))/(y(15)*y(15))*T(8);
g1_v(23)=(-1);
g1_v(24)=(-(T(1)*T(3)));
g1_v(25)=1;
g1_v(26)=T(8)*1/y(15);
g1_v(27)=(-T(7));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 25);
end
