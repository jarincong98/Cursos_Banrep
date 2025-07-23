function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(2))-(params(4)*y(5)/y(4));
  residual(2)=(y(4))-(y(4)*(1-params(3))+y(6));
  residual(3)=(y(1))-((1-params(4))*y(5)/y(3));
  T(2)=params(5)*y(3)^params(6);
  T(3)=y(7)^params(1);
  residual(4)=(T(2)*T(3))-(y(1));
  T(4)=y(7)^(-params(1));
  residual(5)=(T(4))-(T(4)*params(2)*(y(2)+1-params(3)));
  T(5)=y(8)*y(4)^params(4);
  T(6)=y(3)^(1-params(4));
  residual(6)=(y(5))-(T(5)*T(6));
  residual(7)=(y(5))-(y(6)+y(7));
  T(7)=getPowerDeriv(y(7),(-params(1)),1);
if nargout > 3
    g1_v = NaN(19, 1);
g1_v(1)=(-(params(4)*(-y(5))/(y(4)*y(4))));
g1_v(2)=1-(1-params(3));
g1_v(3)=(-(T(6)*y(8)*getPowerDeriv(y(4),params(4),1)));
g1_v(4)=(-1);
g1_v(5)=(-1);
g1_v(6)=(-((1-params(4))*(-y(5))/(y(3)*y(3))));
g1_v(7)=T(3)*params(5)*getPowerDeriv(y(3),params(6),1);
g1_v(8)=(-(T(5)*getPowerDeriv(y(3),1-params(4),1)));
g1_v(9)=1;
g1_v(10)=(-1);
g1_v(11)=1;
g1_v(12)=(-(T(4)*params(2)));
g1_v(13)=(-(params(4)*1/y(4)));
g1_v(14)=(-((1-params(4))*1/y(3)));
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=T(2)*getPowerDeriv(y(7),params(1),1);
g1_v(18)=T(7)-(y(2)+1-params(3))*params(2)*T(7);
g1_v(19)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
