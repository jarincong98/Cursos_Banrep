function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(14)=y(1)*params(7)+params(11)*(1-params(7))+x(1);
  y(22)=y(9)*params(9)+params(13)*(1-params(9))+x(2);
end
