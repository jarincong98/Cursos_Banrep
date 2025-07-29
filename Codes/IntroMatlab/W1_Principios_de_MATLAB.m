%%                      Principios de MATLAB 
%                  útiles y aplicables para Dynare

%  Autor: Fredy Alexander Castañeda / Óscar Ávila / Juan Andrés Rincón
%   .......................................................................
%%  >> 0. Limpieza 
    clear;      % Limpia el workspace
    close all;  % Cierra todas las gráficas
    clc;        % Limpia el comand window
%   .......................................................................
%%  >> 1. Operaciones básicas
    a = 1;    %   Creación de una variable e impresión en el comand window
    b = 1+1;  %   Suma
    c = a+1;

    d = a-1;  %   Resta
    f = b*c;  %   Multiplicación
    g = f/d;  %   División
    g = f/c;  

    h = f^(1/2); % Exponente
    h = sqrt(g); % Raíz cuadrada (Función de MATLAB)

    Name= {'Fredo'};
% return;
%   .......................................................................
%%  >> 2. Funciones
    RootA = 1;
    RootB = 3;
    RootC = 2;
    [Root1, Root2] = W1roots(RootA,RootB,RootC);
    disp('Resultados');
    disp(['     Raíz 1: ' num2str(Root1)]);
    disp(['     Raíz 2: ' num2str(Root2)]);
% return;
%   .......................................................................
%%  >> 3. Matrices
clear;                   % Limpia el workspace
    a = [1, 2, 3];
    b = [1; 2; 3]       % Creación de vector columna

    aSize   = size(a);   % Tamaño de vectores
    aRow    = size(a,1); % Filas de un vector
    aColumn = size(a,2); % Columnas de un vector

clc;                     % Limpia el comand window
    c = a*b;             % Multiplicación de matrices
    d = a*c;       
    e = a';              % Transponer 
        % f = a'*b;   % ERROR!!!
        % f = a*b';   % ERROR!!!
    f = a.*b;   % Solución
    g = a.*b;   % Solución

    h = 10:-1:1;
% return;
%   .......................................................................
%%  >> 4. Procesos iterativos
clear;                   % Limpia el workspace
clc;                     % Limpia el comand window
%%  >>> 4.1 Procesos iterativos: Ejercicio 1
%   Sea una estructura: x = rho_x * x(-1) + (1 - rho_x) * x_ss + eps_x
    x_ss    = 0;
    eps_x   = 0.5; 
    periods = 20;
    descripcion = ['Choque de ' num2str(eps_x)];

    rho_x   = 0.75; 
    x = W1ar(x_ss, rho_x, eps_x,  periods);

%%  >>> 4.2 Procesos iterativos: Ejercicio 2
%   Sea una estructura: x = rho_x * x(-1) + (1 - rho_x) * x_ss + eps_x
%   Se analizan diferentes persistencias
    rhos_x   = 0.1: 0.2 :1;
    descripcion = [num2str(eps_x)];

    x_case = W1arSensi(x_ss, rhos_x, eps_x,  periods);
    
    % >> Resultados como una estructura
    rho_sensi = length(rhos_x); % Sensibilidad
    for i = 1:rho_sensi
        x_struct.(['x_Case_' num2str(i)])   = x_case(:,i);
    end
% return;
%   .......................................................................
%%  >> 5. Gráficas
%%  >>> 5.1 Gráfica 1: Gráfica simple
figure('Name', 'Dinámica de x', 'Color', 'white');
    plot(x);
    title(['Dinámica de x / Innovación de ' descripcion]);
    legend(['\rho_x :' num2str(rho_x)]);
    
%%  >>> 5.2 Gráfica 2: Gráfica con loops
figure('Name', 'Dinámica de x', 'Color', 'white');
    % Inputs
        rho_case = fieldnames(x_struct); % Objetos de una estructura
        
    % Loop de ploteo
    for i = 1:length(rho_case)
        plot(x_struct.(rho_case{i}),...
                    'LineWidth',1.5,...
                    'LineStyle','--');
        hold on;
    end

    title(['Dinámica de x / Innovación de ' descripcion]);
    
    % Legenda de una gráfica
    for i = 1:length(rho_case)
        CaseLengend{1,i} = ['\rho_x :' num2str(rhos_x(i))]; 
    end
    legend(CaseLengend);

%%  >>> 5.3 Gráfica 3: Gráfica con subplots y loops
figure('Name', 'Dinámica de x', 'Color', 'white');
    for i = 1:length(rho_case)
        subplot(2,3,i)
        plot(x_struct.(rho_case{i}),...
                    'LineWidth',1.5,...
                    'LineStyle','-.');
        title(CaseLengend{i})
    end
% return;
%   .......................................................................
%%  >> 6. Ejercicios "avanzados" aplicados
clear; close all; clc;
%%  >>> Ejercicio aplicado 1 : Filtro de Hodrick-Prescott
folderName = 'Datos';
if ~exist(folderName, 'dir')
    mkdir(folderName);
    disp(['Carpeta creada: ', folderName]);
else
    disp(['La carpeta ya existe: ', folderName]);
end

cd("Datos\");
    db = readtable('DANE.xlsx');
cd("..");

dbNames = db.Properties.VariableNames;

for aa = 2:length(dbNames)
    db_l.(dbNames{aa}) = log(db.(dbNames{aa}));
    [db_lhp.([dbNames{aa} '_trend']), db_lhp.([dbNames{aa} '_cycle'])] = hpfilter(db_l.(dbNames{aa}));
end

figure('Color', 'white');
for aa = 2:length(dbNames)
    plot(db.Var1, db_lhp.([dbNames{aa} '_cycle']))
    hold on;
end
legend(dbNames{2:end})


for aa = 2:length(dbNames)
    stats.mean.(dbNames{aa}) = mean(db_lhp.([dbNames{aa} '_cycle']));

    stats.corr.(dbNames{aa}) = corr(db_lhp.([dbNames{aa} '_cycle']),...
                                    db_lhp.Y_cycle);

    stats.RelativeSTD.(dbNames{aa}) = (std(db_lhp.([dbNames{aa} '_cycle']))/...
                                      std(db_lhp.Y_cycle));
end

statsName  = fieldnames(stats);
statsNameVariables  = fieldnames(stats.mean);
statsTable = table('Size', [3, 3],...
          'VariableTypes', ["double", "double", "double"], ...
          'VariableNames', ["Producto", "Consumo", "Inversion"],...
               'RowNames',["Media", "Correlacion", "Std Rela."]);

for aa = 1:length(statsName)
    for bb = 1:length(statsNameVariables)
    statsTable{aa,bb} = stats.(statsName{aa}).(statsNameVariables{bb});
    end
end