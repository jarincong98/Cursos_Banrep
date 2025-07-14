%{
This code solves a Two Country Model
- Steady State
- Dynare
%}

clear;
clc;
close all;

addpath c:\dynare\6.1\matlab\;

%% Parameters
global sigma eta beta theta psi_h delta omega tau xi alpha phi_K CO A_ss

CO = 2; %Number of countries
%Global parameters
sigma = 1.01; %Inverse IES
eta = 2.0; %Labor supply elasticity
beta = 0.98; %Discount factor
theta = 5.0; %Elasticity of substitution H&F

%Country specific parameters
psi_h = [1.0 1.0]; %Desutility of labor
delta = [0.025 0.025]; %Capital depreciation
omega = [0.5 0.5]; %Home bias
tau = [0.1 0.1]; %Tariffs
xi = [1.0 1.0];%Iceberg cost
alpha = [1/3 1/3]; %Capital Share
phi_K = [0.1 0.1]; %Capital adjustment cost
A_ss  = [1 1]; %TFP
rho_A = [0.9 0.9];

%% Initial Steady State

P_C0 = 1;
C0 = 1;
h0 = 1;
K0 = 3;
q_c0 = 1;

Xss0 = [P_C0, ...
        C0, h0, K0, q_c0...
        C0, h0, K0, q_c0];

Xss1 = fsolve(@Steady_State_TwoC, Xss0);

[SS0, P_C, lambda, C, W, h, R_K, I, K, q, P, q_c, ...
    mu, MC, Pi, TR] = Steady_State_TwoC(Xss1);

%% Dynare

paramsAgg = [sigma; eta; beta; theta];

paramsCO = [psi_h; delta; omega; tau; ...
            alpha; xi; phi_K; A_ss; rho_A];


save paramsAgg paramsAgg
save paramsCO paramsCO

SSVarCO = [P_C; lambda; C; W; h; R_K; I; K; q_c; ...
    mu; MC; Pi; TR; A_ss];

SSVarq = q;
SSVarP = P;

save SSVarCO SSVarCO
save SSVarq SSVarq
save SSVarP SSVarP

dynare Main_TwoCountry.mod 