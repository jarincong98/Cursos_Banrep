function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(17))-(params(4)*y(11)/y(9));
  residual(2)=(y(15))-((1-params(4))*y(11)/y(16));
  T(2)=params(5)*y(16)^params(7);
  T(3)=y(13)^params(1);
  residual(3)=(T(2)*T(3))-(y(15));
  T(4)=y(10)*y(9)^params(4);
  T(5)=y(16)^(1-params(4));
  residual(4)=(y(11))-(T(4)*T(5));
  residual(5)=(y(11))-(y(14)+y(13));
  residual(6)=(y(18))-(y(9)*(1-params(3))+y(14)+params(6)/2*(y(18)-y(9))^2);
  residual(7)=((y(22)/y(13))^params(1))-(params(2)*(y(17)+1-params(3)+params(6)*(y(18)-y(9))));
  T(6)=getPowerDeriv(y(22)/y(13),params(1),1);
if nargout > 3
    g1_v = NaN(23, 1);
g1_v(1)=(-(params(4)*(-y(11))/(y(9)*y(9))));
g1_v(2)=(-(T(5)*y(10)*getPowerDeriv(y(9),params(4),1)));
g1_v(3)=(-(1-params(3)+params(6)/2*(-(2*(y(18)-y(9))))));
g1_v(4)=(-(params(2)*(-params(6))));
g1_v(5)=1;
g1_v(6)=(-params(2));
g1_v(7)=(-(params(4)*1/y(9)));
g1_v(8)=(-((1-params(4))*1/y(16)));
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=(-1);
g1_v(13)=(-((1-params(4))*(-y(11))/(y(16)*y(16))));
g1_v(14)=T(3)*params(5)*getPowerDeriv(y(16),params(7),1);
g1_v(15)=(-(T(4)*getPowerDeriv(y(16),1-params(4),1)));
g1_v(16)=(-1);
g1_v(17)=(-1);
g1_v(18)=1-params(6)/2*2*(y(18)-y(9));
g1_v(19)=(-(params(6)*params(2)));
g1_v(20)=T(2)*getPowerDeriv(y(13),params(1),1);
g1_v(21)=(-1);
g1_v(22)=(-y(22))/(y(13)*y(13))*T(6);
g1_v(23)=T(6)*1/y(13);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
