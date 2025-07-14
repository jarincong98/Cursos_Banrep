%%% This file finds Steady State for simple SOE model

clc; %Clean space
clear all; %Clean workspace
close all; %Close figures

addpath c:\dynare\6.1\matlab\;


%% Parameters

global sigma beta delta alpha psi_l eta rho_a A_ss B_ss T_ss rho_tau phi_b

sigma = 2.0; % Inverse of EIS
beta = 0.96; % Discount factor
delta = 0.1; % Depreciation of k
alpha = 1/3; % Capital share in Y
psi_l = 1.0; % Disutility of labor
eta = 5; % Labor supply elasticity

rho_a = 0.75; % AR(1) for TFP
A_ss = 1.0; % TFP in the LR

B_ss = -0.25;

T_ss = 0.1;
rho_tau = 0.75;
phi_b = -0.05;

%% Steady State

K0 = 3;
L0 = 1/3;

Xss0 = [K0, L0];
Xss1 = fsolve(@Steady_State_SOE, Xss0);

[SS0, K, L, B_star, R_star, I, Y, C] = Steady_State_SOE(Xss1);


%% Dynare
 
Params = [sigma beta delta alpha psi_l eta rho_a A_ss B_ss T_ss rho_tau phi_b R_star Y];
save Params Params

SSvar = [K, L, B_star, R_star, I, Y, C, A_ss, T_ss];
save SSvar SSvar

dynare ModelSOE.mod