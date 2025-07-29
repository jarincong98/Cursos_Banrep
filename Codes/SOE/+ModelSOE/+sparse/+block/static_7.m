function [y, T] = static_7(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(3)=y(2)/(y(2));
  y(6)=y(2)-y(4)-y(5);
end
