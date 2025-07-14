function [SS0, K, L, B_star, R_star, I, Y, C] = Steady_State_SOEGHH(x)

global sigma beta delta alpha psi_l eta rho_a A_ss B_ss T_ss

K = x(1);
L = x(2);

B_star = B_ss;
R_star = 1/beta-1;
I = delta*K;
Y = A_ss*K^alpha*L^(1-alpha);
C = Y - I + R_star*B_star+T_ss;

SS0(1) = psi_l*L^eta - (1-alpha)*Y/L;
SS0(2) = 1/beta - (1-delta) - alpha*Y/K;

end