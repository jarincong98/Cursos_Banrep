%%%  SOE + CES Different technologies for C and I
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var K C W P_d P_im q I P_c lambda h P_i R_K R_star q_d q_cd q_cim
    q_id q_iim q_ex EX IM NX B_star A P_star y_star GDP GDP_ann Z_C Z_I
;

varexo eps_A eps_Pim_star eps_y_star eps_C eps_I

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters sigma delta beta phi_h eta psi_K alpha theta_c theta_i omega_c 
    omega_i theta_ex B_star_ss y_star_ss A_ss P_star_ss rho_A rho_P_star
    rho_y_star R_star_ss phi_b rho_C rho_I
                    
     
;


%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------

load params.mat;
load SSvar.mat;

sigma = params(1);
delta = params(2);
beta = params(3);
phi_h = params(4);
eta = params(5);
psi_K = params(6);
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
rho_A  = params(17);
rho_P_star = params(18);
rho_y_star = params(19);
R_star_ss = params(20);
phi_b = params(21);

rho_C = params(22); 
rho_I = params(23);

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='RER']
q = P_im/P_star;

%%%% Household's Optimization
[name='Capital Law of Motion']
I = K-(1-delta)*K(-1)+psi_K/2*(K-K(-1))^2;

[name='lambda']
lambda = C^(-sigma)/P_c;

[name='Labor supply']
h = (lambda*W/phi_h)^(1/eta);

[name='Euler Equation for K']
%R_K = P_i*(1/beta - (1-delta));
lambda*P_i*(1+psi_K*(K-K(-1))) = lambda(+1)*beta*P_i(+1)*(1-delta+psi_K*(K(+1)-K)+R_K(+1)/P_i(+1));

[name='Euler Equation for B_star']
%R_star = 1/beta;
lambda*q*P_star = lambda(+1)*beta*q(+1)*P_star(+1)*(1+R_star);

[name='R_star']
R_star = R_star_ss + exp(phi_b*(q*P_star*B_star/GDP_ann-B_star_ss))-1;

%%%%%% Production of domestic intermediates
[name='Production of dom interm.']
q_d = A*K(-1)^alpha*h^(1-alpha);

[name='Capital Demand']
alpha*q_d/K(-1) = R_K/P_d;

[name='Labor Demand']
(1-alpha)*q_d/h = W/P_d;

[name='Supply = Demand']
q_d = q_cd + q_id + q_ex;

[name='GDP']
GDP = P_d*q_d;

[name='GDP']
%GDP_ann = GDP+GDP(-1)+GDP(-2)+GDP(-3);
GDP_ann = 4*GDP;

%%%%%% Production of Consumption goods
[name='Demand for dom interm in C']
q_cd = Z_C^(theta_c-1)*omega_c*(P_c/P_d)^theta_c*C;

[name='Demand for imports in C']
q_cim = Z_C^(theta_c-1)*(1-omega_c)*(P_c/P_im)^theta_c*C;

[name='P_c: Normalization']
P_c = 1.0;

[name='P_c']
(Z_C*P_c)^(1-theta_c) = (omega_c*P_d^(1-theta_c)+(1-omega_c)*P_im^(1-theta_c));

%%%%%% Production of Investment goods
[name='Demand for dom interm in I']
q_id = Z_I^(theta_i-1)*omega_i*(P_i/P_d)^theta_i*I;

[name='Demand for imports in I']
q_iim = Z_I^(theta_i-1)*(1-omega_i)*(P_i/P_im)^theta_i*I;

[name='P_i']
P_i = 1/Z_I*(omega_i*P_d^(1-theta_i)+(1-omega_i)*P_im^(1-theta_i))^(1/(1-theta_i));

%%%% Trade Balance
[name='Export demand']
q_ex = (q*P_star/P_d)^theta_ex*y_star;

[name='Exports']
EX = P_d*q_ex;

[name='Imports']
IM = P_im*(q_cim+q_iim);

[name='Net Exports']
NX = EX - IM;

[name='Net Exports Eq']
%NX + R_star*q*P_star_ss*B_star;
q*P_star*B_star = NX + (1+R_star(-1))*q*P_star*B_star(-1);

%%%% Shocks
A = A(-1)^rho_A*A_ss^(1-rho_A)*(1+eps_A);
P_star = P_star(-1)^rho_P_star*P_star_ss^(1-rho_P_star)*(1+eps_P_star);
y_star = y_star(-1)^rho_y_star*y_star_ss^(1-rho_y_star)*(1+eps_y_star);

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
q = SSvar(6);
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
A = SSvar(24);
P_star = SSvar(25);
y_star = SSvar(26);
GDP = SSvar(27);
GDP_ann = SSvar(28);
Z_C = 1;
Z_I = 1;

end;
model_diagnostics;
resid(non_zero);
check;
steady;

%% Shocks 
shocks;

var eps_A = 0.01^2;
var eps_P_star = 0.01^2;
var eps_y_star = 0.01^2;
var eps_C = 0.01^2;
var eps_I = 0.01^2;

end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------
stoch_simul(periods = 100000, irf=40) GDP C I EX IM NX P_i;
%q_cd q_cim q_id q_iim