%%%  RBC Code
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var L K Y I C A
;

varexo eps_A

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  sigma beta delta alpha psi_l eta rho Ass  
                    
      
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

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='Y']
Y = A*K(-1)^alpha*L^(1-alpha);

K = (1-delta)*K(-1)+I;

C = Y - I;

psi_l*L^eta = C^(-sigma)*(1-alpha)*Y/L;

C^(-sigma) = beta*C(+1)^(-sigma)*(1-delta+alpha*Y(+1)/K);

A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);


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
stoch_simul(periods = 1000, irf=40) Y C I L K;