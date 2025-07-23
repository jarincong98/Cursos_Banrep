function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  residual(1)=(y(2))-(params(4)*y(3)*y(6)/y(5));
  residual(2)=(y(1))-((1-params(4))*y(3)*y(6)/y(4));
  T(2)=1/y(9)*(y(2)/params(4))^params(4);
  T(3)=(y(1)/(1-params(4)))^(1-params(4));
  residual(3)=(y(3))-(T(2)*T(3));
  residual(4)=(y(5))-(y(5)*(1-params(3))+y(7));
  T(4)=params(5)*y(4)^params(6);
  T(5)=y(8)^params(1);
  residual(5)=(T(4)*T(5))-(y(1));
  T(6)=y(8)^(-params(1));
  residual(6)=(T(6))-(T(6)*params(2)*(1-params(3)+y(6)*params(4)/y(5)));
  T(7)=y(9)*y(5)^params(4);
  T(8)=y(4)^(1-params(4));
  residual(7)=(y(6))-(T(7)*T(8));
  residual(8)=(y(6))-(y(7)+y(8));
  T(9)=getPowerDeriv(y(8),(-params(1)),1);
if nargout > 3
    g1_v = NaN(25, 1);
g1_v(1)=1;
g1_v(2)=(-(T(3)*1/y(9)*1/params(4)*getPowerDeriv(y(2)/params(4),params(4),1)));
g1_v(3)=(-(params(4)*y(3)*1/y(5)));
g1_v(4)=(-((1-params(4))*y(3)*1/y(4)));
g1_v(5)=(-(T(6)*params(2)*params(4)/y(5)));
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-(params(4)*y(6)/y(5)));
g1_v(9)=(-((1-params(4))*y(6)/y(4)));
g1_v(10)=1;
g1_v(11)=(-1);
g1_v(12)=(-1);
g1_v(13)=1;
g1_v(14)=(-(T(2)*1/(1-params(4))*getPowerDeriv(y(1)/(1-params(4)),1-params(4),1)));
g1_v(15)=(-1);
g1_v(16)=(-(params(4)*y(3)*(-y(6))/(y(5)*y(5))));
g1_v(17)=1-(1-params(3));
g1_v(18)=(-(T(6)*params(2)*(-(y(6)*params(4)))/(y(5)*y(5))));
g1_v(19)=(-(T(8)*y(9)*getPowerDeriv(y(5),params(4),1)));
g1_v(20)=(-((1-params(4))*y(3)*(-y(6))/(y(4)*y(4))));
g1_v(21)=T(5)*params(5)*getPowerDeriv(y(4),params(6),1);
g1_v(22)=(-(T(7)*getPowerDeriv(y(4),1-params(4),1)));
g1_v(23)=T(4)*getPowerDeriv(y(8),params(1),1);
g1_v(24)=T(9)-(1-params(3)+y(6)*params(4)/y(5))*params(2)*T(9);
g1_v(25)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
end
