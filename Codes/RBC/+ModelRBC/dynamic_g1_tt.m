function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 22);

T = ModelRBC.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(13) = 1/(1-params(4))*getPowerDeriv(y(3)/(1-params(4)),1-params(4),1);
T(14) = 1/params(4)*getPowerDeriv(y(4)/params(4),params(4),1);
T(15) = 1/y(11)*T(14);
T(16) = getPowerDeriv(y(6),1-params(4),1);
T(17) = params(5)*getPowerDeriv(y(6),params(6),1);
T(18) = getPowerDeriv(y(1),params(4),1);
T(19) = y(11)*T(18);
T(20) = getPowerDeriv(y(10),params(1),1);
T(21) = params(2)*getPowerDeriv(y(13),(-params(1)),1);
T(22) = T(11)*getPowerDeriv(y(2),params(7),1);

end
