%% Ejercicios de análisis económico

%% == Ejecute un ejericio con la opción true
Ej1 = false;
Ej2 = true;
Ej3 = false;

%% == Ejercicio 1: Calibración
if Ej1 
    close all; clc; 
    disp(' ');
    disp('      Ejercicio 1: Calibración');
    disp(' ');
end

%% == Ejercicio 2: Impulso respuesta
if Ej2 
    close all; clc; 
    disp(' ');
    disp('      Ejercicio 2: Impulso respuesta');
    disp(' ');

    dynare ModelRBC.mod

    exo_names       = M_.exo_names;
    endo_names      = M_.endo_names ;
    endo_names_long = M_.endo_names_long ;

    irfs = oo_.irfs;
    
    Row = 3;
    Col = 3;
    
    figure('Color','White')
        for aa = 1:length(endo_names)
            subplot(Row,Col,aa)
            variable = [endo_names{aa} '_' exo_names{1:end}];
            plot(irfs.(variable)); yline(0);
            title(endo_names_long{aa});
        end
end

%% == Ejercicio 3: Análisis de sensibilidad
if Ej3
    close all; clc; 
    disp(' ');
    disp('      Ejercicio 3: Análisis de sensibilidad');
    disp(' ');
end
