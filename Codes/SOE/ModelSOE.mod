%% Modelo RBC / Economía abierta
%% Autor: Óscar Ávila - Fredy A. Castañeda - Juan A. Rincón

% Variables endógenas
var 
    A           $A$             (long_name = 'Productividad')
    Y           $Y$             (long_name = 'Producción')
    Y_rel       $Y^{Rel}$       (long_name = 'Producción Rel. al SS') 
    C           $C$             (long_name = 'Consumo')
    I           $I$             (long_name = 'Inversión')
    NX          $NX$            (long_name = 'Balanza comercial')
    B_star      $B^{\star}$     (long_name = 'Deuda')
    R_star      $i^{\star}$     (long_name = 'Tasa de interés externa')
    T           $\tau$          (long_name = 'Transferencias')
    L           $L$             (long_name = 'Trabajo')
    W           $W$             (long_name = 'Salario')
    R_K         $R^{K}$         (long_name = 'Renta del capital')
    K           $K$             (long_name = 'Capital')
    
;

% Variables exógenas
varexo 
    eps_A       $\epsilon^{A}$  (long_name = 'Choque de productividad')
    eps_T       $\epsilon^{T}$  (long_name = 'Choque de T')
;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  
    ssigma      $\sigma$        (long_name = 'sigma')
    bbeta       $\beta$         (long_name = 'Factor de descuento')
    ddelta      $\delta$        (long_name = 'Depreciación del capital')
    aalpha      $\alpha$        (long_name = 'Parcipación del capital prod.')
    psi_l       $\psi^L$        (long_name = 'psi')
    eta         $\eta$          (long_name = 'eta')
    rho_a       $\rho_{A}$      (long_name = 'Persistencia de la productividad')
    phi_k       $\phi^{K}$      (long_name = 'Costo de ajuste del capital')
    rho_tau     $\rho_{\tau}$   (long_name = 'Persistencia de T')
    phi_b       $\phi_{B}$      (long_name = 'Elasticidad de la deuda a la tasa')
    A_ss        $A$             (long_name = 'Productividad de est. estacionario')
    B_ss        $B$             (long_name = 'Deuda de est. estacionario')
    T_ss        $T$             (long_name = 'T SS')
    R_star_ss   $i^{\star}$     (long_name = 'Tasa de interés de est. estacionario')
;


%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------
%% Practica de SS (Cambiar Y=1, 
ssigma  = 2;
bbeta   = 0.98;
ddelta  = 0.1;
aalpha  = 0.3;
psi_l   = 1;
eta     = 5;
phi_k   = 0.1;

A_ss    = 1;
B_ss    = -0.25; 
T_ss    = 0; 
R_star_ss = 1/bbeta - 1;


rho_a   = ParamsInDynare;% 0.75;
rho_tau = 0.75;
phi_b   = -0.05;

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;
[name = 'Ley acumu. del capital']
    I = K-(1-ddelta)*K(-1) + phi_k/2*(K-K(-1))^2;

[name = 'Oferta de trabajo']
    psi_l*L^eta = C^(-ssigma)*W;

[name = 'Ecuación de Euler']
    (C(+1)/C)^(ssigma)*(1+phi_k*(K-K(-1))) = bbeta*(1-ddelta + R_K(+1) - phi_k*(K(+1)-K));

[name = 'Demanda de bonos']
    (C(+1)/C)^(ssigma) = bbeta*(1+R_star(+1));

[name = 'Tasa de interés deuda']
    R_star = R_star_ss*exp(phi_b*(B_star-B_ss));

[name = 'Función de producción']
    Y = A*K(-1)^aalpha*L^(1-aalpha);

[name = 'Demanda de capital']
    R_K = aalpha*(Y/K(-1));

[name = 'Demanda de trabajo']
    W = (1-aalpha)*Y/L;

[name = 'Demanda agregada']
    C + I + B_star = Y + (1+R_star)*B_star(-1)+T;

[name = 'Productividad']
    A = A(-1)*rho_a+A_ss*(1-rho_a)+eps_A;

[name = 'Transferencias']
    T = T(-1)*rho_tau+T_ss*(1-rho_tau)+eps_T;

[name = 'Exportaciones netas']
    NX = Y - C - I ;

[name = 'Producción relativa al SS']
    Y_rel = Y/steady_state(Y);

end;

model_diagnostics;
resid;
check;
steady;


shocks;
    var eps_A; stderr 1;
end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------
% Simulación estocástica
    % stoch_simul(order=1,irf=40) ;

% Descomentar para el ejercicio 2 y 3
    stoch_simul(order=1,irf=20, nograph, noprint) ; 
   

% Escritura del modelo en LaTeX
    write_latex_parameter_table;
    write_latex_definitions;
    write_latex_original_model(write_equation_tags);
    collect_latex_files;