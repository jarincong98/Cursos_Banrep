function [SS0, L, K, Y, I, C, Ass, alpha] = Steady_StateCalibRBC(x)

global sigma beta delta alpha psi_l eta rho Ass 

L = x(1);
K = x(2);
Ass = x(3);
alpha = x(4);

Y = Ass*K^alpha*L^(1-alpha);
I = delta*K;
C = Y - I;

SS0(1) = psi_l*L^eta - C^(-sigma)*(1-alpha)*Y/L;
SS0(2) = alpha*Y/K - (1/beta-(1-delta));

%Targets
SS0(3) = Y - 1;
SS0(4) = I/Y - 0.2;

end