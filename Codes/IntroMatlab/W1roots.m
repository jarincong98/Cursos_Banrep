%% Principios de MATLAB 
%  aplicables a Dynare

%  Autor: Fredy Alexander Castañeda
%  Banco de la República

function [X1,X2]= W1roots(A,B,C)
    X1=(-B +(sqrt(B^2-4*A*C)))... % Uso de los puntos suspensivos
            /(2*C);
    X2=(-B -(sqrt(B^2-4*A*C)))/...
        (2*C);
end