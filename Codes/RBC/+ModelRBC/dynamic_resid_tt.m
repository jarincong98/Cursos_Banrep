function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 12);

T(1) = y(1)^params(4);
T(2) = y(11)*T(1);
T(3) = y(6)^(1-params(4));
T(4) = (y(4)/params(4))^params(4);
T(5) = 1/y(11)*T(4);
T(6) = (y(3)/(1-params(4)))^(1-params(4));
T(7) = params(5)*y(6)^params(6);
T(8) = y(10)^params(1);
T(9) = params(2)*y(13)^(-params(1));
T(10) = 1-params(3)+params(4)*y(12)/y(7);
T(11) = params(8)^(1-params(7));
T(12) = y(2)^params(7)*T(11);

end
