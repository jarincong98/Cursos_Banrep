function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(17))-(params(4)*y(11)/y(9));
  T(2)=params(6)/2*(y(18)-y(9))^2;
  residual(2)=(y(18))-(y(9)*(1-params(3))+y(14)+T(2));
  residual(3)=(y(15))-((1-params(4))*y(11)/y(16));
  T(3)=params(5)*y(16)^params(7);
  T(4)=y(13)^params(1);
  residual(4)=(T(3)*T(4))-(y(15));
  T(5)=y(10)*y(9)^params(4);
  T(6)=y(16)^(1-params(4));
  residual(5)=(y(11))-(T(5)*T(6));
  residual(6)=((y(22)/y(13))^params(1))-(params(2)*(y(17)+1-params(3)+params(6)*(y(18)-y(9))));
  residual(7)=(y(11))-(T(2)+y(14)+y(13));
  T(7)=getPowerDeriv(y(22)/y(13),params(1),1);
if nargout > 3
    g1_v = NaN(25, 1);
g1_v(1)=(-(params(4)*(-y(11))/(y(9)*y(9))));
g1_v(2)=(-(1-params(3)+params(6)/2*(-(2*(y(18)-y(9))))));
g1_v(3)=(-(T(6)*y(10)*getPowerDeriv(y(9),params(4),1)));
g1_v(4)=(-(params(2)*(-params(6))));
g1_v(5)=(-(params(6)/2*(-(2*(y(18)-y(9))))));
g1_v(6)=1;
g1_v(7)=(-params(2));
g1_v(8)=(-1);
g1_v(9)=(-1);
g1_v(10)=(-(params(4)*1/y(9)));
g1_v(11)=(-((1-params(4))*1/y(16)));
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=1;
g1_v(15)=(-1);
g1_v(16)=(-((1-params(4))*(-y(11))/(y(16)*y(16))));
g1_v(17)=T(4)*params(5)*getPowerDeriv(y(16),params(7),1);
g1_v(18)=(-(T(5)*getPowerDeriv(y(16),1-params(4),1)));
g1_v(19)=1-params(6)/2*2*(y(18)-y(9));
g1_v(20)=(-(params(6)*params(2)));
g1_v(21)=(-(params(6)/2*2*(y(18)-y(9))));
g1_v(22)=T(3)*getPowerDeriv(y(13),params(1),1);
g1_v(23)=(-y(22))/(y(13)*y(13))*T(7);
g1_v(24)=(-1);
g1_v(25)=T(7)*1/y(13);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
