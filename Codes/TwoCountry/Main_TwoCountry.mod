%%%  Two Country Model

@#define Country = ["1", "2"]

%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var 
    @#for co in Country
        P_C_@{co} lambda_@{co} C_@{co} W_@{co} h_@{co} R_K_@{co} I_@{co} 
        K_@{co} q_c_@{co} mu_@{co} MC_@{co} Pi_@{co} TR_@{co} A_@{co}

        @#for co2 in Country
        q_@{co}@{co2} P_@{co}@{co2}
        
        @#endfor
        
    @#endfor
 
;

varexo 

@#for co in Country
    eps_A_@{co}
@#endfor

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters sigma eta beta theta

  @#for co in Country
    psi_h_@{co} delta_@{co} omega_@{co} tau_@{co} alpha_@{co} 
    xi_@{co} phi_K_@{co} A_ss_@{co} rho_A_@{co}
  @#endfor                  
     
;


%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------

load paramsAgg.mat;
load paramsCO.mat;

load SSVarCO.mat;
load SSVarq.mat;
load SSVarP.mat;

sigma = paramsAgg(1,1);
eta   = paramsAgg(2,1);
beta  = paramsAgg(3,1);
theta = paramsAgg(4,1);

 @#for co in Country
    psi_h_@{co} = paramsCO(1,@{co});
    delta_@{co} = paramsCO(2,@{co});
    omega_@{co} = paramsCO(3,@{co});
    tau_@{co} = paramsCO(4,@{co});
    alpha_@{co} = paramsCO(5,@{co});
    xi_@{co} = paramsCO(6,@{co});
    phi_K_@{co} = paramsCO(7,@{co});
    A_ss_@{co} = paramsCO(8,@{co});
    rho_A_@{co} = paramsCO(9,@{co});
  @#endfor   


%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='P_c']
P_C_2 = 1;

 @#for co in Country
[name='lambda']     
lambda_@{co} = C_@{co}^(-sigma)/P_C_@{co};

[name='labor supply']     
W_@{co} = psi_h_@{co}*h_@{co}^eta/lambda_@{co};

[name='Eurler K']     
%R_K_@{co} = 1/beta - (1-delta_@{co});
lambda_@{co}*(1-phi_K_@{co}*(K_@{co}-K_@{co}(-1))) = 
    beta*lambda_@{co}(+1)*(1-delta_@{co}+phi_K_@{co}*(K_@{co}(+1)-K_@{co})+R_K_@{co}(+1));

[name='Investment']     
%I_@{co} = delta_@{co}*K_@{co};
K_@{co} = I_@{co} +(1-delta_@{co})*K_@{co}(-1) - phi_K_@{co}/2*(K_@{co}-K_@{co}(-1))^2;

[name='MC']
MC_@{co} = 1/A_@{co}*(R_K_@{co}/alpha_@{co})^alpha_@{co}*(W_@{co}/(1-alpha_@{co}))^(1-alpha_@{co});

[name='MU']
mu_@{co} = MC_@{co};

[name='Profits']
Pi_@{co} = MC_@{co}*q_c_@{co}/(theta-1);

[name='P dom']
P_@{co}@{co} = theta/(theta-1)*MC_@{co};
[name='q dom']
q_@{co}@{co} = (P_C_@{co}/P_@{co}@{co})^theta*omega_@{co}*(C_@{co}+I_@{co});

[name='TFP']
A_@{co} = A_@{co}(-1)^rho_A_@{co}*A_ss_@{co}^(1-rho_A_@{co})*(1+eps_A_@{co});

[name='Labor demand']
W_@{co} = mu_@{co}*(1-alpha_@{co})*q_c_@{co}/h_@{co}; 

[name='Capital demand']
R_K_@{co} = mu_@{co}*(alpha_@{co})*q_c_@{co}/K_@{co}(-1);

    % @#for co2 in Country
    %     @#if co2 != co
    % P_@{co}@{co2} = theta/(theta-1)*xi_@{co2}*MC_@{co2};
    % q_@{co}@{co2} = (P_C_@{co}/((1+tau_@{co})*P_@{co}@{co2}))^theta*(1-omega_@{co})*(C_@{co}+I_@{co});
    %         @#endif
    %     @#endfor
 @#endfor

P_12 = theta/(theta-1)*xi_2*MC_2; %Price of Foreign goods at home
P_21 = theta/(theta-1)*xi_1*MC_1; %Price of Home goods at foreign
q_12 = (P_C_1/((1+tau_1)*P_12))^theta*(1-omega_1)*(C_1+I_1);
q_21 = (P_C_2/((1+tau_2)*P_21))^theta*(1-omega_2)*(C_2+I_2);

[name='Tariff Revenue 1']
TR_1 = tau_1*P_12*q_12;
[name='Tariff Revenue 2']
TR_2 = tau_2*P_21*q_21;

[name='Market clearing 1']
q_c_1 = q_11 + xi_1*q_21; 

[name='Market clearing 2']
q_c_2 = q_22 + xi_2*q_12;

[name='P_C1']
P_C_1 = (omega_1*P_11^(1-theta)+(1-omega_1)*((1+tau_1)*P_12)^(1-theta))^(1/(1-theta));

[name='P_C2']
P_C_2 = (omega_2*P_22^(1-theta)+(1-omega_2)*((1+tau_2)*P_21)^(1-theta))^(1/(1-theta)); 

[name = 'EX=IM']
P_12*q_12 = P_21*q_21;

end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

 @#for co in Country
  P_C_@{co} = SSVarCO(1,@{co});
  lambda_@{co} = SSVarCO(2,@{co});
  C_@{co} = SSVarCO(3,@{co});
  W_@{co} = SSVarCO(4,@{co});
  h_@{co} = SSVarCO(5,@{co});
  R_K_@{co} = SSVarCO(6,@{co});
  I_@{co} = SSVarCO(7,@{co});
  K_@{co} = SSVarCO(8,@{co});
  q_c_@{co} = SSVarCO(9,@{co});
  mu_@{co} = SSVarCO(10,@{co});
  MC_@{co} = SSVarCO(11,@{co});
  Pi_@{co} = SSVarCO(12,@{co});
  TR_@{co} = SSVarCO(13,@{co});
  A_@{co} = SSVarCO(14,@{co});

    @#for co2 in Country
    q_@{co}@{co2} = SSVarq(@{co},@{co2});
    P_@{co}@{co2} = SSVarP(@{co},@{co2});
    @#endfor
 @#endfor

end;

model_diagnostics;
resid(non_zero);
check;
steady;

%----------------------------------------------------------------
%  SHocks
%---------------------------------------------------------------

shocks;

@#for co in Country
    var eps_A_@{co} = 0.01^2;
 @#endfor

end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------

stoch_simul(periods = 100000, irf=40) q_c_1 q_c_2 C_1 C_2 I_1 I_2 P_C_1;
