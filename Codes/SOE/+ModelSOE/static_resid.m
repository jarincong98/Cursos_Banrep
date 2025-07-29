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
    T = ModelSOE.static_resid_tt(T, y, x, params);
end
residual = zeros(13, 1);
    residual(1) = (y(5)) - (y(13)-y(13)*(1-params(3)));
    residual(2) = (params(5)*y(10)^params(6)) - (T(1)*y(11));
    residual(3) = (1) - (params(2)*(1-params(3)+y(12)));
    residual(4) = (1) - (params(2)*(1+y(8)));
    residual(5) = (y(8)) - (params(14)*exp(params(10)*(y(7)-params(12))));
    residual(6) = (y(2)) - (y(1)*T(2)*T(3));
    residual(7) = (y(12)) - (params(4)*y(2)/y(13));
    residual(8) = (y(11)) - (y(2)*(1-params(4))/y(10));
    residual(9) = (y(7)+y(5)+y(4)) - (y(2)+(1+y(8))*y(7)+y(9));
    residual(10) = (y(1)) - (y(1)*params(7)+params(11)*(1-params(7))+x(1));
    residual(11) = (y(9)) - (y(9)*params(9)+params(13)*(1-params(9))+x(2));
    residual(12) = (y(6)) - (y(2)-y(4)-y(5));
    residual(13) = (y(3)) - (y(2)/(y(2)));

end
