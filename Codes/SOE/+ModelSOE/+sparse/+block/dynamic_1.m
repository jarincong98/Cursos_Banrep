function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(13)=y(1)*params(7)+params(12)*(1-params(7))+x(1);
  y(22)=y(10)*params(9)+params(14)*(1-params(9))+x(2);
end
