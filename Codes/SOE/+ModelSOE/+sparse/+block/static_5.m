function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  T(2)=y(6)^(-params(1));
  residual(1)=(params(5)*y(7)^params(6))-(T(2)*y(8));
  T(3)=y(1)*y(12)^params(4);
  T(4)=y(7)^(1-params(4));
  residual(2)=(y(5))-(T(3)*T(4));
  residual(3)=(y(9))-(params(4)*y(5)/y(12));
  residual(4)=(y(8))-(y(5)*(1-params(4))/y(7));
  residual(5)=(y(2)+y(4)+y(6))-(y(5)+(1+y(3))*y(2)+y(10));
  residual(6)=(T(2))-(T(2)*params(2)*(1-params(3)+y(9)));
  residual(7)=(y(4))-(y(12)-y(12)*(1-params(3)));
  T(5)=getPowerDeriv(y(6),(-params(1)),1);
if nargout > 3
    g1_v = NaN(19, 1);
g1_v(1)=params(5)*getPowerDeriv(y(7),params(6),1);
g1_v(2)=(-(T(3)*getPowerDeriv(y(7),1-params(4),1)));
g1_v(3)=(-((-(y(5)*(1-params(4))))/(y(7)*y(7))));
g1_v(4)=1;
g1_v(5)=(-(params(4)*1/y(12)));
g1_v(6)=(-((1-params(4))/y(7)));
g1_v(7)=(-1);
g1_v(8)=(-(T(4)*y(1)*getPowerDeriv(y(12),params(4),1)));
g1_v(9)=(-(params(4)*(-y(5))/(y(12)*y(12))));
g1_v(10)=(-(1-(1-params(3))));
g1_v(11)=(-T(2));
g1_v(12)=1;
g1_v(13)=(-(y(8)*T(5)));
g1_v(14)=1;
g1_v(15)=T(5)-(1-params(3)+y(9))*params(2)*T(5);
g1_v(16)=1;
g1_v(17)=(-(T(2)*params(2)));
g1_v(18)=1;
g1_v(19)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
