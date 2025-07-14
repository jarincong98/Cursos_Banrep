%%%  RBC Code with Pop Growth
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var l k y i c A w r_k lambda D_Y D_C D_I n
;

varexo eps_A eps_n

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  sigma beta delta alpha psi_l eta rho Ass n_bar 
                    
      
;


%----------------------------------------------------------------
% set parameter values 
%----------------------------------------------------------------

load params.mat;
load SSvar.mat;
load SSvar1.mat;


sigma = params(1);
beta = params(2);
delta = params(3);
alpha = params(4);
psi_l = params(5);
eta = params(6);
rho = params(7);
Ass = params(8);
n_bar = params(9);

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='n']
n = n_bar + eps_n;

[name='y']
y = A*(k(-1)/(1+n))^alpha*l^(1-alpha);

[name='Investment']
k = (1-delta)*k(-1)/(1+n)+i;

[name='BC']
c + i = w*l + r_k*k/(1+n);
%c + i = y;

[name='wage']
w = (1-alpha)*y/l;

[name='r_k']
r_k/(1+n) = alpha*y/k(-1);

[name='MRSLC']
psi_l*l^eta = lambda*w;

[name='lambda']
lambda = c^(-sigma);

[name='Euler Equation']
lambda = beta*lambda(+1)*(1-delta+r_k(+1));

[name='TFP']
A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);


%%%% Growth: Variables in levels
[name='GDP growth']
D_Y = y/y(-1)-1 + n;
[name='C growth']
D_C = c/c(-1)-1 + n;
[name='I growth']
D_I = i/i(-1)-1 + n;
end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

l = SSvar(1);
k = SSvar(2);
y = SSvar(3);
i = SSvar(4);
c = SSvar(5);
A = SSvar(6);
w = SSvar(7);
r_k = SSvar(8);
lambda = SSvar(9);
n = SSvar(10);

D_Y = n_bar;
D_C = n_bar;
D_I = n_bar;

end;
model_diagnostics;
resid;
check;
steady;

%----------------------------------------------------------------
%  End values
%---------------------------------------------------------------

endval;

l = SSvar1(1);
k = SSvar1(2);
y = SSvar1(3);
i = SSvar1(4);
c = SSvar1(5);
A = SSvar1(6);
w = SSvar1(7);
r_k = SSvar1(8);
lambda = SSvar1(9);
n = SSvar1(10);

D_Y = n;
D_C = n;
D_I = n;

eps_n = SSvar1(10) - SSvar(10);

end;
model_diagnostics;
resid;
check;
steady;


% shocks;
% var eps_A = 0.01;
% end;

% %----------------------------------------------------------------
% %  Simul-IRF
% %---------------------------------------------------------------
% stoch_simul(periods = 1000, irf=40) y c i l k D_Y D_C D_I;

perfect_foresight_setup(periods=500);
perfect_foresight_solver;