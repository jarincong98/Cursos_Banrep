function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = ModelRBC.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(25,1);
g2_j = zeros(25,1);
g2_v = zeros(25,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=1;
g2_i(6)=1;
g2_i(7)=1;
g2_i(8)=1;
g2_i(9)=2;
g2_i(10)=2;
g2_i(11)=2;
g2_i(12)=4;
g2_i(13)=4;
g2_i(14)=4;
g2_i(15)=5;
g2_i(16)=5;
g2_i(17)=5;
g2_i(18)=5;
g2_i(19)=6;
g2_i(20)=6;
g2_i(21)=6;
g2_i(22)=6;
g2_i(23)=7;
g2_i(24)=7;
g2_i(25)=7;
g2_j(1)=53;
g2_j(2)=49;
g2_j(3)=5;
g2_j(4)=58;
g2_j(5)=113;
g2_j(6)=1;
g2_j(7)=10;
g2_j(8)=109;
g2_j(9)=1;
g2_j(10)=7;
g2_j(11)=73;
g2_j(12)=53;
g2_j(13)=55;
g2_j(14)=77;
g2_j(15)=53;
g2_j(16)=57;
g2_j(17)=101;
g2_j(18)=105;
g2_j(19)=47;
g2_j(20)=124;
g2_j(21)=105;
g2_j(22)=131;
g2_j(23)=14;
g2_j(24)=24;
g2_j(25)=134;
g2_v(1)=(-(T(2)*getPowerDeriv(y(5),1-params(4),2)));
g2_v(2)=(-(T(9)*T(12)));
g2_v(3)=g2_v(2);
g2_v(4)=(-(T(1)*T(9)));
g2_v(5)=g2_v(4);
g2_v(6)=(-(T(3)*y(10)*getPowerDeriv(y(1),params(4),2)));
g2_v(7)=(-(T(3)*T(11)));
g2_v(8)=g2_v(7);
g2_v(9)=(-(params(4)*(-((-y(7))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
g2_v(10)=(-(params(4)*(-1)/(y(1)*y(1))));
g2_v(11)=g2_v(10);
g2_v(12)=(-((1-params(4))*(-((-y(7))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))));
g2_v(13)=(-((1-params(4))*(-1)/(y(5)*y(5))));
g2_v(14)=g2_v(13);
g2_v(15)=T(5)*params(5)*getPowerDeriv(y(5),params(6),2);
g2_v(16)=T(10)*T(13);
g2_v(17)=g2_v(16);
g2_v(18)=T(4)*getPowerDeriv(y(9),params(1),2);
g2_v(19)=(-T(14));
g2_v(20)=g2_v(19);
g2_v(21)=getPowerDeriv(y(9),(-params(1)),2);
g2_v(22)=(-((y(4)+1-params(3))*params(2)*getPowerDeriv(y(11),(-params(1)),2)));
g2_v(23)=(-((1+x(it_, 1))*T(7)*getPowerDeriv(y(2),params(7),2)));
g2_v(24)=(-T(15));
g2_v(25)=g2_v(24);
g2 = sparse(g2_i,g2_j,g2_v,8,144);
end
