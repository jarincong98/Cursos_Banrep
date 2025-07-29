function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  T(1)=y(13)*y(12)^params(4);
  T(2)=y(20)^(1-params(4));
  residual(1)=(y(16))-(T(1)*T(2));
  residual(2)=(y(21))-(y(16)*(1-params(4))/y(20));
  residual(3)=(y(18))-(y(24)-(1-params(3))*y(12)+params(8)/2*(y(24)-y(12))^2);
  T(3)=y(17)^(-params(1));
  residual(4)=(params(5)*y(20)^params(6))-(T(3)*y(21));
  residual(5)=(y(14)+y(18)+y(17))-(y(16)+(1+y(15))*y(2)+y(23));
  T(4)=(y(29)/y(17))^params(1);
  residual(6)=(T(4)*(1+params(8)*(y(24)-y(12))))-(params(2)*(1-params(3)+y(34)-params(8)*(y(36)-y(24))));
  residual(7)=(T(4))-(params(2)*(1+y(27)));
  T(5)=exp(params(10)*(y(14)-params(12)));
  residual(8)=(y(15))-(params(14)*T(5));
  residual(9)=(y(22))-(params(4)*y(16)/y(12));
  T(6)=getPowerDeriv(y(29)/y(17),params(1),1);
if nargout > 3
    g1_v = NaN(32, 1);
g1_v(1)=(-(1+y(15)));
g1_v(2)=(-(T(2)*y(13)*getPowerDeriv(y(12),params(4),1)));
g1_v(3)=(-(params(8)/2*(-(2*(y(24)-y(12))))-(1-params(3))));
g1_v(4)=T(4)*(-params(8));
g1_v(5)=(-(params(4)*(-y(16))/(y(12)*y(12))));
g1_v(6)=1;
g1_v(7)=(-((1-params(4))/y(20)));
g1_v(8)=(-1);
g1_v(9)=(-(params(4)*1/y(12)));
g1_v(10)=(-(T(1)*getPowerDeriv(y(20),1-params(4),1)));
g1_v(11)=(-((-(y(16)*(1-params(4))))/(y(20)*y(20))));
g1_v(12)=params(5)*getPowerDeriv(y(20),params(6),1);
g1_v(13)=1;
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=(-T(3));
g1_v(17)=1;
g1_v(18)=(-(params(14)*params(10)*T(5)));
g1_v(19)=(-(1+params(8)/2*2*(y(24)-y(12))));
g1_v(20)=params(8)*T(4)-params(8)*params(2);
g1_v(21)=(-(y(21)*getPowerDeriv(y(17),(-params(1)),1)));
g1_v(22)=1;
g1_v(23)=(1+params(8)*(y(24)-y(12)))*(-y(29))/(y(17)*y(17))*T(6);
g1_v(24)=(-y(29))/(y(17)*y(17))*T(6);
g1_v(25)=(-y(2));
g1_v(26)=1;
g1_v(27)=1;
g1_v(28)=(-(params(2)*(-params(8))));
g1_v(29)=(1+params(8)*(y(24)-y(12)))*T(6)*1/y(17);
g1_v(30)=T(6)*1/y(17);
g1_v(31)=(-params(2));
g1_v(32)=(-params(2));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 27);
end
end
