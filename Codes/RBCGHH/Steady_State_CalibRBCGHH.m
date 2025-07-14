function [SS0, L, K, Y, I, C, lambda] = Steady_State_CalibRBCGHH(x)

global sigma beta delta alpha psi_l eta rho Ass 

L = x(1);
K = x(2);

Ass = x(3);
alpha = x(4);
psi_l = x(5);

Y = Ass*K^alpha*L^(1-alpha);
I = delta*K;
C = Y - I;
lambda = (C-psi_l*L^(1+eta)/(1+eta))^(-sigma);

SS0(1) = psi_l*L^eta - (1-alpha)*Y/L;
SS0(2) = alpha*Y/K - (1/beta-(1-delta));

%%Targets
SS0(3) = Y - 1;
SS0(4) = I/Y - 0.2;
SS0(5) = L - 1/3;

end