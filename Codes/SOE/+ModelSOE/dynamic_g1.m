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
g1 = zeros(12, 22);
g1(1,10)=1;
g1(1,4)=(-(T(1)*(-(2*(y(16)-y(4))))-(1-params(3))));
g1(1,16)=(-(1+T(1)*2*(y(16)-y(4))));
g1(2,9)=(-(y(13)*T(6)));
g1(2,12)=params(5)*getPowerDeriv(y(12),params(6),1);
g1(2,13)=(-T(2));
g1(3,9)=(1+params(8)*(y(16)-y(4)))*T(7)*T(8);
g1(3,18)=(1+params(8)*(y(16)-y(4)))*T(9);
g1(3,19)=(-params(2));
g1(3,4)=T(3)*(-params(8));
g1(3,16)=params(8)*T(3)-params(8)*params(2);
g1(3,20)=(-(params(2)*(-params(8))));
g1(4,17)=(-params(2));
g1(4,9)=T(7)*T(8);
g1(4,18)=T(9);
g1(5,6)=(-(params(14)*params(10)*exp(params(10)*(y(6)-params(12)))));
g1(5,7)=1;
g1(6,5)=(-(T(4)*T(5)));
g1(6,8)=1;
g1(6,12)=(-(y(5)*T(4)*T(10)));
g1(6,4)=(-(T(5)*y(5)*T(11)));
g1(7,8)=(-(params(4)*1/y(4)));
g1(7,14)=1;
g1(7,4)=(-(params(4)*(-y(8))/(y(4)*y(4))));
g1(8,8)=(-((1-params(4))/y(12)));
g1(8,12)=(-((-(y(8)*(1-params(4))))/(y(12)*y(12))));
g1(8,13)=1;
g1(9,2)=(-(1+y(7)));
g1(9,6)=1;
g1(9,7)=(-y(2));
g1(9,8)=(-1);
g1(9,9)=1;
g1(9,10)=1;
g1(9,15)=(-1);
g1(10,1)=(-params(7));
g1(10,5)=1;
g1(10,21)=(-1);
g1(11,3)=(-params(9));
g1(11,15)=1;
g1(11,22)=(-1);
g1(12,8)=(-1);
g1(12,9)=1;
g1(12,10)=1;
g1(12,11)=1;

end
