function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(10))-(params(4)*y(13)/y(4));
  residual(2)=(y(12))-(y(4)*(1-params(3))+y(14)+params(6)/2*(y(12)-y(4))^2);
  residual(3)=(y(9))-((1-params(4))*y(13)/y(11));
  T(2)=params(5)*y(11)^params(7);
  T(3)=y(15)^params(1);
  residual(4)=(T(2)*T(3))-(y(9));
  T(4)=y(16)*y(4)^params(4);
  T(5)=y(11)^(1-params(4));
  residual(5)=(y(13))-(T(4)*T(5));
  residual(6)=((y(23)/y(15))^params(1))-(params(2)*(y(10)+1-params(3)+params(6)*(y(12)-y(4))));
  residual(7)=(y(13))-(y(14)+y(15));
  T(6)=getPowerDeriv(y(23)/y(15),params(1),1);
if nargout > 3
    g1_v = NaN(23, 1);
g1_v(1)=(-(params(4)*(-y(13))/(y(4)*y(4))));
g1_v(2)=(-(1-params(3)+params(6)/2*(-(2*(y(12)-y(4))))));
g1_v(3)=(-(T(5)*y(16)*getPowerDeriv(y(4),params(4),1)));
g1_v(4)=(-(params(2)*(-params(6))));
g1_v(5)=1;
g1_v(6)=(-params(2));
g1_v(7)=(-1);
g1_v(8)=(-1);
g1_v(9)=(-(params(4)*1/y(4)));
g1_v(10)=(-((1-params(4))*1/y(11)));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-1);
g1_v(15)=(-((1-params(4))*(-y(13))/(y(11)*y(11))));
g1_v(16)=T(3)*params(5)*getPowerDeriv(y(11),params(7),1);
g1_v(17)=(-(T(4)*getPowerDeriv(y(11),1-params(4),1)));
g1_v(18)=1-params(6)/2*2*(y(12)-y(4));
g1_v(19)=(-(params(6)*params(2)));
g1_v(20)=T(2)*getPowerDeriv(y(15),params(1),1);
g1_v(21)=(-y(23))/(y(15)*y(15))*T(6);
g1_v(22)=(-1);
g1_v(23)=T(6)*1/y(15);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
