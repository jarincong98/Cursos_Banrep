%%% This file finds Steady State for simple RBC model with Pop Growth

clc; %Clean space
clear all; %Clean workspace
close all; %Close figures

addpath c:\dynare\6.1\matlab\;


%% Parameters

global sigma beta delta alpha psi_l eta rho Ass n_bar

sigma = 2.0; % Inverse of EIS
beta = 0.95; % Discount factor
delta = 0.1; % Depreciation of k
alpha = 1/3; % Capital share in Y
psi_l = 1.0; % Disutility of labor
eta = 2.0; % Labor supply elasticity
rho = 0.75; % AR(1) for TFP
Ass = 2.0; % TFP in the LR
n_bar = 0.01; %Population growth

%% Initial Steady State

l0 = 1/3;
k0 = 2.0;

Xss0 = [l0, k0];
Xss1 = fsolve(@Steady_StateRBCPop, Xss0);

[SS0, l, k, y, i, c, lambda, w, r_k] = Steady_StateRBCPop(Xss1);

y0 = y;
c0 = c;
k0 = k;

%% Dynare

params = [sigma beta delta alpha psi_l eta rho Ass n_bar];
save params params

SSvar = [l, k, y, i, c, Ass, w, r_k, lambda, n_bar];
save SSvar SSvar

%% Final Steady State

n_bar = n_bar/2;

Xss0 = [l, k];
Xss1 = fsolve(@Steady_StateRBCPop, Xss0);

[SS0, l, k, y, i, c, lambda, w, r_k] = Steady_StateRBCPop(Xss1);

y1 = y;
c1 = c;
k1 = k;

SSvar1 = [l, k, y, i, c, Ass, w, r_k, lambda, n_bar];
save SSvar1 SSvar1



dynare ModelRBCPop.mod

