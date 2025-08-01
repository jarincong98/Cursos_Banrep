function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = ModelSOE.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(13, 1);
    residual(1) = (y(9)) - (y(17)-(1-params(3))*y(4)+T(1));
    residual(2) = (params(5)*y(14)^params(6)) - (T(2)*y(15));
    residual(3) = (T(3)*(1+params(8)*(y(17)-y(4)))) - (params(2)*(1-params(3)+y(20)-params(8)*(y(21)-y(17))));
    residual(4) = (T(3)) - (params(2)*(1+y(19)));
    residual(5) = (y(12)) - (params(14)*exp(params(10)*(y(11)-params(12))));
    residual(6) = (y(6)) - (y(5)*T(4)*T(5));
    residual(7) = (y(16)) - (params(4)*y(6)/y(4));
    residual(8) = (y(15)) - (y(6)*(1-params(4))/y(14));
    residual(9) = (y(11)+y(9)+y(8)) - (y(6)+(1+y(12))*y(2));
    residual(10) = (y(5)) - (y(1)*params(7)+params(11)*(1-params(7))+x(it_, 1));
    residual(11) = (y(13)) - (y(3)*params(9)+params(13)*(1-params(9))+x(it_, 2));
    residual(12) = (y(10)) - (T(1)+y(6)-y(8)-y(9));
    residual(13) = (y(7)) - (y(6)/(steady_state(2)));

end
