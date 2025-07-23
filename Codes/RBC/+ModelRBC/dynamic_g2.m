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
g2_i = zeros(47,1);
g2_j = zeros(47,1);
g2_v = zeros(47,1);

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
g2_i(12)=2;
g2_i(13)=2;
g2_i(14)=2;
g2_i(15)=2;
g2_i(16)=3;
g2_i(17)=3;
g2_i(18)=3;
g2_i(19)=3;
g2_i(20)=3;
g2_i(21)=3;
g2_i(22)=3;
g2_i(23)=4;
g2_i(24)=4;
g2_i(25)=4;
g2_i(26)=4;
g2_i(27)=4;
g2_i(28)=4;
g2_i(29)=4;
g2_i(30)=4;
g2_i(31)=4;
g2_i(32)=6;
g2_i(33)=6;
g2_i(34)=6;
g2_i(35)=6;
g2_i(36)=7;
g2_i(37)=7;
g2_i(38)=7;
g2_i(39)=7;
g2_i(40)=7;
g2_i(41)=7;
g2_i(42)=7;
g2_i(43)=7;
g2_i(44)=7;
g2_i(45)=8;
g2_i(46)=8;
g2_i(47)=8;
g2_j(1)=76;
g2_j(2)=71;
g2_j(3)=6;
g2_j(4)=81;
g2_j(5)=146;
g2_j(6)=1;
g2_j(7)=11;
g2_j(8)=141;
g2_j(9)=57;
g2_j(10)=5;
g2_j(11)=64;
g2_j(12)=103;
g2_j(13)=1;
g2_j(14)=8;
g2_j(15)=99;
g2_j(16)=62;
g2_j(17)=75;
g2_j(18)=64;
g2_j(19)=103;
g2_j(20)=76;
g2_j(21)=78;
g2_j(22)=104;
g2_j(23)=31;
g2_j(24)=32;
g2_j(25)=45;
g2_j(26)=39;
g2_j(27)=143;
g2_j(28)=46;
g2_j(29)=53;
g2_j(30)=144;
g2_j(31)=151;
g2_j(32)=76;
g2_j(33)=80;
g2_j(34)=132;
g2_j(35)=136;
g2_j(36)=91;
g2_j(37)=96;
g2_j(38)=161;
g2_j(39)=97;
g2_j(40)=175;
g2_j(41)=167;
g2_j(42)=180;
g2_j(43)=136;
g2_j(44)=181;
g2_j(45)=16;
g2_j(46)=28;
g2_j(47)=184;
g2_v(1)=(-(T(2)*getPowerDeriv(y(6),1-params(4),2)));
g2_v(2)=(-(T(16)*T(19)));
g2_v(3)=g2_v(2);
g2_v(4)=(-(T(1)*T(16)));
g2_v(5)=g2_v(4);
g2_v(6)=(-(T(3)*y(11)*getPowerDeriv(y(1),params(4),2)));
g2_v(7)=(-(T(3)*T(18)));
g2_v(8)=g2_v(7);
g2_v(9)=(-(params(4)*(-y(8))/(y(1)*y(1))));
g2_v(10)=g2_v(9);
g2_v(11)=(-(params(4)*1/y(1)));
g2_v(12)=g2_v(11);
g2_v(13)=(-(params(4)*y(5)*(-((-y(8))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
g2_v(14)=(-(params(4)*y(5)*(-1)/(y(1)*y(1))));
g2_v(15)=g2_v(14);
g2_v(16)=(-((1-params(4))*(-y(8))/(y(6)*y(6))));
g2_v(17)=g2_v(16);
g2_v(18)=(-((1-params(4))*1/y(6)));
g2_v(19)=g2_v(18);
g2_v(20)=(-((1-params(4))*y(5)*(-((-y(8))*(y(6)+y(6))))/(y(6)*y(6)*y(6)*y(6))));
g2_v(21)=(-((1-params(4))*y(5)*(-1)/(y(6)*y(6))));
g2_v(22)=g2_v(21);
g2_v(23)=(-(T(5)*1/(1-params(4))*1/(1-params(4))*getPowerDeriv(y(3)/(1-params(4)),1-params(4),2)));
g2_v(24)=(-(T(13)*T(15)));
g2_v(25)=g2_v(24);
g2_v(26)=(-(T(13)*T(4)*(-1)/(y(11)*y(11))));
g2_v(27)=g2_v(26);
g2_v(28)=(-(T(6)*1/y(11)*1/params(4)*1/params(4)*getPowerDeriv(y(4)/params(4),params(4),2)));
g2_v(29)=(-(T(6)*T(14)*(-1)/(y(11)*y(11))));
g2_v(30)=g2_v(29);
g2_v(31)=(-(T(6)*T(4)*(y(11)+y(11))/(y(11)*y(11)*y(11)*y(11))));
g2_v(32)=T(8)*params(5)*getPowerDeriv(y(6),params(6),2);
g2_v(33)=T(17)*T(20);
g2_v(34)=g2_v(33);
g2_v(35)=T(7)*getPowerDeriv(y(10),params(1),2);
g2_v(36)=(-(T(9)*(-((-(params(4)*y(12)))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
g2_v(37)=(-(T(9)*(-params(4))/(y(7)*y(7))));
g2_v(38)=g2_v(37);
g2_v(39)=(-((-(params(4)*y(12)))/(y(7)*y(7))*T(21)));
g2_v(40)=g2_v(39);
g2_v(41)=(-(params(4)/y(7)*T(21)));
g2_v(42)=g2_v(41);
g2_v(43)=getPowerDeriv(y(10),(-params(1)),2);
g2_v(44)=(-(T(10)*params(2)*getPowerDeriv(y(13),(-params(1)),2)));
g2_v(45)=(-((1+x(it_, 1))*T(11)*getPowerDeriv(y(2),params(7),2)));
g2_v(46)=(-T(22));
g2_v(47)=g2_v(46);
g2 = sparse(g2_i,g2_j,g2_v,9,196);
end
