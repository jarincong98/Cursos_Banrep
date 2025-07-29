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
g1(1,4)=1;
g1(1,12)=(-(1-(1-params(3))));
g1(2,6)=(-(y(8)*getPowerDeriv(y(6),(-params(1)),1)));
g1(2,7)=params(5)*getPowerDeriv(y(7),params(6),1);
g1(2,8)=(-T(1));
g1(3,9)=(-params(2));
g1(4,3)=(-params(2));
g1(5,2)=(-(params(15)*params(10)*exp(params(10)*(y(2)-params(13)))));
g1(5,3)=1;
g1(6,1)=(-(T(2)*T(3)));
g1(6,5)=1;
g1(6,7)=(-(y(1)*T(2)*getPowerDeriv(y(7),1-params(4),1)));
g1(6,12)=(-(T(3)*y(1)*getPowerDeriv(y(12),params(4),1)));
g1(7,5)=(-(params(4)*1/y(12)));
g1(7,9)=1;
g1(7,12)=(-(params(4)*(-y(5))/(y(12)*y(12))));
g1(8,5)=(-((1-params(4))/y(7)));
g1(8,7)=(-((-(y(5)*(1-params(4))))/(y(7)*y(7))));
g1(8,8)=1;
g1(9,2)=1-(1+y(3));
g1(9,3)=(-y(2));
g1(9,4)=1;
g1(9,5)=(-1);
g1(9,6)=1;
g1(9,10)=(-1);
g1(10,1)=1-params(7);
g1(11,10)=1-params(9);
g1(12,4)=1;
g1(12,5)=(-1);
g1(12,6)=1;
g1(12,11)=1;

end
