function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  T(2)=1/y(18)*(y(11)/params(4))^params(4);
  T(3)=(y(10)/(1-params(4)))^(1-params(4));
  y(12)=T(2)*T(3);
  residual(1)=(y(11))-(params(4)*y(12)*y(15)/y(5));
  T(4)=params(5)*y(13)^params(6);
  T(5)=y(17)^params(1);
  residual(2)=(T(4)*T(5))-(y(10));
  T(6)=y(18)*y(5)^params(4);
  T(7)=y(13)^(1-params(4));
  residual(3)=(y(15))-(T(6)*T(7));
  residual(4)=(y(15))-(y(16)+y(17));
  residual(5)=(y(14))-(y(5)*(1-params(3))+y(16));
  residual(6)=(y(10))-((1-params(4))*y(12)*y(15)/y(13));
  T(8)=params(2)*y(26)^(-params(1));
  residual(7)=(y(17)^(-params(1)))-(T(8)*(1-params(3)+params(4)*y(24)/y(14)));
  T(9)=T(2)*1/(1-params(4))*getPowerDeriv(y(10)/(1-params(4)),1-params(4),1);
  T(10)=T(3)*1/y(18)*1/params(4)*getPowerDeriv(y(11)/params(4),params(4),1);
if nargout > 3
    g1_v = NaN(24, 1);
g1_v(1)=(-(params(4)*y(12)*(-y(15))/(y(5)*y(5))));
g1_v(2)=(-(T(7)*y(18)*getPowerDeriv(y(5),params(4),1)));
g1_v(3)=(-(1-params(3)));
g1_v(4)=1-y(15)/y(5)*params(4)*T(10);
g1_v(5)=(-(y(15)/y(13)*(1-params(4))*T(10)));
g1_v(6)=(-(y(15)/y(5)*params(4)*T(9)));
g1_v(7)=(-1);
g1_v(8)=1-y(15)/y(13)*(1-params(4))*T(9);
g1_v(9)=T(5)*params(5)*getPowerDeriv(y(13),params(6),1);
g1_v(10)=(-(T(6)*getPowerDeriv(y(13),1-params(4),1)));
g1_v(11)=(-((1-params(4))*y(12)*(-y(15))/(y(13)*y(13))));
g1_v(12)=(-1);
g1_v(13)=(-1);
g1_v(14)=1;
g1_v(15)=(-(T(8)*(-(params(4)*y(24)))/(y(14)*y(14))));
g1_v(16)=(-(params(4)*y(12)*1/y(5)));
g1_v(17)=1;
g1_v(18)=1;
g1_v(19)=(-((1-params(4))*y(12)*1/y(13)));
g1_v(20)=T(4)*getPowerDeriv(y(17),params(1),1);
g1_v(21)=(-1);
g1_v(22)=getPowerDeriv(y(17),(-params(1)),1);
g1_v(23)=(-(T(8)*params(4)/y(14)));
g1_v(24)=(-((1-params(3)+params(4)*y(24)/y(14))*params(2)*getPowerDeriv(y(26),(-params(1)),1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
