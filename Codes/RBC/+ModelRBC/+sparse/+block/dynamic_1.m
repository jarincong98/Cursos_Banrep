function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  T(1)=params(9)^(1-params(8));
  y(10)=y(1)^params(8)*T(1)*(1+x(1));
end
