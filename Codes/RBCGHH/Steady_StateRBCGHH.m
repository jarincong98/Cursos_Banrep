function [SS0, L, K, Y, I, C, lambda] = Steady_StateRBCGHH(x)

global sigma beta delta alpha psi_l eta rho Ass 

L = x(1);
K = x(2);

%L = K*(1/(Ass*alpha)*((1/beta-(1-delta))))^(1/(1-alpha));
Y = Ass*K^alpha*L^(1-alpha);
I = delta*K;
C = Y - I;
lambda = (C-psi_l*L^(1+eta)/(1+eta))^(-sigma);

SS0(1) = psi_l*L^eta - (1-alpha)*Y/L;
SS0(2) = alpha*Y/K - (1/beta-(1-delta));


end