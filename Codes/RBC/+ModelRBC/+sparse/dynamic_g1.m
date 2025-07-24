function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(27, 1);
g1_v(1)=(-((1+x(1))*T(5)*getPowerDeriv(y(1),params(8),1)));
g1_v(2)=(-(T(2)*y(9)*getPowerDeriv(y(8),params(4),1)));
g1_v(3)=(-(params(4)*(-y(10))/(y(8)*y(8))));
g1_v(4)=(-(1-params(3)+params(6)/2*(-(2*(y(16)-y(8))))));
g1_v(5)=(-(params(2)*(-params(6))));
g1_v(6)=(-(T(1)*T(2)));
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=(-(params(4)*1/y(8)));
g1_v(10)=(-((1-params(4))*1/y(14)));
g1_v(11)=1;
g1_v(12)=T(3)*getPowerDeriv(y(11),params(1),1);
g1_v(13)=(-y(19))/(y(11)*y(11))*T(7);
g1_v(14)=(-1);
g1_v(15)=(-1);
g1_v(16)=(-1);
g1_v(17)=1;
g1_v(18)=(-1);
g1_v(19)=(-(y(9)*T(1)*getPowerDeriv(y(14),1-params(4),1)));
g1_v(20)=(-((1-params(4))*(-y(10))/(y(14)*y(14))));
g1_v(21)=T(4)*params(5)*getPowerDeriv(y(14),params(7),1);
g1_v(22)=1;
g1_v(23)=(-params(2));
g1_v(24)=1-params(6)/2*2*(y(16)-y(8));
g1_v(25)=(-(params(6)*params(2)));
g1_v(26)=T(7)*1/y(11);
g1_v(27)=(-T(6));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 25);
end
