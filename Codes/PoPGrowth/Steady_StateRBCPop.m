function [SS0, l, k, y, i, c, lambda, w, r_k] = Steady_StateRBCPop(x)

global sigma beta delta alpha psi_l eta rho Ass n_bar

l = x(1);
k = x(2);

y = Ass*(k/(1+n_bar))^alpha*l^(1-alpha);
i = k*(1-(1-delta)/(1+n_bar));
c = y - i;
% c + i = w*l + r_k*k/(1+n_bar);
lambda = c^(-sigma);
w = (1-alpha)*y/l;
r_k = (1+n_bar)*alpha*y/k;


SS0(1) = psi_l*l^eta - c^(-sigma)*w;
SS0(2) = r_k - (1/beta-(1-delta));


end