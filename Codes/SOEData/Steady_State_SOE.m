function [SS0, K, L, C, Y, R_K, W, lambda, I, R_star, B_star, NX] = Steady_State_SOE(x)

global sigma beta delta alpha psi_l eta rho_a A_ss B_ss phi_b

K = x(1);
L = x(2);
C = x(3);

Y = A_ss*K^alpha*L^(1-alpha);
R_K = alpha*Y/K;
W = (1-alpha)*Y/L;
lambda = C^(-sigma);
I = delta*K;
R_star = 1/beta-1;
B_star = B_ss;
NX = Y - C - I;

SS0(1) = L - (lambda*W/psi_l)^(1/eta);
SS0(2) = R_K - (1/beta-(1-delta));
SS0(3) = NX + R_star*B_star;

end