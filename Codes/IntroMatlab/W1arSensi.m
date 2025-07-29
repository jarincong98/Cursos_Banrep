function x = W1arSensi(ss, rho, eps, periods)
    % rho    : Persistencia
    % eps    : Innovación
    % periods: Periodos
    
    Case   = length(rho); 
    x      = NaN(3+periods, Case);

    for i = 1:Case
        x(1,i) = ss;
        x(2,i) = ss + eps;
    end

    for i = 3:3+periods                           % Para cada periodo
        for j = 1:Case                            % Para cada persistencia
            rho_case = rho(j);
            x(i,j) = rho_case*x(i-1,j) + (1-rho_case)*ss;
        end
    end
end