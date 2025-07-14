%%% This file finds Steady State for simple RBC model
%% GHH preferences

clc; %Clean space
clear all; %Clean workspace
close all; %Close figures

addpath c:\dynare\6.1\matlab\;


%% Parameters

global sigma beta delta alpha psi_l eta rho Ass 

sigma = 2.0; % Inverse of EIS
beta = 0.95; % Discount factor
delta = 0.1; % Depreciation of k
alpha = 1/3; % Capital share in Y
psi_l = 1.0; % Disutility of labor
eta = 2.0; % Labor supply elasticity
rho = 0.75; % AR(1) for TFP
Ass = 2.0; % TFP in the LR

%% Steady State
L0 = 1.0;
K0 = 2.0;

Xss0 = [L0 K0];
Xss1 = fsolve(@Steady_StateRBCGHH, Xss0);

[SS0, L, K, Y, I, C, lambda] = Steady_StateRBCGHH(Xss1);

%% Calibration

Xss0 = [L K Ass alpha psi_l];
Xss1 = fsolve(@Steady_State_CalibRBCGHH, Xss0);

[SS0, L, K, Y, I, C, lambda] = Steady_State_CalibRBCGHH(Xss1);


%% Dynare

params = [sigma beta delta alpha psi_l eta rho Ass];
save params params

SSvar = [L, K, Y, I, C, Ass, lambda];
save SSvar SSvar

dynare ModelRBCGHH.mod

