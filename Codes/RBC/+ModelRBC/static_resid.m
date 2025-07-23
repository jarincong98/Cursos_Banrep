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
residual = zeros(9, 1);
    residual(1) = (y(6)) - (T(2)*T(3));
    residual(2) = (y(2)) - (params(4)*y(3)*y(6)/y(5));
    residual(3) = (y(1)) - ((1-params(4))*y(3)*y(6)/y(4));
    residual(4) = (y(3)) - (T(5)*T(6));
    residual(5) = (y(5)) - (y(5)*(1-params(3))+y(7));
    residual(6) = (T(7)*T(8)) - (y(1));
    residual(7) = (T(9)) - (T(9)*params(2)*(1-params(3)+y(6)*params(4)/y(5)));
    residual(8) = (y(9)) - (y(9)^params(7)*T(10)*(1+x(1)));
    residual(9) = (y(6)) - (y(7)+y(8));

end
