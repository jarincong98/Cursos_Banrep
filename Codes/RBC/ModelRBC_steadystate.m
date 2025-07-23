function [ys,params,check] = ModelRBC_steadystate(ys,exo,M_,options_)
%% Inputs:
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%   - M_        [structure] Dynare model structure
%   - options   [structure] Dynare options structure
%% Outputs:
%   - ys        [vector] vector of steady state values for the the endogenous variables
%   - params    [vector] vector of parameter values
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impose restrictions on parameters)
%% Parameter values
% get_parameter_values;
% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
    paramname = M_.param_names{ii};
    eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
%% Initialize indicator
check = 0;

A = Ass;
P = 1;
R_K = (1/beta - 1 + delta)*P;
MC = (1/A)*(R_K/alpha)^alpha * (W/(1-alpha))^(1-alpha);
h = MC*(1-alpha)*Y/w;
C = (W/P*(1/(psi_l*H^eta)))^1/sigma;

W = MC*((1-alpha)*(Y/h));


Y = ;

I = Y - C;
L = ;
K = delta/I;



% ----------------------------------------------------------------------- %
%% Return steady state  
% ----------------------------------------------------------------------- %
% return_steady_state_values;  
params=NaN(NumberOfParameters,1);  
for iter = 1:length(M_.params) %update parameters set in the file
    eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end
NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
    varname = M_.endo_names{ii};
    eval(['ys(' int2str(ii) ') = ' varname ';']);
end 

%% END OF THE MODEL SPECIFIC BLOCK