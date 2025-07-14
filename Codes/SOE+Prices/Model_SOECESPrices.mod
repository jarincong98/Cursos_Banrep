%%%  SOE + CES Different technologies for C and I
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var 
    K           $K$         (long_name = 'Aggregate Capital')
    C           $C$         (long_name = 'Aggregate Consumption')
    W           $W$         (long_name = 'Nominal Wage')
    P_d         $P^d$       (long_name = 'Domestic CPI')
    P_im        $P^{im}$    (long_name = 'Imported CPI')
    s           $s$         (long_name = 'Nominal Exchange Rate')
    I           $I$         (long_name = 'Aggregate Investment')
    P_c         $P^c$       (long_name = 'Consumption Price')
    lambda      $\lambda$   (long_name = 'Lagrange Multiplier HH')
    h           $h$         (long_name = 'Aggregate Labor')
    P_i         $P^i$       (long_name = 'Investment Price')
    R_K         $R^k$       (long_name = 'Return on Capital')
    R_star      $R^{\star}$ (long_name = 'Relevant Foreign Interest Rate')
    q_d         $q^d$       (long_name = 'Relative demand price')
    q_cd        $q^{c,d}$   (long_name = 'Relative domestic consumption price')
    q_cim       $q^{c,im}$  (long_name = 'Relative imported consumption price')
    q_id        $q^{i,d}$   (long_name = 'Relative domestic investment price')
    q_iim       $q^{i,im}$  (long_name = 'Relative imported investment price')
    q_ex        $q^{ex}$    (long_name = 'Relative price of exports')
    EX          $EX$        (long_name = 'Aggregate Real Exports')
    IM          $IM$        (long_name = 'Aggregate Real Imports')
    NX          $NX$        (long_name = 'Real Net Exports')
    B_star      $B^{\star}$ (long_name = 'Foreign Debt (bonds)')
    GDP         $GDP$       (long_name = 'GDP')
    GDP_ann     $GDP^{Ann}$ (long_name = 'Annual GDP')
    TO          $TO$        (long_name = 'Terms of Trade')
    q_im        $q^{im}$    (long_name = 'Relative price of imports')
    Upsilon_d   $\Upsilon^d$    (long_name = 'Domestic Rotemberg Adjustment Cost')
    Upsilon_im  $\Upsilon^{im}$ (long_name = 'Investment Rotemberg Adjustment Cost')
    Pi_d        $\pi^d$     (long_name = 'Domestic Inflation')
    Pi_im       $\pi^{im}$  (long_name = 'Imported Inflation')
    mu          $\partial u$ (long_name = 'Marginal Utility')
    MC          $MC$        (long_name = 'Nominal Marginal Cost')
    rer         $rer$       (long_name = 'Real Exchange Rate')
    WL          $WL$        (long_name = 'Aggregate Wage')
    P_star      $P^{\star}$ (long_name = 'Foreign CPI')
    A           $A$         (long_name = 'TFP')
    Pim_star    $P^{im,\star}$ (long_name = 'Imports Price in Forein Currency')
    Z_C         $Z^c$       (long_name = 'Consumption Combination Efficiency')
    Z_I         $Z^i$       (long_name = 'Investment Combination Efficiency')
    y_star      $y^{\star}$ (long_name = 'Foreign Demand')
;

varexo eps_A eps_P_star eps_Pim_star eps_y_star eps_C eps_I

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters sigma delta beta psi_h eta phi_K alpha theta_c theta_i omega_c omega_i theta_ex B_star_ss 
    y_star_ss A_ss P_star_ss rho_C rho_I phi_q phi_im theta_im Pim_star_ss theta_d Z_C_ss Z_I_ss 
    rho_A rho_Pim_star rho_y_star phi_b rho_P_star R_star_ss
                    
     
;


%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------

load params.mat;
load SSvar.mat;

sigma = params(1);
delta = params(2);
beta = params(3);
psi_h = params(4);
eta = params(5);
phi_K = params(6);
alpha = params(7);
theta_c = params(8);
theta_i = params(9);
omega_c = params(10);
omega_i = params(11);
theta_ex = params(12);
B_star_ss = params(13);
y_star_ss = params(14);
A_ss = params(15);
P_star_ss = params(16);
rho_C = params(17);
rho_I = params(18);
phi_q = params(19);
phi_im = params(20);
theta_im = params(21);
Pim_star_ss = params(22);
theta_d = params(23);
Z_C_ss = params(24);
Z_I_ss = params(25);
rho_A = params(26);
rho_Pim_star = params(27);
rho_y_star = params(28);
phi_b = params(29);
rho_P_star = params(30);
R_star_ss  = params(31);

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='P_c']
P_c = 1.0; %Normalization

[name='RER']
rer = s*Pim_star/P_c;
%rer = s*Pim_star/P_d;

%%%% Household's Optimization
[name='Capital Law of Motion']
I = K-(1-delta)*K(-1)+phi_K/2*(K-K(-1))^2;

[name='lambda']
lambda = C^(-sigma)/P_c;

[name='Labor supply']
h = (lambda*W/psi_h)^(1/eta);

[name='Euler Equation for K']
%R_K = P_i*(1/beta - (1-delta));
lambda*P_i*(1+phi_K*(K-K(-1))) = lambda(+1)*beta*P_i(+1)*(1-delta+phi_K*(K(+1)-K)+R_K(+1)/P_i(+1));

[name='Euler Equation for B_star']
%R_star = 1/beta-1;
lambda*s*P_star = lambda(+1)*beta*s(+1)*P_star(+1)*(1+R_star);

[name='R_star']
R_star = R_star_ss + exp(phi_b*(s*P_star*B_star/GDP_ann-B_star_ss))-1;

%%%%%% Production of domestic intermediates (heterogenous)
[name='Marginal cost']
MC = 1/A*(R_K/alpha)^alpha*(W/(1-alpha))^(1-alpha);

[name='mu']
mu = MC;

[name='MPK']
R_K = mu*alpha*q_d/K(-1);

[name='MPL']
W = mu*(1-alpha)*q_d/h;

[name = 'Optimal price']
%P_d = theta_d/(theta_d-1)*MC;
MC*theta_d/P_d = (theta_d-1) + phi_q*(P_d/P_d(-1)-1)*P_d/P_d(-1) 
     - beta*(C(+1)/C)^(-sigma)*phi_q*(P_d(+1)/P_d-1)*(P_d(+1)/P_d)^2*q_d(+1)/q_d;

[name = 'Price adjustment P_d']     
Upsilon_d = phi_q/2*(P_d/P_d(-1)-1)^2;

[name = 'Domestic profits']
Pi_d = q_d*(P_d-MC) - P_d*Upsilon_d*q_d;


%%%%%% Production of domestic intermediates (Homogeneous)
[name = 'Market clearing']
q_d = q_cd + q_id + q_ex + Upsilon_d;

[name = 'Export Demand']
q_ex = (s*P_star/P_d)^theta_ex*y_star;

[name='GDP']
GDP = q_d*P_d;

[name='GDP']
GDP_ann = 4*GDP;

%%%%%% Production of Consumption goods
[name='Demand for dom interm in C']
q_cd = omega_c*(P_c/P_d)^theta_c*C*Z_C^(theta_c-1);

[name='Demand for imports in C']
q_cim = (1-omega_c)*(P_c/P_im)^theta_c*C*Z_C^(theta_c-1);

[name='P_c']
P_c^(1-theta_c) = (1/Z_C)^(1-theta_c)*(omega_c*P_d^(1-theta_c)+(1-omega_c)*P_im^(1-theta_c));

%%%%%% Production of Investment goods

[name='Demand for dom interm in I']
q_id = omega_i*(P_i/P_d)^theta_i*I*Z_I^(theta_c-1);

[name='Demand for imports in I']
q_iim = (1-omega_i)*(P_i/P_im)^theta_i*I*Z_I^(theta_c-1);

[name='P_i']
P_i = 1/Z_I*(omega_i*P_d^(1-theta_i)+(1-omega_i)*P_im^(1-theta_i))^(1/(1-theta_i));


%%%%%% Production of imported intermediates (heterogenous)
[name = 'Optimal price P_im']
%P_im = theta_im/(theta_im-1)*s*Pim_star_ss;
s*Pim_star*theta_im/P_im = (theta_im-1) + phi_im*(P_im/P_im(-1)-1)*P_im/P_im(-1)
    - beta*(C(+1)/C)^(-sigma)*phi_im*(P_im(+1)/P_im-1)*(P_im(+1)/P_im)^2*q_im(+1)/q_im; 

[name = 'Price adjustment cost P_im']
Upsilon_im = phi_im/2*(P_im/P_im(-1)-1)^2;

[name = 'Market clearing for imports']
q_im = q_cim+q_iim+Upsilon_im;

[name = 'Profits of importers']
Pi_im = q_im*(P_im - s*Pim_star_ss) - P_im*Upsilon_im*q_im;

%%Trade Balance
[name = 'Exports']
EX = P_d*q_ex;

[name = 'Imports']
IM = P_im*q_im;

[name = 'Trade Balance']
NX = EX - IM;

[name = 'Trade Balance Equilibrium']
%NX + Pi_im + R_star*s*P_star_ss*B_star
NX + Pi_im = -(1+R_star(-1))*s*P_star*B_star(-1) + s*P_star*B_star;

[name = 'TO']
TO = (EX + IM)/GDP;

[name = 'WL']
WL = P_c*C+P_i*I+ s*P_star*B_star - W*h - R_K*K -(1+R_star(-1))*s*P_star*B_star(-1) - Pi_d - Pi_im;


%%%% Shocks
P_star = P_star(-1)^rho_P_star*P_star_ss^(1-rho_P_star)*(1+eps_P_star);
Pim_star = Pim_star(-1)^rho_Pim_star*Pim_star_ss^(1-rho_Pim_star)*(1+eps_Pim_star);
y_star = y_star(-1)^rho_y_star*y_star_ss^(1-rho_y_star)*(1+eps_y_star);

A = A(-1)^rho_A*A_ss^(1-rho_A)*(1+eps_A);
Z_C = Z_C(-1)^rho_C*(1+eps_C);
Z_I = Z_I(-1)^rho_I*(1+eps_I);


end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

K = SSvar(1);
C = SSvar(2);
W = SSvar(3);
P_d = SSvar(4);
P_im = SSvar(5);
s = SSvar(6);
I = SSvar(7);
P_c = SSvar(8);
lambda = SSvar(9);
h = SSvar(10);
P_i = SSvar(11);
R_K = SSvar(12);
R_star = SSvar(13);
q_d = SSvar(14);
q_cd = SSvar(15);
q_cim = SSvar(16);
q_id = SSvar(17);
q_iim = SSvar(18);
q_ex = SSvar(19);
EX = SSvar(20);
IM = SSvar(21);
NX = SSvar(22);
B_star = SSvar(23);
GDP = SSvar(24);
GDP_ann = SSvar(25);
TO = SSvar(26);
q_im = SSvar(27);
Upsilon_d = SSvar(28);
Upsilon_im = SSvar(29);
Pi_d = SSvar(30);
Pi_im = SSvar(31);
mu = SSvar(32);
MC = SSvar(33);
rer = SSvar(34);
WL = SSvar(35);
P_star = SSvar(36);
A = SSvar(37);
Pim_star = SSvar(38);
Z_C = SSvar(39);
Z_I = SSvar(40);
y_star = SSvar(41);

end;
model_diagnostics;
resid(non_zero);
check;
steady;

%% Shocks 
shocks;

var eps_A = 0.01^2;
var eps_Pim_star = 0.01^2;
var eps_y_star = 0.01^2;
var eps_P_star = 0.01^2;
var eps_C = 0.01^2;
var eps_I = 0.01^2;

end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------
stoch_simul(periods = 100000, irf=40) GDP C I EX IM NX s P_c P_d;
