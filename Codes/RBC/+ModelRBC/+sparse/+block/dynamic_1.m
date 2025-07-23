function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  T(1)=params(8)^(1-params(7));
  y(16)=y(8)^params(7)*T(1)*(1+x(1));
end
