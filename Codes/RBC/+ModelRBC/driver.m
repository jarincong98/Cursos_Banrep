%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'ModelRBC';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eps_A'};
M_.exo_names_tex(1) = {'\epsilon^{A}'};
M_.exo_names_long(1) = {'Productivity shock'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'W'};
M_.endo_names_tex(1) = {'W'};
M_.endo_names_long(1) = {'Salario'};
M_.endo_names(2) = {'R_K'};
M_.endo_names_tex(2) = {'R^{K}'};
M_.endo_names_long(2) = {'Renta del capital'};
M_.endo_names(3) = {'MC'};
M_.endo_names_tex(3) = {'MC'};
M_.endo_names_long(3) = {'Costos marginales'};
M_.endo_names(4) = {'L'};
M_.endo_names_tex(4) = {'L'};
M_.endo_names_long(4) = {'Labor'};
M_.endo_names(5) = {'K'};
M_.endo_names_tex(5) = {'K'};
M_.endo_names_long(5) = {'Capital'};
M_.endo_names(6) = {'Y'};
M_.endo_names_tex(6) = {'Y'};
M_.endo_names_long(6) = {'Production'};
M_.endo_names(7) = {'I'};
M_.endo_names_tex(7) = {'I'};
M_.endo_names_long(7) = {'Investment'};
M_.endo_names(8) = {'C'};
M_.endo_names_tex(8) = {'C'};
M_.endo_names_long(8) = {'Consumption'};
M_.endo_names(9) = {'A'};
M_.endo_names_tex(9) = {'A'};
M_.endo_names_long(9) = {'Productivity'};
M_.endo_partitions = struct();
M_.param_names = cell(8,1);
M_.param_names_tex = cell(8,1);
M_.param_names_long = cell(8,1);
M_.param_names(1) = {'sigma'};
M_.param_names_tex(1) = {'\sigma'};
M_.param_names_long(1) = {'Inverse of intertemporal subs elasticity'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'\beta'};
M_.param_names_long(2) = {'Discount factor'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'\delta'};
M_.param_names_long(3) = {'Capital depreciation'};
M_.param_names(4) = {'alpha'};
M_.param_names_tex(4) = {'\alpha'};
M_.param_names_long(4) = {'Capital share'};
M_.param_names(5) = {'psi_l'};
M_.param_names_tex(5) = {'\phi^{L}'};
M_.param_names_long(5) = {'psi L'};
M_.param_names(6) = {'eta'};
M_.param_names_tex(6) = {'\eta'};
M_.param_names_long(6) = {'Frish elasticity'};
M_.param_names(7) = {'rho'};
M_.param_names_tex(7) = {'\rho_{A}'};
M_.param_names_long(7) = {'Productivity persisitence'};
M_.param_names(8) = {'Ass'};
M_.param_names_tex(8) = {'A'};
M_.param_names_long(8) = {'Productivity steady state'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 8;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [1 2 3 4 6 7 8];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 9;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 0;
 0 5 0;
 0 6 0;
 1 7 0;
 0 8 12;
 0 9 0;
 0 10 13;
 2 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [12; 10; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'Función de producción' ;
  2 , 'name' , 'Demanda de capital' ;
  3 , 'name' , 'Demanda de trabajo' ;
  4 , 'name' , 'Costos marginales' ;
  5 , 'name' , 'Ley de acumulación de capital' ;
  6 , 'name' , 'Oferta de trabajo' ;
  7 , 'name' , 'Ecuación de Euler' ;
  8 , 'name' , 'Productividad' ;
  9 , 'name' , 'Demanda agregada' ;
};
M_.mapping.W.eqidx = [3 4 6 ];
M_.mapping.R_K.eqidx = [2 4 ];
M_.mapping.MC.eqidx = [2 3 4 ];
M_.mapping.L.eqidx = [1 3 6 ];
M_.mapping.K.eqidx = [1 2 5 7 ];
M_.mapping.Y.eqidx = [1 2 3 7 9 ];
M_.mapping.I.eqidx = [5 9 ];
M_.mapping.C.eqidx = [6 7 9 ];
M_.mapping.A.eqidx = [1 4 8 ];
M_.mapping.eps_A.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 8];
M_.block_structure.block(1).variable = [ 9];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 8;
M_.block_structure.block(2).mfs = 7;
M_.block_structure.block(2).equation = [ 4 2 6 1 9 5 3 7];
M_.block_structure.block(2).variable = [ 3 2 1 4 7 5 6 8];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 26;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [5 0 8 9 10 11 12 13 14 20 21 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 3 5 1 6 1 2 6 2 3 6 4 5 5 7 1 3 4 6 2 4 7 7 7 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([5 5 5 8 8 9 9 9 10 10 10 11 11 12 12 13 13 13 13 14 14 14 20 21 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 1 4 4 4 6 9 12 14 16 20 23 23 23 23 23 23 24 25 ]);
M_.block_structure.variable_reordered = [ 9 3 2 1 4 7 5 6 8];
M_.block_structure.equation_reordered = [ 8 4 2 6 1 9 5 3 7];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 5;
 2 5;
 5 5;
 8 9;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 4;
 1 6;
 1 9;
 2 2;
 2 3;
 2 6;
 3 1;
 3 3;
 3 4;
 3 6;
 4 1;
 4 2;
 4 3;
 4 9;
 5 5;
 5 7;
 6 1;
 6 4;
 6 8;
 7 5;
 7 8;
 8 9;
 9 6;
 9 7;
 9 8;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 7 6;
 7 8;
];
M_.block_structure.dyn_tmp_nbr = 10;
M_.state_var = [9 5 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [32; 47; -1; ];
M_.dynamic_g1_sparse_rowval = int32([1 2 5 8 3 4 6 2 4 2 3 4 1 3 6 5 7 1 2 3 9 5 9 6 7 9 1 4 8 7 7 8 ]);
M_.dynamic_g1_sparse_colval = int32([5 5 5 9 10 10 10 11 11 12 12 12 13 13 13 14 14 15 15 15 15 16 16 17 17 17 18 18 18 24 26 28 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 4 4 4 4 5 8 10 13 16 18 22 24 27 30 30 30 30 30 30 31 31 32 32 33 ]);
M_.dynamic_g2_sparse_indices = int32([1 13 13 ;
1 13 5 ;
1 13 18 ;
1 5 5 ;
1 5 18 ;
2 12 5 ;
2 12 15 ;
2 5 5 ;
2 5 15 ;
3 12 13 ;
3 12 15 ;
3 13 13 ;
3 13 15 ;
4 10 10 ;
4 10 11 ;
4 10 18 ;
4 11 11 ;
4 11 18 ;
4 18 18 ;
6 13 13 ;
6 13 17 ;
6 17 17 ;
7 14 14 ;
7 14 24 ;
7 14 26 ;
7 24 26 ;
7 17 17 ;
7 26 26 ;
8 9 9 ;
8 9 28 ;
]);
M_.lhs = {
'Y'; 
'R_K'; 
'W'; 
'MC'; 
'K'; 
'psi_l*L^eta*C^sigma'; 
'C^(-sigma)'; 
'A'; 
'Y'; 
};
M_.static_tmp_nbr = [10; 1; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 8];
M_.block_structure_stat.block(1).variable = [ 9];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 8;
M_.block_structure_stat.block(2).mfs = 8;
M_.block_structure_stat.block(2).equation = [ 2 3 4 5 6 7 1 9];
M_.block_structure_stat.block(2).variable = [ 2 6 3 7 1 5 4 8];
M_.block_structure_stat.variable_reordered = [ 9 2 6 3 7 1 5 4 8];
M_.block_structure_stat.equation_reordered = [ 8 2 3 4 5 6 7 1 9];
M_.block_structure_stat.incidence.sparse_IM = [
 1 4;
 1 5;
 1 6;
 1 9;
 2 2;
 2 3;
 2 5;
 2 6;
 3 1;
 3 3;
 3 4;
 3 6;
 4 1;
 4 2;
 4 3;
 4 9;
 5 5;
 5 7;
 6 1;
 6 4;
 6 8;
 7 5;
 7 6;
 7 8;
 8 9;
 9 6;
 9 7;
 9 8;
];
M_.block_structure_stat.tmp_nbr = 9;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 3 1 2 6 7 8 1 2 3 4 8 2 3 5 1 4 6 7 2 5 7 5 6 8 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 2 2 2 2 2 3 3 3 4 4 5 5 5 6 6 6 6 7 7 7 8 8 8 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 3 8 11 13 16 20 23 26 ]);
M_.static_g1_sparse_rowval = int32([3 4 6 2 4 2 3 4 1 3 6 1 2 5 7 1 2 3 7 9 5 9 6 7 9 1 4 8 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 3 3 3 4 4 4 5 5 5 5 6 6 6 6 6 7 7 8 8 8 9 9 9 ]);
M_.static_g1_sparse_colptr = int32([1 4 6 9 12 16 21 23 26 29 ]);
load params.mat;
load SSvar.mat;
M_.params(1) = params(1);
sigma = M_.params(1);
M_.params(2) = params(2);
beta = M_.params(2);
M_.params(3) = params(3);
delta = M_.params(3);
M_.params(4) = params(4);
alpha = M_.params(4);
M_.params(5) = params(5);
psi_l = M_.params(5);
M_.params(6) = params(6);
eta = M_.params(6);
M_.params(7) = params(7);
rho = M_.params(7);
M_.params(8) = params(8);
Ass = M_.params(8);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(4) = SSvar(1);
oo_.steady_state(5) = SSvar(2);
oo_.steady_state(6) = SSvar(3);
oo_.steady_state(7) = SSvar(4);
oo_.steady_state(8) = SSvar(5);
oo_.steady_state(9) = SSvar(6);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
write_latex_parameter_table;
write_latex_definitions;
collect_latex_files;
return;
options_resid_ = struct();
display_static_residuals(M_, options_, oo_, options_resid_);
oo_.dr.eigval = check(M_,options_,oo_);
steady;
model_diagnostics(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.01;
options_.irf = 40;
options_.order = 2;
options_.periods = 1000;
var_list_ = {'Y';'C';'I';'L';'K'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'ModelRBC_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
