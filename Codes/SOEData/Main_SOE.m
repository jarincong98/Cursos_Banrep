%%% This file finds Steady State for simple SOE model

clc; %Clean space
clear; %Clean workspace
close all; %Close figures

addpath c:\dynare\6.1\matlab\;


%% Parameters

global sigma beta delta alpha psi_l eta rho_a A_ss B_ss phi_b dum_KAC dum_KACAlt

sigma = 2.0; % Inverse of EIS
beta = 0.96; % Discount factor
delta = 0.1; % Depreciation of k
alpha = 1/3; % Capital share in Y
psi_l = 1.0; % Disutility of labor
eta = 5; % Labor supply elasticity

rho_a = 0.75; % AR(1) for TFP
A_ss = 1.0; % TFP in the LR

B_ss = -0.25; %Deuda en SS
phi_b = -0.1; %Sensibilidad de la deuda
rho_beta = 0.75;

dum_KACAlt = 0;
dum_KAC = 1;

if dum_KAC == 0
phi_k = 0;
elseif dum_KAC == 1
    phi_k = 0.5;
end


%% Steady State

K0 = 3;
L0 = 1/3;
C0 = 1;

Xss0 = [K0, L0, C0];
Xss1 = fsolve(@Steady_State_SOE, Xss0);

[SS0, K, L, C, Y, R_K, W, lambda, I, R_star, B_star, NX] = Steady_State_SOE(Xss1);

%% Calibration

Xss0 = [K, L, C, A_ss, alpha, B_ss];
Xss1 = fsolve(@Steady_State_SOECalib, Xss0);

[SS0, K, L, C, Y, R_K, W, lambda, I, R_star, B_star, NX] = Steady_State_SOECalib(Xss1);


%% Dynare

Params = [sigma beta delta alpha psi_l eta rho_a A_ss B_ss phi_b R_star Y phi_k rho_beta];
save Params Params

SSvar = [K, L, C, Y, R_K, W, lambda, I, R_star, B_star, NX, A_ss];
save SSvar SSvar


dynare ModelSOE.mod noclearall 
