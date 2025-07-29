function x = W1ar(ss, rho, eps, periods)
    % rho    : Persistencia
    % eps    : Innovación
    % periods: Periodos
    
    x      = NaN(periods+1, 1);
    x(1,1) = ss;
    x(2,1) = ss + eps;

    for i = 3:3+periods
        x(i,1) = rho*x(i-1) + (1-rho)*ss;
    end
end