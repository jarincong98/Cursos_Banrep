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
    T = ModelSOE.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(13, 23);
g1(1,9)=1;
g1(1,4)=(-(params(8)/2*(-(2*(y(17)-y(4))))-(1-params(3))));
g1(1,17)=(-(1+params(8)/2*2*(y(17)-y(4))));
g1(2,8)=(-(y(15)*getPowerDeriv(y(8),(-params(1)),1)));
g1(2,14)=params(5)*getPowerDeriv(y(14),params(6),1);
g1(2,15)=(-T(1));
g1(3,8)=(1+params(8)*(y(17)-y(4)))*(-y(18))/(y(8)*y(8))*T(5);
g1(3,18)=(1+params(8)*(y(17)-y(4)))*T(5)*1/y(8);
g1(3,20)=(-params(2));
g1(3,4)=T(2)*(-params(8));
g1(3,17)=params(8)*T(2)-params(8)*params(2);
g1(3,21)=(-(params(2)*(-params(8))));
g1(4,8)=(-y(18))/(y(8)*y(8))*T(5);
g1(4,18)=T(5)*1/y(8);
g1(4,19)=(-params(2));
g1(5,11)=(-(params(14)*params(10)*exp(params(10)*(y(11)-params(12)))));
g1(5,12)=1;
g1(6,5)=(-(T(3)*T(4)));
g1(6,6)=1;
g1(6,14)=(-(y(5)*T(3)*getPowerDeriv(y(14),1-params(4),1)));
g1(6,4)=(-(T(4)*y(5)*getPowerDeriv(y(4),params(4),1)));
g1(7,6)=(-(params(4)*1/y(4)));
g1(7,16)=1;
g1(7,4)=(-(params(4)*(-y(6))/(y(4)*y(4))));
g1(8,6)=(-((1-params(4))/y(14)));
g1(8,14)=(-((-(y(6)*(1-params(4))))/(y(14)*y(14))));
g1(8,15)=1;
g1(9,6)=(-1);
g1(9,8)=1;
g1(9,9)=1;
g1(9,2)=(-(1+y(12)));
g1(9,11)=1;
g1(9,12)=(-y(2));
g1(9,13)=(-1);
g1(10,1)=(-params(7));
g1(10,5)=1;
g1(10,22)=(-1);
g1(11,3)=(-params(9));
g1(11,13)=1;
g1(11,23)=(-1);
g1(12,6)=(-1);
g1(12,8)=1;
g1(12,9)=1;
g1(12,10)=1;
g1(13,6)=(-(1/(steady_state(2))));
g1(13,7)=1;

end
