function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = ModelSOE.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(32, 1);
g1_v(1)=(-(T(2)*T(3)));
g1_v(2)=1-params(7);
g1_v(3)=1;
g1_v(4)=(-(params(4)*1/y(13)));
g1_v(5)=(-((1-params(4))/y(10)));
g1_v(6)=(-1);
g1_v(7)=(-1);
g1_v(8)=(-(((y(2))-y(2))/((y(2))*(y(2)))));
g1_v(9)=1;
g1_v(10)=(-(y(11)*getPowerDeriv(y(4),(-params(1)),1)));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=(-(params(14)*params(10)*exp(params(10)*(y(7)-params(12)))));
g1_v(18)=1-(1+y(8));
g1_v(19)=(-params(2));
g1_v(20)=1;
g1_v(21)=(-y(7));
g1_v(22)=1-params(9);
g1_v(23)=params(5)*getPowerDeriv(y(10),params(6),1);
g1_v(24)=(-(y(1)*T(2)*getPowerDeriv(y(10),1-params(4),1)));
g1_v(25)=(-((-(y(2)*(1-params(4))))/(y(10)*y(10))));
g1_v(26)=(-T(1));
g1_v(27)=1;
g1_v(28)=(-params(2));
g1_v(29)=1;
g1_v(30)=(-(1-(1-params(3))));
g1_v(31)=(-(T(3)*y(1)*getPowerDeriv(y(13),params(4),1)));
g1_v(32)=(-(params(4)*(-y(2))/(y(13)*y(13))));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 13, 13);
end
