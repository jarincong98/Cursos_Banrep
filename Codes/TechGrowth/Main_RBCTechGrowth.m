%%% This file finds Steady State for simple RBC model with Pop Growth
%%% + Tech Progress

clc; %Clean space
clear all; %Clean workspace
close all; %Close figures

addpath c:\dynare\6.1\matlab\;


%% Parameters

global sigma beta delta alpha psi_l eta rho Ass n_bar gz l_bar

sigma = 2.0; % Inverse of EIS
beta = 0.95; % Discount factor
delta = 0.1; % Depreciation of k
alpha = 1/3; % Capital share in Y
psi_l = 1.0; % Disutility of labor
eta = 2.0; % Labor supply elasticity
rho = 0.75; % AR(1) for TFP
Ass = 2.0; % TFP in the LR
n_bar = 0.01; %Population growth
gz = 0.02; %Technological Progress
l_bar = 1.0; %Labor supply

%% Initial Steady State

k0 = 2.0;

Xss0 = k0;
Xss1 = fsolve(@Steady_StateRBCTech, Xss0);

[SS0, l, k, y, i, c, lambda, w, r_k] = Steady_StateRBCTech(Xss1);

y0 = y;
c0 = c;
k0 = k;

%% Dynare

params = [sigma beta delta alpha psi_l eta rho Ass n_bar l_bar gz];
save params params

SSvar = [l, k, y, i, c, Ass, w, r_k, lambda, n_bar];
save SSvar SSvar

% %% Final Steady State
% 
% n_bar = n_bar/2;
% 
% Xss0 = [l, k];
% Xss1 = fsolve(@Steady_StateRBCPop, Xss0);
% 
% [SS0, l, k, y, i, c, lambda, w, r_k] = Steady_StateRBCPop(Xss1);
% 
% y1 = y;
% c1 = c;
% k1 = k;
% 
% SSvar1 = [l, k, y, i, c, Ass, w, r_k, lambda, n_bar];
% save SSvar1 SSvar1

dynare ModelRBCTech.mod


k_simul = oo_.endo_simul(strmatch('k',M_.endo_names,'exact'),1:50);
plot(k_simul);

y_simul = oo_.endo_simul(strmatch('y',M_.endo_names,'exact'),1:50);
c_simul = oo_.endo_simul(strmatch('c',M_.endo_names,'exact'),1:50);
i_simul = oo_.endo_simul(strmatch('i',M_.endo_names,'exact'),1:50);
figure
hold on
plot(k_simul);
plot(c_simul);
plot(i_simul);
legend('y','c','i')
