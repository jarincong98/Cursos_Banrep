%%%  SOE Code
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var K L B_star R_star I Y C A T NX
;

varexo 
    eps_A
    eps_T
;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  sigma beta delta alpha psi_l eta rho_a A_ss B_ss T_ss rho_tau phi_b
            R_star_ss Y_ss phi_k     
      
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
T_ss = Params(10);
rho_tau = Params(11);
phi_b = Params(12);
R_star_ss = Params(13);
Y_ss = Params(14);
phi_k = 0.01;

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

R_star = R_star_ss*exp(phi_b*(B_star-B_ss));

C^(-sigma) = beta*C(+1)^(-sigma)*(1+R_star(+1));

I = K-(1-delta)*K(-1) + phi_k/2*(K-K(-1))^2;

Y = A*K(-1)^alpha*L^(1-alpha);

C + I + B_star = Y + (1+R_star)*B_star(-1)+T;

psi_l*L^eta = C^(-sigma)*(1-alpha)*Y/L;

C^(-sigma)*(1+phi_k*(K-K(-1))) = beta*C(+1)^(-sigma)*(1-delta + alpha*Y(+1)/K - phi_k*(K(+1)-K));

A = A(-1)*rho_a+A_ss*(1-rho_a)+eps_A;

T = T(-1)*rho_tau+T_ss*(1-rho_tau)+eps_T;

NX = Y - C -I;

end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

K = SSvar(1);
L = SSvar(2);
B_star = SSvar(3);
R_star = SSvar(4);
I = SSvar(5);
Y = SSvar(6);
C = SSvar(7);
A = SSvar(8);
T = SSvar(9);
NX = Y - C -I;

end;
model_diagnostics;
resid;
check;
steady;

shocks;
var eps_A = 0.01;
%var eps_T = 0.01;

end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------
stoch_simul(irf=100);