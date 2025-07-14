%%%  RBC Code
%% Dummy for capital adjustment costs

%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var K L C Y R_K W lambda I R_star B_star NX A
;

varexo eps_A

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters sigma beta delta alpha psi_l eta rho_a A_ss B_ss phi_b R_star_ss Y_ss
           phi_k         
      
;

%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------

load Params.mat;
load SSvar.mat;

sigma = Params(1);
beta = Params(2);
delta = Params(3);
alpha = Params(4);
psi_l = Params(5);
eta = Params(6);
rho_a = Params(7);
A_ss = Params(8);
B_ss = Params(9);
phi_b = Params(10);
R_star_ss = Params(11);
Y_ss = Params(12);
phi_k = Params(13);

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='Production Function']
Y = A*K(-1)^alpha*L^(1-alpha);

[name='Capital demand']
R_K = alpha*Y/K(-1);

[name='Labor demand']
W = (1-alpha)*Y/L;

[name='Lambda']
lambda = C^(-sigma);

[name='KLM']
I = K-(1-delta)*K(-1)+phi_k/2*(K-K(-1))^2;

[name='Euler Eq. Bonds']
lambda = lambda(+1)*beta*(1+R_star);

[name='R_star']
%R_star = R_star_ss - phi_b*(exp(B_star/Y-B_ss/Y_ss)-1);
%R_star = R_star_ss - phi_b*(exp(B_star/Y-steady_state(B_star)/steady_state(Y))-1);
R_star = R_star_ss*exp(phi_b*(B_star-B_ss));

[name='NX']
NX = Y - C - I;

[name='Labor supply']
L = (lambda*W/psi_l)^(1/eta);

[name='Euler Equation K']
lambda*(1+phi_k*(K-K(-1))) = beta*lambda(+1)*(1-delta+R_K(+1)+phi_k*(K(+1)-K));

[name='BC']
C + I + B_star = Y + (1+R_star(-1))*B_star(-1);

A = A(-1)^rho_a*A_ss^(1-rho_a)*(1+eps_A);


end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

K = SSvar(1);
L = SSvar(2);
C = SSvar(3);
Y = SSvar(4);
R_K = SSvar(5);
W = SSvar(6);
lambda = SSvar(7);
I = SSvar(8);
R_star = SSvar(9);
B_star = SSvar(10);
NX = SSvar(11);
A = SSvar(12);


end;
model_diagnostics;
resid;
check;
steady;

shocks;
var eps_A = 0.01;
end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------
stoch_simul(periods = 1000, irf=40);