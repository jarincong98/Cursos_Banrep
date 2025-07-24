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
g1 = zeros(8, 12);
g1(1,5)=(-(T(2)*getPowerDeriv(y(5),1-params(4),1)));
g1(1,1)=(-(T(3)*y(10)*getPowerDeriv(y(1),params(4),1)));
g1(1,7)=1;
g1(1,10)=(-(T(1)*T(3)));
g1(2,4)=1;
g1(2,1)=(-(params(4)*(-y(7))/(y(1)*y(1))));
g1(2,7)=(-(params(4)*1/y(1)));
g1(3,1)=(-(1-params(3)+params(6)/2*(-(2*(y(6)-y(1))))));
g1(3,6)=1-params(6)/2*2*(y(6)-y(1));
g1(3,8)=(-1);
g1(4,3)=1;
g1(4,5)=(-((1-params(4))*(-y(7))/(y(5)*y(5))));
g1(4,7)=(-((1-params(4))*1/y(5)));
g1(5,3)=(-1);
g1(5,5)=T(5)*params(5)*getPowerDeriv(y(5),params(7),1);
g1(5,9)=T(4)*getPowerDeriv(y(9),params(1),1);
g1(6,4)=(-params(2));
g1(6,1)=(-(params(2)*(-params(6))));
g1(6,6)=(-(params(6)*params(2)));
g1(6,9)=(-y(11))/(y(9)*y(9))*T(8);
g1(6,11)=T(8)*1/y(9);
g1(7,2)=(-((1+x(it_, 1))*T(6)*getPowerDeriv(y(2),params(8),1)));
g1(7,10)=1;
g1(7,12)=(-T(7));
g1(8,7)=1;
g1(8,8)=(-1);
g1(8,9)=(-1);

end
