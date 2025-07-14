%%%  RBC Code with Pop Growth + Technological Progress
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var l k y i c A w r_k lambda D_Y D_C D_I
;

varexo eps_A 

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  sigma beta delta alpha psi_l eta rho Ass n_bar l_bar gz 
                    
      
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
n_bar = params(9);
l_bar = params(10);
gz = params(11);

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='Labor supply']
l = l_bar;

[name='y']
y = A*(k(-1)/((1+n_bar)*(1+gz)))^alpha*l^(1-alpha);

[name='Investment']
k = (1-delta)*k(-1)/(1+n_bar)/(1+gz)+i;

[name='BC']
c + i = w*l + r_k*k/(1+n_bar)/(1+gz);
%c + i = y;

[name='wage']
w = (1-alpha)*y/l;

[name='r_k']
r_k/(1+n_bar)/(1+gz) = alpha*y/k(-1);

[name='lambda']
lambda = c^(-sigma);

[name='Euler Equation']
lambda = beta*(1+gz)^(-sigma)*lambda(+1)*(1-delta+r_k(+1));

[name='TFP']
A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);

%%%% Growth: Variables in levels
[name='GDP growth']
D_Y = y/y(-1)-1 + n_bar + gz;
[name='C growth']
D_C = c/c(-1)-1 + n_bar + gz;
[name='I growth']
D_I = i/i(-1)-1 + n_bar + gz;
end;

%----------------------------------------------------------------
%  Initial values
%---------------------------------------------------------------

initval;

l = SSvar(1);
k = SSvar(2);
% k = 8.0;
% l = 1.0;
A = 2.0;
y = A*(k/((1+n_bar)*(1+gz)))^alpha*l^(1-alpha);
i = k - (1-delta)*k/(1+n_bar)/(1+gz);
c = y - i;

w = (1-alpha)*y/l;
r_k = alpha*y/k*(1+n_bar)*(1+gz);

lambda = c^(-sigma);



D_Y = n_bar+gz;
D_C = n_bar+gz;
D_I = n_bar+gz;

end;
model_diagnostics;
resid(non_zero);
check;
%steady;

% %----------------------------------------------------------------
% %  Final Values
% %---------------------------------------------------------------

endval;

l = SSvar(1);
k = SSvar(2);
y = SSvar(3);
i = SSvar(4);
c = SSvar(5);
A = SSvar(6);
w = SSvar(7);
r_k = SSvar(8);
lambda = SSvar(9);

D_Y = n_bar+gz;
D_C = n_bar+gz;
D_I = n_bar+gz;

end;
model_diagnostics;
resid(non_zero);
check;
steady;



% shocks;
% var eps_A = 0.01;
% end;

% %----------------------------------------------------------------
% %  Simul-IRF
% %---------------------------------------------------------------
%stoch_simul(periods = 1000, irf=40) y c i l k D_Y D_C D_I;

perfect_foresight_setup(periods=500);
perfect_foresight_solver;