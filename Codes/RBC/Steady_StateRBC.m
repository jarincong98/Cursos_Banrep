function [SS0, L, K, Y, I, C] = Steady_StateRBC(x)

global sigma beta delta alpha psi_l eta rho Ass 

L = x(1);
K = x(2);

Y = Ass*K^alpha*L^(1-alpha);% Función de producción
I = delta*K; % Inversión en equilibrio
C = Y - I; % Consumo en equilibrio

SS0(1) = psi_l*L^eta - C^(-sigma)*(1-alpha)*Y/L;
SS0(2) = alpha*Y/K - (1/beta-(1-delta));

end