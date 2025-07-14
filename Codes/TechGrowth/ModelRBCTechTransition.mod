%%%  RBC Code with Pop Growth + Technological Progress
%----------------------------------------------------------------
% define variables 
%----------------------------------------------------------------

var l k y i c A w r_k lambda D_Y D_C D_I n gz
;

varexo eps_A D_n D_gz

;

%----------------------------------------------------------------
% define parameters
%----------------------------------------------------------------

parameters  sigma beta delta alpha psi_l eta rho Ass n_bar l_bar gz_bar 
                    
      
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
l_bar = params(10);
gz_bar = params(11);

%----------------------------------------------------------------
% enter model equations
%----------------------------------------------------------------
model;

[name='n growth']
n = n_bar + D_n;

[name='gz growth']
gz = gz_bar + D_gz;

[name='Labor supply']
l = l_bar;

[name='y']
y = A*(k(-1)/((1+n)*(1+gz)))^alpha*l^(1-alpha);

[name='Investment']
k = (1-delta)*k(-1)/(1+n)/(1+gz)+i;

[name='BC']
c + i = w*l + r_k*k/(1+n)/(1+gz);
%c + i = y;

[name='wage']
w = (1-alpha)*y/l;

[name='r_k']
r_k/(1+n)/(1+gz) = alpha*y/k(-1);

[name='lambda']
lambda = c^(-sigma);

[name='Euler Equation']
lambda = beta*(1+n(+1))*(1+gz(+1))^(1-sigma)*lambda(+1)*((1-delta)/((1+n(+1))*(1+gz(+1)))+r_k(+1));

[name='TFP']
A = A(-1)^rho*Ass^(1-rho)*(1+eps_A);

%%%% Growth: Variables in levels
[name='GDP growth']
D_Y = y/y(-1)-1 + n + gz;
[name='C growth']
D_C = c/c(-1)-1 + n + gz;
[name='I growth']
D_I = i/i(-1)-1 + n + gz;
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
gz = SSvar(11);
D_n = 0;
D_gz = 0;

D_Y = n+gz;
D_C = n+gz;
D_I = n+gz;

end;
model_diagnostics;
resid;
check;
%steady;

% %----------------------------------------------------------------
% %  Final Values
% %---------------------------------------------------------------

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
gz = SSvar1(11);
D_n = SSvar1(10)-SSvar(10);
D_gz = SSvar1(11)-SSvar(11);

D_Y = n+gz;
D_C = n+gz;
D_I = n+gz;
end;
model_diagnostics;
resid;
check;
steady;


%%% Transition shock
%D_z_tra = linspace(0,SSvar1(11)-SSvar(11),8);
D_z_tra = [0 0 0 0 linspace(0,SSvar1(11)-SSvar(11),4)];

shocks;

var D_gz;
periods 1:8;
values (D_z_tra);

end;



perfect_foresight_setup(periods=500);
perfect_foresight_solver;