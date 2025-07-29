function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = ModelSOE.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(31, 1);
g1_v(1)=(-(T(2)*T(3)));
g1_v(2)=1-params(7);
g1_v(3)=(-(params(15)*params(10)*exp(params(10)*(y(2)-params(13)))));
g1_v(4)=1-(1+y(3));
g1_v(5)=(-params(2));
g1_v(6)=1;
g1_v(7)=(-y(2));
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=(-(params(4)*1/y(12)));
g1_v(13)=(-((1-params(4))/y(7)));
g1_v(14)=(-1);
g1_v(15)=(-1);
g1_v(16)=(-(y(8)*getPowerDeriv(y(6),(-params(1)),1)));
g1_v(17)=1;
g1_v(18)=1;
g1_v(19)=params(5)*getPowerDeriv(y(7),params(6),1);
g1_v(20)=(-(y(1)*T(2)*getPowerDeriv(y(7),1-params(4),1)));
g1_v(21)=(-((-(y(5)*(1-params(4))))/(y(7)*y(7))));
g1_v(22)=(-T(1));
g1_v(23)=1;
g1_v(24)=(-params(2));
g1_v(25)=1;
g1_v(26)=(-1);
g1_v(27)=1-params(9);
g1_v(28)=1;
g1_v(29)=(-(1-(1-params(3))));
g1_v(30)=(-(T(3)*y(1)*getPowerDeriv(y(12),params(4),1)));
g1_v(31)=(-(params(4)*(-y(5))/(y(12)*y(12))));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 12);
end
