function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(15, 1);
end
[T_order, T] = ModelRBC.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(25, 1);
g1_v(1)=(-(T(3)*T(12)));
g1_v(2)=(-(params(4)*(-y(13))/(y(4)*y(4))));
g1_v(3)=(-(1-params(3)));
g1_v(4)=(-((1+x(1))*T(15)));
g1_v(5)=1;
g1_v(6)=(-1);
g1_v(7)=1;
g1_v(8)=(-T(6));
g1_v(9)=(-(T(2)*T(9)));
g1_v(10)=(-((1-params(4))*(-y(13))/(y(11)*y(11))));
g1_v(11)=T(5)*T(10);
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-(params(4)*1/y(4)));
g1_v(15)=(-((1-params(4))*1/y(11)));
g1_v(16)=1;
g1_v(17)=(-1);
g1_v(18)=(-1);
g1_v(19)=T(4)*T(13);
g1_v(20)=getPowerDeriv(y(15),(-params(1)),1);
g1_v(21)=(-1);
g1_v(22)=(-(T(1)*T(3)));
g1_v(23)=1;
g1_v(24)=(-((y(10)+1-params(3))*T(14)));
g1_v(25)=(-T(8));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 25);
end
