function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = ModelRBC.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(22, 1);
g1_v(1)=(-(T(1)*T(2)));
g1_v(2)=1-(1+x(1))*T(5)*getPowerDeriv(y(1),params(8),1);
g1_v(3)=1;
g1_v(4)=(-(params(4)*1/y(9)));
g1_v(5)=(-((1-params(4))*1/y(7)));
g1_v(6)=1;
g1_v(7)=(-(((y(2))-y(2))/((y(2))*(y(2)))));
g1_v(8)=1;
g1_v(9)=T(3)*getPowerDeriv(y(4),params(1),1);
g1_v(10)=(-1);
g1_v(11)=(-1);
g1_v(12)=(-1);
g1_v(13)=1;
g1_v(14)=(-1);
g1_v(15)=(-(y(1)*T(1)*getPowerDeriv(y(7),1-params(4),1)));
g1_v(16)=(-((1-params(4))*(-y(2))/(y(7)*y(7))));
g1_v(17)=T(4)*params(5)*getPowerDeriv(y(7),params(7),1);
g1_v(18)=1;
g1_v(19)=(-params(2));
g1_v(20)=(-(T(2)*y(1)*getPowerDeriv(y(9),params(4),1)));
g1_v(21)=(-(params(4)*(-y(2))/(y(9)*y(9))));
g1_v(22)=1-(1-params(3));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
