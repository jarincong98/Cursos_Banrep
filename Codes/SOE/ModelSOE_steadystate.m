function [ys,params,check] = ModelSOE_steadystate(ys,exo,M_,options_)
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

% Convergencia de procesos autoregresivos
A      = A_ss;
B_star = B_ss;
R_star = R_star_ss;

% ==
% Exportaciones netas
    % % Sabemos que...
    % %   1) NX = -(T + R_star*B_star) ;  
    % % y que ...
    % %   2) NX  = Y - C - I ;
    % % entonces ...
    % T = T_ss;
    % % B_star = - (Y - C - I + T)/R_star;
    % % B_ss = B_star  ;
    % B_star = B_ss;
    % NX = -(T + R_star*B_star) ;  

% Transferencias
    % % T   = NX - R_star*B_star;
    % % T_ss = T;
% ==

% Precios
    P   = 1;
% Renta del capital
    R_K = (1/bbeta - 1 + ddelta)*P; 
% Salarios
    W   = (P*A*(1-aalpha)^(1-aalpha)*(aalpha/R_K)^aalpha)^(1/(1-aalpha)); % Using the MC to W
% Producción 
    % Y   = NX / (1 - (ddelta*aalpha/R_K) - 1^(-eta/ssigma)*( (1/psi_l) * (W/(1-aalpha))^eta * (W/P) )^(1/ssigma) );
    Y   = ( (( (1/psi_l) * (W/(1-aalpha))^eta * (W/P)  )^(1/ssigma))/ (1-(ddelta*aalpha/R_K) ) )^(ssigma/(ssigma+eta));
% Consumo
    % C   = (1/Y)^(eta/ssigma)*( (1/psi_l) * (W/(1-aalpha))^eta * (W/P) ) ^(1/ssigma);
% Inversión
    I   = (ddelta*aalpha/R_K*Y);
% Exportaciones netas
    T  = T_ss;
    NX = -R_star*B_star + T;
% Consumo
    C  = Y - I + R_star*B_star + T;
% Trabajo
    L   = (1-aalpha)*Y/W;   
% Capital
    K   = (aalpha/R_K)*Y;
% Relativo a PIB
    Y_rel = 1;

    psi_l = C^(-ssigma)*W/(L^eta);

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