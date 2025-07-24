function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  residual(1)=(y(8))-(y(8)*(1-params(3))+y(4));
  residual(2)=(y(5))-((1-params(4))*y(2)/y(6));
  T(2)=params(5)*y(6)^params(7);
  T(3)=y(3)^params(1);
  residual(3)=(T(2)*T(3))-(y(5));
  T(4)=y(1)*y(8)^params(4);
  T(5)=y(6)^(1-params(4));
  residual(4)=(y(2))-(T(4)*T(5));
  residual(5)=(y(7))-(params(4)*y(2)/y(8));
  residual(6)=(y(2))-(y(4)+y(3));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(-1);
g1_v(2)=(-1);
g1_v(3)=1;
g1_v(4)=(-1);
g1_v(5)=T(2)*getPowerDeriv(y(3),params(1),1);
g1_v(6)=(-1);
g1_v(7)=(-((1-params(4))*(-y(2))/(y(6)*y(6))));
g1_v(8)=T(3)*params(5)*getPowerDeriv(y(6),params(7),1);
g1_v(9)=(-(T(4)*getPowerDeriv(y(6),1-params(4),1)));
g1_v(10)=1-(1-params(3));
g1_v(11)=(-(T(5)*y(1)*getPowerDeriv(y(8),params(4),1)));
g1_v(12)=(-(params(4)*(-y(2))/(y(8)*y(8))));
g1_v(13)=(-((1-params(4))*1/y(6)));
g1_v(14)=1;
g1_v(15)=(-(params(4)*1/y(8)));
g1_v(16)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
