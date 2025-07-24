%% Modelo RBC / Economía cerrada
%% Autor: Óscar Ávila - Fredy A. Castañeda - Juan A. Rincón

%----------------------------------------------------------------
% Paso 1: Definición de variables endógenas
%----------------------------------------------------------------
var 
    A       $A$     (long_name = 'Productividad') 
    Y       $Y$     (long_name = 'Producción') 
    C       $C$     (long_name = 'Consumo') 
    I       $I$     (long_name = 'Inversión')     
    W       $W$     (long_name = 'Salario') 
    L       $L$     (long_name = 'Trabajo') 
    R_K     $R^{K}$ (long_name = 'Renta del capital') 
    K       $K$     (long_name = 'Capital') 
    
    
;

%----------------------------------------------------------------
% Paso 2: Definición de variables exógenas
%----------------------------------------------------------------
varexo 
    eps_A   $\epsilon^{A}$ (long_name = 'Choque de productividad') 
;

%----------------------------------------------------------------
% Paso 3: Parámetros del modelo
%----------------------------------------------------------------
parameters  
    sigma   $\sigma$    (long_name = 'Inverse of intertemporal subs elasticity')
    bbeta   $\beta$     (long_name = 'Factor de descuento')
    delta   $\delta$    (long_name = 'Depreciación del capital') 
    aalpha  $\alpha$    (long_name = 'Part. del capital en la producción') 
    psi_l   $\phi^{L}$  (long_name = 'psi L') 
    pphi_K  $\phi^{K}$  (long_name = 'Costo de ajuste del capital') 
    eta     $\eta$      (long_name = 'Elasticidad de Frish') 
    rho     $\rho_{A}$  (long_name = 'Persistencia de la productividad') 
    Ass     $A$         (long_name = 'Estado estacionario de la productividad') 
;

%----------------------------------------------------------------
% Asignación de valores a los parámetros
%----------------------------------------------------------------
    sigma  = 2;
    bbeta  = 0.98;
    delta  = 0.05;
    aalpha = 0.3;
    psi_l  = 1;
    pphi_K = 0;
    eta    = 1.5;
    rho    = 0.75; % ParamsInDynare;% 
    Ass    = 1;

%----------------------------------------------------------------
% Paso 4. Bloque del modelo
%----------------------------------------------------------------
model;
[name = 'Función de producción']
    Y = A*K(-1)^aalpha*L^(1-aalpha);

[name = 'Demanda de capital']
    R_K = aalpha*(Y/K(-1));

[name = 'Ley de acumulación de capital']
    K = (1-delta)*K(-1) + I + (pphi_K/2)*(K - K(-1))^2;

[name = 'Demanda de trabajo']
    W = (1-aalpha)*(Y/L);

[name = 'Oferta de trabajo']
    psi_l*L^eta*C^sigma = W;

[name = 'Ecuación de Euler']
    (C(+1)/C)^(sigma) = bbeta*(R_K + (1 - delta) + pphi_K*(K - K(-1)));

[name = 'Productividad']
    A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);

[name = 'Demanda agregada']
     Y = C + I;
end;
%----------------------------------------------------------------
% Paso 5. Opciones de Dynare
%----------------------------------------------------------------
    resid;              % Cálculo de residuales
    check;              % Chequeo de condiciones de Blanchar y Kahn
    steady;             % Cálculo del estado estacionario
    model_diagnostics;  % Diagnóstico del modelo
%----------------------------------------------------------------
% Paso 6. Productos de Dynare
%----------------------------------------------------------------
shocks;
    var eps_A = 0.01;
end;

% Simulación estocástica
    % stoch_simul(order=1,irf=40) ;

    % Descomentar para el ejercicio 2
    stoch_simul(order=1,irf=40, relative_irf, nograph, noprint) ; 
   

% Escritura del modelo en LaTeX
    write_latex_parameter_table;
    write_latex_definitions;
    write_latex_original_model(write_equation_tags);
    collect_latex_files;