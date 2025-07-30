%% Ejercicios de análisis económico
%   Autores: Oscar Ávlia, Fredy A. Castañeda, Juan A. Rincón
clc; clear; close all;

%% == Ejecute un ejericio con la opción true
Ej1 = false;
Ej2 = true;

RunModel = true;
%% == Ejercicio 1: Impulso respuesta
if Ej1
    close all; clc; 
    disp(' ');
    disp('      Ejercicio 1: Impulso respuesta');
    disp(' ');

    if RunModel
        dynare ModelSOE.mod;
        save('Results_Ej1', 'oo_','M_');
    else
        load('Results_Ej1');
    end

    exo_names       = M_.exo_names;
    Title_exo_names = M_.exo_names_long;
    endo_names      = M_.endo_names ;
    endo_names_long = M_.endo_names_long ;

    irfs = oo_.irfs;
    
    Row = 3;
    Col = 5;
    Colors = parula(length(endo_names));
    
    figure('Color','White')
        for aa = 1:length(endo_names)
            subplot(Row,Col,aa)
            variable = [endo_names{aa} '_' exo_names{1}];
            plot(irfs.(variable), ...
                'Linewidth', 2, ... 
                'Color', Colors(aa,1:end)); 
            grid on;
             xlabel('Periodos'); 
            yline(0);
            title(endo_names_long{aa});
        end
    sgtitle(Title_exo_names{1});

    figure('Color','White', 'Name', 'Choque de productividad II')
    Colors = lines(length(endo_names));

    for aa = 1:length(endo_names)-4
            variable = [endo_names{aa} '_' exo_names{1}];
        subplot(2,2,[1,3])
            plot(irfs.(variable), ...
                'Linewidth', 2, ... 
                'Color', Colors(aa,1:end)); hold on ;
            grid on;
             xlabel('Periodos'); 

    end
    legend(endo_names_long{1} , ...
        endo_names_long{2}, ...
        endo_names_long{3}, ...
        endo_names_long{4}, ...
        endo_names_long{5}, ...
        endo_names_long{6}, ...
        endo_names_long{7}, ...
        endo_names_long{8}, ...
        endo_names_long{9} ...
        );

        subplot(2,2,2)
            plot(irfs.W_eps_A,'Linewidth', 2,'Color', Colors(1,1:end)); hold on ;
            plot(irfs.L_eps_A,'Linewidth', 2,'Color', Colors(2,1:end));
                legend('Salario','Trabajo');  
                grid on;
             xlabel('Periodos'); 
            title('Mercado de trabajo');
    
        subplot(2,2,4)
            plot(irfs.R_K_eps_A,'Linewidth', 2,'Color', Colors(3,1:end)); hold on ;
            plot(irfs.K_eps_A,'Linewidth', 2,'Color', Colors(4,1:end));
                legend('Renta del capital','Capital');  
                grid on;
             xlabel('Periodos'); 
            title('Mercado de capital');
    
    sgtitle(Title_exo_names{1});
end

%% == Ejercicio 2: Análisis de sensibilidad
if Ej2
    disp(' ');
    disp('      Ejercicio 2: Análisis de sensibilidad');
    disp(' ');

    %% == Inputs
    % == NO OLVIDE CAMBIAR EL NOMBRE EN DYNARE == %
        ParamsName = 'rho_a';   %'aalpha';       'pphi_K';  'delta';   
        Params     = 0.75;0:0.5:0.9; %[0.3:0.1:0.75]; [0:0.1:1]; [0 0.05 1]; 
    % == NO OLVIDE CAMBIAR EL NOMBRE EN DYNARE == %

    %% == Code
    if RunModel
        for aa = 1:length(Params)
            ParamsInDynare = Params(aa);
            dynare ModelSOE.mod;
            eval(['Ej2_Results.oo' num2str(aa) '_ = oo_ ;']);
            eval(['Ej2_Results.M'  num2str(aa) '_ = M_ ;']);

            save('Results_Ej2', 'Ej2_Results');
        end
    else
        load('Results_Ej2');
    end

    exo_names       = Ej2_Results.M1_.exo_names;
    Title_exo_names = Ej2_Results.M1_.exo_names_long{1};
    endo_names      = Ej2_Results.M1_.endo_names;
    endo_names_long = Ej2_Results.M1_.endo_names_long ;
    param_names_tex = Ej2_Results.M1_.param_names_tex ;
    ParamsVector    = Ej2_Results.M1_.param_names;

    ParamsPosition = find(strcmp(ParamsVector, ParamsName));

    Row = 3;
    Col = 5;
    Colors = parula(length(Params));

    figure('Color','White')
        for aa = 1:length(endo_names)
            subplot(Row,Col,aa)
            variable = [endo_names{aa} '_' exo_names{1}];
            for bb = 1 : length(Params)
                plot(Ej2_Results.(['oo' num2str(bb) '_']).irfs.(variable), ...
                    'Linewidth', 2 , ...
                    'Color',     Colors(bb,1:end));
                hold on;

                ParamsValue = Ej2_Results.(['M' num2str(bb) '_']).params(ParamsPosition);
                Ej2_Legend{1,bb} = [param_names_tex{ParamsPosition} ' = ' num2str(ParamsValue)];
            end
             xlabel('Periodos'); grid on;
        title(endo_names_long{aa}); 
        end

    lgd = legend(Ej2_Legend, 'Orientation', 'horizontal');
    lgd.Position = [0.35, 0.01, 0.3, 0.05];
    
    TitleParams = strjoin(['Análisis de sensibilidad en el parámetro' param_names_tex(ParamsPosition)], ' ');
    sgtitle([Title_exo_names TitleParams ]);   

end
