function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  y(20)=y(17)*(1-params(4))/y(19);
  T(1)=y(13)*y(12)^params(4);
  T(2)=y(19)^(1-params(4));
  residual(1)=(y(17))-(T(1)*T(2));
  residual(2)=(y(16))-(y(24)-(1-params(3))*y(12)+params(8)/2*(y(24)-y(12))^2);
  T(3)=y(18)^(-params(1));
  residual(3)=(params(5)*y(19)^params(6))-(T(3)*y(20));
  residual(4)=(y(14)+y(16)+y(18))-(y(17)+(1+y(15))*y(2)+y(22));
  T(4)=(y(30)/y(18))^params(1);
  residual(5)=(T(4)*(1+params(8)*(y(24)-y(12))))-(params(2)*(1-params(3)+y(33)-params(8)*(y(36)-y(24))));
  residual(6)=(T(4))-(params(2)*(1+y(27)));
  T(5)=exp(params(10)*(y(14)-params(13)));
  residual(7)=(y(15))-(params(15)*T(5));
  residual(8)=(y(21))-(params(4)*y(17)/y(12));
  T(6)=getPowerDeriv(y(30)/y(18),params(1),1);
if nargout > 3
    g1_v = NaN(29, 1);
g1_v(1)=(-(1+y(15)));
g1_v(2)=(-(T(2)*y(13)*getPowerDeriv(y(12),params(4),1)));
g1_v(3)=(-(params(8)/2*(-(2*(y(24)-y(12))))-(1-params(3))));
g1_v(4)=T(4)*(-params(8));
g1_v(5)=(-(params(4)*(-y(17))/(y(12)*y(12))));
g1_v(6)=1;
g1_v(7)=(-(T(3)*(1-params(4))/y(19)));
g1_v(8)=(-1);
g1_v(9)=(-(params(4)*1/y(12)));
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=(-(T(1)*getPowerDeriv(y(19),1-params(4),1)));
g1_v(13)=params(5)*getPowerDeriv(y(19),params(6),1)-T(3)*(-(y(17)*(1-params(4))))/(y(19)*y(19));
g1_v(14)=1;
g1_v(15)=(-(params(15)*params(10)*T(5)));
g1_v(16)=(-(1+params(8)/2*2*(y(24)-y(12))));
g1_v(17)=params(8)*T(4)-params(8)*params(2);
g1_v(18)=(-(y(20)*getPowerDeriv(y(18),(-params(1)),1)));
g1_v(19)=1;
g1_v(20)=(1+params(8)*(y(24)-y(12)))*(-y(30))/(y(18)*y(18))*T(6);
g1_v(21)=(-y(30))/(y(18)*y(18))*T(6);
g1_v(22)=(-y(2));
g1_v(23)=1;
g1_v(24)=1;
g1_v(25)=(-(params(2)*(-params(8))));
g1_v(26)=(1+params(8)*(y(24)-y(12)))*T(6)*1/y(18);
g1_v(27)=T(6)*1/y(18);
g1_v(28)=(-params(2));
g1_v(29)=(-params(2));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 24);
end
end
