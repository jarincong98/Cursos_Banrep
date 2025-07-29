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
g1 = zeros(12, 12);
g1(1,6)=1;
g1(1,12)=(-(1-(1-params(3))));
g1(2,5)=(-(y(9)*getPowerDeriv(y(5),(-params(1)),1)));
g1(2,8)=params(5)*getPowerDeriv(y(8),params(6),1);
g1(2,9)=(-T(1));
g1(3,10)=(-params(2));
g1(4,3)=(-params(2));
g1(5,2)=(-(params(14)*params(10)*exp(params(10)*(y(2)-params(12)))));
g1(5,3)=1;
g1(6,1)=(-(T(2)*T(3)));
g1(6,4)=1;
g1(6,8)=(-(y(1)*T(2)*getPowerDeriv(y(8),1-params(4),1)));
g1(6,12)=(-(T(3)*y(1)*getPowerDeriv(y(12),params(4),1)));
g1(7,4)=(-(params(4)*1/y(12)));
g1(7,10)=1;
g1(7,12)=(-(params(4)*(-y(4))/(y(12)*y(12))));
g1(8,4)=(-((1-params(4))/y(8)));
g1(8,8)=(-((-(y(4)*(1-params(4))))/(y(8)*y(8))));
g1(8,9)=1;
g1(9,2)=1-(1+y(3));
g1(9,3)=(-y(2));
g1(9,4)=(-1);
g1(9,5)=1;
g1(9,6)=1;
g1(9,11)=(-1);
g1(10,1)=1-params(7);
g1(11,11)=1-params(9);
g1(12,4)=(-1);
g1(12,5)=1;
g1(12,6)=1;
g1(12,7)=1;

end
