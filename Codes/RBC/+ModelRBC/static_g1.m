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
    T = ModelRBC.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,1)=(-(T(1)*T(2)));
g1(1,2)=1;
g1(1,6)=(-(y(1)*T(1)*getPowerDeriv(y(6),1-params(4),1)));
g1(1,8)=(-(T(2)*y(1)*getPowerDeriv(y(8),params(4),1)));
g1(2,2)=(-(params(4)*1/y(8)));
g1(2,7)=1;
g1(2,8)=(-(params(4)*(-y(2))/(y(8)*y(8))));
g1(3,4)=(-1);
g1(3,8)=1-(1-params(3));
g1(4,2)=(-((1-params(4))*1/y(6)));
g1(4,5)=1;
g1(4,6)=(-((1-params(4))*(-y(2))/(y(6)*y(6))));
g1(5,3)=T(3)*getPowerDeriv(y(3),params(1),1);
g1(5,5)=(-1);
g1(5,6)=T(4)*params(5)*getPowerDeriv(y(6),params(7),1);
g1(6,7)=(-params(2));
g1(7,1)=1-(1+x(1))*T(5)*getPowerDeriv(y(1),params(8),1);
g1(8,2)=1;
g1(8,3)=(-1);
g1(8,4)=(-1);

end
