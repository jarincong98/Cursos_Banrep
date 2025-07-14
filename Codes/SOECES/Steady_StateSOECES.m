function [SS0, K, C, W, P_d, P_im, q, I, P_c, lambda, h, P_i, R_K, ...
    R_star, q_d, q_cd, q_cim, q_id, q_iim, q_ex, EX, IM, NX, B_star,...
    GDP, GDP_ann, TO] = Steady_StateSOECES(x)

global sigma delta beta phi_h eta psi_K alpha theta_c theta_i omega_c omega_i theta_ex B_star_ss ...
    y_star_ss A_ss P_star_ss

K = x(1);
C = x(2);
W = x(3);
P_d = x(4);
P_im = x(5);

q = P_im/P_star_ss;
I = delta*K;
P_c = 1.0; %Normalization
lambda = C^(-sigma)/P_c;
h = (lambda*W/phi_h)^(1/eta);
P_i = (omega_i*P_d^(1-theta_i)+(1-omega_i)*P_im^(1-theta_i))^(1/(1-theta_i));
R_K = P_i*(1/beta - (1-delta));
R_star = 1/beta-1;
q_d = A_ss*K^alpha*h^(1-alpha);
q_cd = omega_c*(P_c/P_d)^theta_c*C;
q_cim = (1-omega_c)*(P_c/P_im)^theta_c*C;
q_id = omega_i*(P_i/P_d)^theta_i*I;
q_iim = (1-omega_i)*(P_i/P_im)^theta_i*I;
q_ex = (q*P_star_ss/P_d)^theta_ex*y_star_ss;
EX = P_d*q_ex;
IM = P_im*(q_cim+q_iim);
NX = EX - IM;
GDP = q_d*P_d;
GDP_ann = 4*GDP;
%q*P_star*B_star/(4*GDP) = B_star_ss;
B_star = B_star_ss*(GDP_ann)/(q*P_star_ss);
TO = (EX + IM)/GDP;

SS0(1) = alpha*q_d/K - R_K/P_d;
SS0(2) = (1-alpha)*q_d/h - W/P_d;
SS0(3) = q_d - q_cd - q_id - q_ex;
SS0(4) = P_c^(1-theta_c) - (omega_c*P_d^(1-theta_c)+(1-omega_c)*P_im^(1-theta_c));
SS0(5) = NX + R_star*q*P_star_ss*B_star;

end