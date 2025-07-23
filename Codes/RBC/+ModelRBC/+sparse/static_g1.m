function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = ModelRBC.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(21, 1);
g1_v(1)=1;
g1_v(2)=(-1);
g1_v(3)=1;
g1_v(4)=(-(T(6)*params(2)));
g1_v(5)=(-(T(2)*getPowerDeriv(y(3),1-params(4),1)));
g1_v(6)=(-((1-params(4))*(-y(5))/(y(3)*y(3))));
g1_v(7)=T(5)*params(5)*getPowerDeriv(y(3),params(6),1);
g1_v(8)=(-(T(3)*y(8)*getPowerDeriv(y(4),params(4),1)));
g1_v(9)=(-(params(4)*(-y(5))/(y(4)*y(4))));
g1_v(10)=1-(1-params(3));
g1_v(11)=1;
g1_v(12)=(-(params(4)*1/y(4)));
g1_v(13)=(-((1-params(4))*1/y(3)));
g1_v(14)=1;
g1_v(15)=(-1);
g1_v(16)=(-1);
g1_v(17)=T(4)*getPowerDeriv(y(7),params(1),1);
g1_v(18)=T(8)-(y(2)+1-params(3))*params(2)*T(8);
g1_v(19)=(-1);
g1_v(20)=(-(T(1)*T(3)));
g1_v(21)=1-(1+x(1))*T(7)*getPowerDeriv(y(8),params(7),1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
