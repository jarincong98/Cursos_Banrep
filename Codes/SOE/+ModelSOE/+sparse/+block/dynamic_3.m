function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(16)=y(15)/(steady_state(2));
  y(19)=y(15)-y(17)-y(18);
end
