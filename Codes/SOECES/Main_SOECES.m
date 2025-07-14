%%% This file:
%{
Runs SOE code with different technologies for C and I
%}

%%% This file finds Steady State for simple SOE model

clc; %Clean space
clear; %Clean workspace
close all; %Close figures

addpath c:\dynare\6.1\matlab\;


%% Parameters

global sigma delta beta phi_h eta psi_K alpha theta_c theta_i omega_c omega_i theta_ex B_star_ss ...
    y_star_ss A_ss P_star_ss rho_C rho_I

sigma = 1.01; % IES
delta = 0.025; %Capital depreciation
beta  = 0.98; %Discount factor
phi_h = 1; %Disutility of labor
eta   = 1+1/1.5; % Labor supply elasticity
psi_K = 0.1; % Capital adjustment cost
alpha = 1/3; % Capital share
theta_c = 1.5; %H&F elasticity of substitution (C)
theta_i = 1.5; %H&F elasticity of substitution (I)
omega_c = 0.5; %Home bias for C
omega_i = 0.5; %Home bias for I
theta_ex = 1.5; %Elasticity of substitution exports

B_star_ss = -0.50; %Debt
y_star_ss = 1; %Foreign GDP
A_ss = 1; %TFP
P_star_ss = 1; %Foreign prices

rho_A = 0.8;
rho_P_star = 0.8;
rho_y_star = 0.8;

phi_b = -0.1;

rho_C = 0.75;
rho_I = 0.75;

%% Solve Initial Equilibrium

K0 = 1;
C0 = 1;
W0 = 1;
P_d0 = 1;
P_im0 = 1;

Xss0 = [K0, C0, W0, P_d0, P_im0];
Xss1 = fsolve(@Steady_StateSOECES, Xss0);

[SS0, K, C, W, P_d, P_im, q, I, P_c, lambda, h, P_i, R_K, ...
    R_star, q_d, q_cd, q_cim, q_id, q_iim, q_ex, EX, IM, NX, B_star,...
    GDP, GDP_ann, TO] = Steady_StateSOECES(Xss1);

%% Calibration

Xss0 = [K, C, W, P_d, P_im, A_ss, y_star_ss, alpha, omega_i];
Xss1 = fsolve(@Steady_StateSOECESCalib, Xss0);

[SS0, K, C, W, P_d, P_im, q, I, P_c, lambda, h, P_i, R_K, ...
    R_star, q_d, q_cd, q_cim, q_id, q_iim, q_ex, EX, IM, NX, B_star,...
    GDP, GDP_ann, TO] = Steady_StateSOECESCalib(Xss1);

%% Saving values for Dynare

params = [sigma delta beta phi_h eta psi_K alpha theta_c theta_i omega_c ...
    omega_i theta_ex B_star_ss y_star_ss A_ss P_star_ss rho_A rho_P_star ...
    rho_y_star R_star phi_b rho_C rho_I];
save params params

SSvar = [K, C, W, P_d, P_im, q, I, P_c, lambda, h, P_i, R_K, ...
    R_star, q_d, q_cd, q_cim, q_id, q_iim, q_ex, EX, IM, NX, B_star, ...
    A_ss, P_star_ss, y_star_ss, GDP, GDP_ann];
save SSvar SSvar

%% Run Dynare

dynare Model_SOECES.mod