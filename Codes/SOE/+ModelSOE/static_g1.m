function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = ModelSOE.static_g1_tt(T, y, x, params);
end
g1 = zeros(13, 13);
g1(1,5)=1;
g1(1,13)=(-(1-(1-params(3))));
g1(2,4)=(-(y(11)*getPowerDeriv(y(4),(-params(1)),1)));
g1(2,10)=params(5)*getPowerDeriv(y(10),params(6),1);
g1(2,11)=(-T(1));
g1(3,12)=(-params(2));
g1(4,8)=(-params(2));
g1(5,7)=(-(params(14)*params(10)*exp(params(10)*(y(7)-params(12)))));
g1(5,8)=1;
g1(6,1)=(-(T(2)*T(3)));
g1(6,2)=1;
g1(6,10)=(-(y(1)*T(2)*getPowerDeriv(y(10),1-params(4),1)));
g1(6,13)=(-(T(3)*y(1)*getPowerDeriv(y(13),params(4),1)));
g1(7,2)=(-(params(4)*1/y(13)));
g1(7,12)=1;
g1(7,13)=(-(params(4)*(-y(2))/(y(13)*y(13))));
g1(8,2)=(-((1-params(4))/y(10)));
g1(8,10)=(-((-(y(2)*(1-params(4))))/(y(10)*y(10))));
g1(8,11)=1;
g1(9,2)=(-1);
g1(9,4)=1;
g1(9,5)=1;
g1(9,7)=1-(1+y(8));
g1(9,8)=(-y(7));
g1(10,1)=1-params(7);
g1(11,9)=1-params(9);
g1(12,2)=(-1);
g1(12,4)=1;
g1(12,5)=1;
g1(12,6)=1;
g1(13,2)=(-(((y(2))-y(2))/((y(2))*(y(2)))));
g1(13,3)=1;

end
