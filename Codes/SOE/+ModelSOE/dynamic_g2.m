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
    T = ModelSOE.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(41,1);
g2_j = zeros(41,1);
g2_v = zeros(41,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=2;
g2_i(6)=2;
g2_i(7)=2;
g2_i(8)=2;
g2_i(9)=3;
g2_i(10)=3;
g2_i(11)=3;
g2_i(12)=3;
g2_i(13)=3;
g2_i(14)=3;
g2_i(15)=3;
g2_i(16)=3;
g2_i(17)=3;
g2_i(18)=3;
g2_i(19)=3;
g2_i(20)=3;
g2_i(21)=4;
g2_i(22)=4;
g2_i(23)=4;
g2_i(24)=4;
g2_i(25)=5;
g2_i(26)=6;
g2_i(27)=6;
g2_i(28)=6;
g2_i(29)=6;
g2_i(30)=6;
g2_i(31)=6;
g2_i(32)=6;
g2_i(33)=6;
g2_i(34)=7;
g2_i(35)=7;
g2_i(36)=7;
g2_i(37)=8;
g2_i(38)=8;
g2_i(39)=8;
g2_i(40)=9;
g2_i(41)=9;
g2_j(1)=70;
g2_j(2)=82;
g2_j(3)=334;
g2_j(4)=346;
g2_j(5)=185;
g2_j(6)=189;
g2_j(7)=273;
g2_j(8)=254;
g2_j(9)=185;
g2_j(10)=194;
g2_j(11)=383;
g2_j(12)=180;
g2_j(13)=75;
g2_j(14)=192;
g2_j(15)=339;
g2_j(16)=392;
g2_j(17)=378;
g2_j(18)=84;
g2_j(19)=390;
g2_j(20)=348;
g2_j(21)=185;
g2_j(22)=194;
g2_j(23)=383;
g2_j(24)=392;
g2_j(25)=116;
g2_j(26)=100;
g2_j(27)=247;
g2_j(28)=92;
g2_j(29)=71;
g2_j(30)=254;
g2_j(31)=246;
g2_j(32)=78;
g2_j(33)=70;
g2_j(34)=158;
g2_j(35)=74;
g2_j(36)=70;
g2_j(37)=166;
g2_j(38)=250;
g2_j(39)=254;
g2_j(40)=29;
g2_j(41)=134;
g2_v(1)=(-params(8));
g2_v(2)=(-(T(1)*(-2)));
g2_v(3)=g2_v(2);
g2_v(4)=(-params(8));
g2_v(5)=(-(y(13)*getPowerDeriv(y(9),(-params(1)),2)));
g2_v(6)=(-T(6));
g2_v(7)=g2_v(6);
g2_v(8)=params(5)*getPowerDeriv(y(12),params(6),2);
g2_v(9)=(1+params(8)*(y(16)-y(4)))*T(13);
g2_v(10)=(1+params(8)*(y(16)-y(4)))*T(14);
g2_v(11)=g2_v(10);
g2_v(12)=T(7)*T(8)*(-params(8));
g2_v(13)=g2_v(12);
g2_v(14)=params(8)*T(7)*T(8);
g2_v(15)=g2_v(14);
g2_v(16)=(1+params(8)*(y(16)-y(4)))*T(15);
g2_v(17)=T(9)*(-params(8));
g2_v(18)=g2_v(17);
g2_v(19)=params(8)*T(9);
g2_v(20)=g2_v(19);
g2_v(21)=T(13);
g2_v(22)=T(14);
g2_v(23)=g2_v(22);
g2_v(24)=T(15);
g2_v(25)=(-(params(14)*params(10)*params(10)*exp(params(10)*(y(6)-params(12)))));
g2_v(26)=(-(T(4)*T(10)));
g2_v(27)=g2_v(26);
g2_v(28)=(-(T(5)*T(11)));
g2_v(29)=g2_v(28);
g2_v(30)=(-(y(5)*T(4)*getPowerDeriv(y(12),1-params(4),2)));
g2_v(31)=(-(T(10)*y(5)*T(11)));
g2_v(32)=g2_v(31);
g2_v(33)=(-(T(5)*y(5)*getPowerDeriv(y(4),params(4),2)));
g2_v(34)=(-(params(4)*(-1)/(y(4)*y(4))));
g2_v(35)=g2_v(34);
g2_v(36)=(-(params(4)*(-((-y(8))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4))));
g2_v(37)=(-((-(1-params(4)))/(y(12)*y(12))));
g2_v(38)=g2_v(37);
g2_v(39)=(-((-((-(y(8)*(1-params(4))))*(y(12)+y(12))))/(y(12)*y(12)*y(12)*y(12))));
g2_v(40)=(-1);
g2_v(41)=g2_v(40);
g2 = sparse(g2_i,g2_j,g2_v,12,484);
end
