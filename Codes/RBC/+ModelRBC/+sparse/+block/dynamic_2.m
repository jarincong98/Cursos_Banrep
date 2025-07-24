function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(15))-(params(4)*y(10)/y(8));
  residual(2)=(y(13))-((1-params(4))*y(10)/y(14));
  T(2)=params(5)*y(14)^params(7);
  T(3)=y(11)^params(1);
  residual(3)=(T(2)*T(3))-(y(13));
  T(4)=y(9)*y(8)^params(4);
  T(5)=y(14)^(1-params(4));
  residual(4)=(y(10))-(T(4)*T(5));
  residual(5)=(y(10))-(y(12)+y(11));
  residual(6)=(y(16))-(y(8)*(1-params(3))+y(12)+params(6)/2*(y(16)-y(8))^2);
  residual(7)=((y(19)/y(11))^params(1))-(params(2)*(y(15)+1-params(3)+params(6)*(y(16)-y(8))));
  T(6)=getPowerDeriv(y(19)/y(11),params(1),1);
if nargout > 3
    g1_v = NaN(23, 1);
g1_v(1)=(-(params(4)*(-y(10))/(y(8)*y(8))));
g1_v(2)=(-(T(5)*y(9)*getPowerDeriv(y(8),params(4),1)));
g1_v(3)=(-(1-params(3)+params(6)/2*(-(2*(y(16)-y(8))))));
g1_v(4)=(-(params(2)*(-params(6))));
g1_v(5)=1;
g1_v(6)=(-params(2));
g1_v(7)=(-((1-params(4))*(-y(10))/(y(14)*y(14))));
g1_v(8)=T(3)*params(5)*getPowerDeriv(y(14),params(7),1);
g1_v(9)=(-(T(4)*getPowerDeriv(y(14),1-params(4),1)));
g1_v(10)=1;
g1_v(11)=(-1);
g1_v(12)=(-(params(4)*1/y(8)));
g1_v(13)=(-((1-params(4))*1/y(14)));
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=(-1);
g1_v(17)=(-1);
g1_v(18)=1-params(6)/2*2*(y(16)-y(8));
g1_v(19)=(-(params(6)*params(2)));
g1_v(20)=T(2)*getPowerDeriv(y(11),params(1),1);
g1_v(21)=(-1);
g1_v(22)=(-y(19))/(y(11)*y(11))*T(6);
g1_v(23)=T(6)*1/y(11);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
