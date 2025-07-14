%%%  RBC Code
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var L K Y I C A lambda Z_beta Z_I
;

varexo eps_A eps_beta eps_I

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  sigma beta delta alpha psi_l eta rho Ass rho_beta rho_I
                    
     
;


%----------------------------------------------------------------
% set parameter values 
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
rho_beta = 0.75;
rho_I    = 0.75;

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='lambda']
lambda = (C-psi_l*L^(1+eta)/(1+eta))^(-sigma);

[name='Y']
Y = A*K(-1)^alpha*L^(1-alpha);

[name='Investment']
K = (1-delta)*K(-1)+I;

[name='Y=C+I']
C = Y - I;

[name='MRSLC']
psi_l*L^eta = (1-alpha)*Y/L;

[name='Euler Equation']
Z_beta*lambda/Z_I = Z_beta(+1)*beta*lambda(+1)*((1-delta)/Z_I(+1)+alpha*Y(+1)/K);

[name='TFP']
A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);

[name='Discount factor shock']
Z_beta = Z_beta(-1)^(rho_beta)*(1+eps_beta);

[name='Investment Shock']
Z_I = Z_I(-1)^(rho_I)*(1+eps_I);


end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

L = SSvar(1);
K = SSvar(2);
Y = SSvar(3);
I = SSvar(4);
C = SSvar(5);
A = SSvar(6);
lambda = SSvar(7);
Z_beta = 1;
Z_I = 1;

end;
model_diagnostics;
resid;
check;
steady;

%% Shocks 
shocks;
var eps_A = 0.01;
var eps_beta = 0.01;
var eps_I = 0.01;

end;

%----------------------------------------------------------------
%  Simul-IRF
%---------------------------------------------------------------
stoch_simul(periods = 100000, irf=40) Y C I L K;