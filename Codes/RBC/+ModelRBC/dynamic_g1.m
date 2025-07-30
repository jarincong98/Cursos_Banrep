function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = ModelRBC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(9, 13);
g1(1,3)=(-(T(1)*T(2)));
g1(1,4)=1;
g1(1,9)=(-(y(3)*T(1)*getPowerDeriv(y(9),1-params(4),1)));
g1(1,2)=(-(T(2)*y(3)*getPowerDeriv(y(2),params(4),1)));
g1(2,4)=(-(params(4)*1/y(2)));
g1(2,10)=1;
g1(2,2)=(-(params(4)*(-y(4))/(y(2)*y(2))));
g1(3,7)=(-1);
g1(3,2)=(-(1-params(3)+params(6)/2*(-(2*(y(11)-y(2))))));
g1(3,11)=1-params(6)/2*2*(y(11)-y(2));
g1(4,4)=(-((1-params(4))*1/y(9)));
g1(4,8)=1;
g1(4,9)=(-((1-params(4))*(-y(4))/(y(9)*y(9))));
g1(5,6)=T(4)*getPowerDeriv(y(6),params(1),1);
g1(5,8)=(-1);
g1(5,9)=T(5)*params(5)*getPowerDeriv(y(9),params(7),1);
g1(6,6)=(-y(12))/(y(6)*y(6))*T(8);
g1(6,12)=T(8)*1/y(6);
g1(6,10)=(-params(2));
g1(6,2)=(-(params(2)*(-params(6))));
g1(6,11)=(-(params(6)*params(2)));
g1(7,1)=(-((1+x(it_, 1))*T(6)*getPowerDeriv(y(1),params(8),1)));
g1(7,3)=1;
g1(7,13)=(-T(7));
g1(8,4)=1;
g1(8,6)=(-1);
g1(8,7)=(-1);
g1(8,2)=(-(params(6)/2*(-(2*(y(11)-y(2))))));
g1(8,11)=(-(params(6)/2*2*(y(11)-y(2))));
g1(9,4)=(-(1/(steady_state(2))));
g1(9,5)=1;

end
