%%% This file finds Steady State for simple SOE model

clc; %Clean space
clear all; %Clean workspace
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


%% Dynare

Params = [sigma beta delta alpha psi_l eta rho_a A_ss B_ss phi_b R_star Y phi_k];
save Params Params

SSvar = [K, L, C, Y, R_K, W, lambda, I, R_star, B_star, NX, A_ss];
save SSvar SSvar

if dum_KACAlt == 0
dynare ModelSOE.mod noclearall
elseif dum_KACAlt == 1
dynare ModelSOEAltKAC.mod noclearall
oo_AltKAC = oo_;
M_AltKAC = M_;
save oo_AltKAC oo_AltKAC
save M_AltKAC M_AltKAC
end

if dum_KACAlt == 0
if dum_KAC == 1
oo_KAC = oo_;
M_KAC = M_;
save oo_KAC oo_KAC
save M_KAC M_KAC
else
oo_NoKAC = oo_;
M_NoKAC = M_;
save oo_NoKAC oo_NoKAC
save M_NoKAC M_NoKAC
end
end
%% Compare

close all
clear all

load oo_KAC.mat
load oo_NoKAC.mat
load M_KAC.mat
load M_NoKAC.mat
load oo_AltKAC.mat
load M_AltKAC.mat 


figure
subplot(2,2,1)
hold on
plot(oo_KAC.irfs.I_eps_A)
plot(oo_NoKAC.irfs.I_eps_A)
plot(oo_AltKAC.irfs.I_eps_A)
legend('KAC', 'NoKAC', 'AltKAC')
title('Investment')
subplot(2,2,2)
hold on
plot(oo_KAC.irfs.C_eps_A)
plot(oo_NoKAC.irfs.C_eps_A)
plot(oo_AltKAC.irfs.C_eps_A)
title('Consumption')
subplot(2,2,3)
hold on
plot(oo_KAC.irfs.Y_eps_A)
plot(oo_NoKAC.irfs.Y_eps_A)
plot(oo_AltKAC.irfs.Y_eps_A)
title('Y')
subplot(2,2,4)
hold on
plot(oo_KAC.irfs.L_eps_A)
plot(oo_NoKAC.irfs.L_eps_A)
plot(oo_AltKAC.irfs.L_eps_A)
title('Labor')