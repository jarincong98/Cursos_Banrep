function [y, T, residual, g1] = static_6(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(2)=y(1)*y(13)^params(4);
  T(3)=y(10)^(1-params(4));
  residual(1)=(y(2))-(T(2)*T(3));
  residual(2)=(y(12))-(params(4)*y(2)/y(13));
  residual(3)=(y(11))-(y(2)*(1-params(4))/y(10));
  residual(4)=(y(7)+y(5)+y(4))-(y(2)+(1+y(8))*y(7));
  T(4)=y(4)^(-params(1));
  residual(5)=(params(5)*y(10)^params(6))-(T(4)*y(11));
  residual(6)=(y(5))-(y(13)-y(13)*(1-params(3)));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(-(T(3)*y(1)*getPowerDeriv(y(13),params(4),1)));
g1_v(2)=(-(params(4)*(-y(2))/(y(13)*y(13))));
g1_v(3)=(-(1-(1-params(3))));
g1_v(4)=1;
g1_v(5)=(-(params(4)*1/y(13)));
g1_v(6)=(-((1-params(4))/y(10)));
g1_v(7)=(-1);
g1_v(8)=(-(T(2)*getPowerDeriv(y(10),1-params(4),1)));
g1_v(9)=(-((-(y(2)*(1-params(4))))/(y(10)*y(10))));
g1_v(10)=params(5)*getPowerDeriv(y(10),params(6),1);
g1_v(11)=1;
g1_v(12)=(-(y(11)*getPowerDeriv(y(4),(-params(1)),1)));
g1_v(13)=1;
g1_v(14)=(-T(4));
g1_v(15)=1;
g1_v(16)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
