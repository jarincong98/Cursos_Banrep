function [y, T, residual, g1] = static_6(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(2)=y(1)*y(12)^params(4);
  T(3)=y(8)^(1-params(4));
  residual(1)=(y(4))-(T(2)*T(3));
  residual(2)=(y(10))-(params(4)*y(4)/y(12));
  residual(3)=(y(9))-(y(4)*(1-params(4))/y(8));
  residual(4)=(y(2)+y(6)+y(5))-(y(4)+(1+y(3))*y(2)+y(11));
  T(4)=y(5)^(-params(1));
  residual(5)=(params(5)*y(8)^params(6))-(T(4)*y(9));
  residual(6)=(y(6))-(y(12)-y(12)*(1-params(3)));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=1;
g1_v(2)=(-(params(4)*1/y(12)));
g1_v(3)=(-((1-params(4))/y(8)));
g1_v(4)=(-1);
g1_v(5)=(-(T(3)*y(1)*getPowerDeriv(y(12),params(4),1)));
g1_v(6)=(-(params(4)*(-y(4))/(y(12)*y(12))));
g1_v(7)=(-(1-(1-params(3))));
g1_v(8)=1;
g1_v(9)=(-T(4));
g1_v(10)=1;
g1_v(11)=(-(y(9)*getPowerDeriv(y(5),(-params(1)),1)));
g1_v(12)=(-(T(2)*getPowerDeriv(y(8),1-params(4),1)));
g1_v(13)=(-((-(y(4)*(1-params(4))))/(y(8)*y(8))));
g1_v(14)=params(5)*getPowerDeriv(y(8),params(6),1);
g1_v(15)=1;
g1_v(16)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
