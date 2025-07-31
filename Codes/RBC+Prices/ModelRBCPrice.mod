%% Modelo RBC+Precios Rígidos / Economía cerrada
%% Autor: Óscar Ávila - Fredy A. Castañeda - Juan A. Rincón
%----------------------------------------------------------------
% Paso 1: Definición de variables endógenas
%----------------------------------------------------------------

var 
    K       $K$         (long_name = 'Capital')
    C       $C$         (long_name = 'Consumo')
    L       $L$         (long_name = 'Trabajo')
    P       $P$         (long_name = 'IPC')
    I       $I$         (long_name = 'Inversión')
    lambda  $\lambda$   (long_name = 'Multiplicador Lagrange')
    W       $W$         (long_name = 'Salario Nominal')
    R_K     $R^K$       (long_name = 'Renta Capital')
    MC      $MC$        (long_name = 'Costo Marginal Nominal')
    Upsilon $\upsilon$  (long_name = 'Costo de Ajuste Rotemberg')
    q       $q$         (long_name = 'Producto Doméstico')
    mu      $\mu$       (long_name = 'Multiplicador Costo Marginal')
    Pi_q    $\Pi^q$     (long_name = 'Beneficios Domésticos')
    A       $A$         (long_name = 'Proceso PTF')
    pi      $\pi$       (long_name = 'Inflación')
    Z_D     $Z^D$       (long_name = 'Proceso de Demanda')
;


%----------------------------------------------------------------
% Paso 2: Definición de variables exógenas
%----------------------------------------------------------------
varexo
    eps_A   $\epsilon^A$    (long_name = 'Choque de PTF')
    eps_D   $\epsilon^D$    (long_name = 'Choque de Demanda')
;

%----------------------------------------------------------------
% Paso 3: Parámetros del modelo
%----------------------------------------------------------------

parameters
    sigma   $\sigma$        (long_name = 'Inv. ESI')
    beta    $\beta$         (long_name = 'Factor de Descuento')
    delta   $\delta$        (long_name = 'Depreciación Capital') 
    alpha   $\alpha$        (long_name = 'Elasticidad Capital en Producto') 
    psi_l   $\psi_l$        (long_name = 'Desutilidad Marginal Trabajo')
    eta     $\eta$          (long_name = 'Inv. Elasticidad Frisch')
    rho     $\rho$          (long_name = 'Persistencia PTF') 
    Ass     $A_{ss}$        (long_name = 'Estado Estacionario PTF') 
    phi_q   $\phi_q$        (long_name = 'Rotemberg') 
    theta   $\theta$        (long_name = 'Elasticidad Sustitución Variedades') 
    phi_k   $\phi_k$        (long_name = 'Costo Marginal Ajuste Capital') 
    rho_D   $\rho_D$        (long_name = 'Peristencia Demanda')   
;


%----------------------------------------------------------------
% Asignación de valores a los parámetros
%----------------------------------------------------------------

load params.mat;
load SSvar.mat;

sigma = params(1);
beta = params(2);
delta = params(3);
alpha = params(4);
psi_l = params(5);
eta = params(6);
rho = params(7);
Ass = params(8);
phi_q = params(9);
theta = params(10);
phi_k = params(11);
rho_D = 0.75;

%----------------------------------------------------------------
% Paso 4. Bloque del modelo
%----------------------------------------------------------------
model;

[name='BC']
%P*(C + I) = W*L + R_K*K(-1) + Pi_q;
W = 1;

[name='Investment']
I = K - (1-delta)*K(-1) + phi_k/2*(K-K(-1))^2;

[name='Lambda']
P*lambda/Z_D = C^(-sigma);

[name='Labor Supply']
W = psi_l*L^eta/lambda;

[name='Euler Equation K']
P*lambda/Z_D*(1+phi_k*(K-K(-1))) = beta*P(+1)*lambda(+1)/Z_D(+1)*((1-delta)+R_K(+1)+phi_k*(K(+1)-K));

[name='MC']
MC = 1/A*(R_K/alpha)^alpha*(W/(1-alpha))^(1-alpha);

[name='Price adjustment cost']
Upsilon = phi_q/2*(P/P(-1)-1)^2;

[name='Market clearing for final goods']
q = C + I + Upsilon;

[name='mu']
mu = MC;

[name='Profits']
Pi_q = P*q - W*L - R_K*K - Upsilon;

[name='Optimal prices: Phillips Curve']
MC*theta/P = (theta-1) + phi_q*(P/P(-1)-1)*P/P(-1) - phi_q*beta*(C(+1)/C)^(-sigma)*(P(+1)/P-1)*(P(+1)/P)^2*q(+1)/q;

[name='Capital Demand']
R_K = mu*alpha*q/K(-1);

[name='Labor Demand']
W   = mu*(1-alpha)*q/L;

[name='TFP shock']
A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);

[name='inflation']
pi =  P/P(-1) - 1;

[name='Demand shock']
Z_D = Z_D(-1)^rho_D*(1+eps_D);

end;

%----------------------------------------------------------------
%  Paso 5. Valores Iniciales
%---------------------------------------------------------------

initval;

K = SSvar(1);
C = SSvar(2);
L = SSvar(3);
P = SSvar(4);
I = SSvar(5);
lambda = SSvar(6);
W = SSvar(7);
R_K = SSvar(8);
MC = SSvar(9);
Upsilon = SSvar(10);
q = SSvar(11);
mu = SSvar(12);
Pi_q = SSvar(13);
A = SSvar(14);
Z_D = 1;

end;

%----------------------------------------------------------------
% Paso 6. Opciones de Dynare
%----------------------------------------------------------------
model_diagnostics;
resid(non_zero);
check;
steady;

%----------------------------------------------------------------
% Paso 6. Productos de Dynare
%----------------------------------------------------------------

% Desviaciones estándar de choques
shocks;
var eps_A = 0.01;
var eps_D = 0.10;
end;

% Simulación Estocástica
stoch_simul(periods = 1000, irf=40) A q C I K L MC P pi;

% Escritura del modelo en LaTeX
    write_latex_parameter_table;
    write_latex_definitions;
    write_latex_original_model(write_equation_tags);
    collect_latex_files;