function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = ModelRBC.static_resid_tt(T, y, x, params);
end
residual = zeros(8, 1);
    residual(1) = (y(5)) - (T(2)*T(3));
    residual(2) = (y(2)) - (params(4)*y(5)/y(4));
    residual(3) = (y(4)) - (y(4)*(1-params(3))+y(6));
    residual(4) = (y(1)) - ((1-params(4))*y(5)/y(3));
    residual(5) = (T(4)*T(5)) - (y(1));
    residual(6) = (1) - (params(2)*(y(2)+1-params(3)));
    residual(7) = (y(8)) - (y(8)^params(8)*T(6)*(1+x(1)));
    residual(8) = (y(5)) - (y(6)+y(7));

end
