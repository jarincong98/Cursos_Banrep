function [SS0, l, k, y, i, c, lambda, w, r_k] = Steady_StateRBCTech(x)

global sigma beta delta alpha psi_l eta rho Ass n_bar gz l_bar

k = x(1);

l = l_bar;
y = Ass*(k/((1+n_bar)*(1+gz)))^alpha*l^(1-alpha);
i = k*(1-(1-delta)/((1+n_bar)*(1+gz)));
c = y - i;
% c + i = w*l + r_k*k/(1+n_bar);
lambda = c^(-sigma);
w = (1-alpha)*y/l;
r_k = (1+n_bar)*(1+gz)*alpha*y/k;

%SS0(1) = psi_l*l^eta - c^(-sigma)*w;
SS0(1) = r_k - (1/beta*(1+gz)^sigma-(1-delta));


end