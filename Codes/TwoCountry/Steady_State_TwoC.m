function [SS0, P_C, lambda, C, W, h, R_K, I, K, q, P, q_c, ...
    mu, MC, Pi, TR] = Steady_State_TwoC(x)

global sigma eta beta theta psi_h delta omega tau xi alpha phi_K CO A_ss

P_C = zeros(1,CO);
lambda = zeros(1,CO);
C = zeros(1,CO);
W = zeros(1,CO);
h = zeros(1,CO);
R_K = zeros(1,CO);
I = zeros(1,CO);
K = zeros(1,CO);
q = zeros(CO,CO);
P = zeros(CO,CO);
q_c = zeros(1,CO);
mu = zeros(1,CO);
MC = zeros(1,CO);
Pi = zeros(1,CO);
TR = zeros(1,CO);

index = 1;
P_C(1,1) = x(index); index = index + 1;

for i = 1:CO
C(1,i) = x(index); index = index + 1;
h(1,i) = x(index); index = index + 1;
K(1,i) = x(index); index = index + 1;
q_c(1,i) = x(index); index = index + 1;
end

P_C(1,2) = 1; %Normalization

for i = 1:CO
lambda(1,i) = C(1,i)^(-sigma)/P_C(1,i);
W(1,i) = psi_h(1,i)*h(1,i)^eta/lambda(1,i);
R_K(1,i) = 1/beta - (1-delta(1,i));
I(1,i) = delta(1,i)*K(1,i);
MC(1,i) = 1/A_ss(1,i)*(R_K(1,i)/alpha(1,i))^alpha(1,i)*(W(1,i)/(1-alpha(1,i)))^(1-alpha(1,i));
mu(1,i) = MC(1,i);
%Domestic prices
P(i,i) = theta/(theta-1)*MC(1,i);
%%Demand for domestic intermediates
q(i,i) = (P_C(1,i)/P(i,i))^theta*omega(1,i)*(C(1,i)+I(1,i));
%Profits
Pi(1,i) = MC(1,i)*q_c(1,i)/(theta-1);

end


%%Demand for imported intermediates
P(1,2) = theta/(theta-1)*xi(1,2)*MC(1,2); %Price of Foreign goods at home
P(2,1) = theta/(theta-1)*xi(1,1)*MC(1,1); %Price of Home goods at foreign
q(1,2) = (P_C(1,1)/((1+tau(1,1))*P(1,2)))^theta*(1-omega(1,1))*(C(1,1)+I(1,1));
q(2,1) = (P_C(1,2)/((1+tau(1,2))*P(2,1)))^theta*(1-omega(1,2))*(C(1,2)+I(1,2));

%Tariff revenue
TR(1,1) = tau(1,1)*P(1,2)*q(1,2);
TR(1,2) = tau(1,2)*P(2,1)*q(2,1);

index = 1;
SS0(index) = q_c(1,1) - q(1,1) - xi(1,1)*q(2,1); index = index + 1;
SS0(index) = q_c(1,2) - q(2,2) - xi(1,2)*q(1,2); index = index + 1;
SS0(index) = P_C(1,1) - (omega(1,1)*P(1,1)^(1-theta)+(1-omega(1,1))*((1+tau(1,1))*P(1,2))^(1-theta))^(1/(1-theta)); index = index+1;
SS0(index) = P_C(1,2) - (omega(1,2)*P(2,2)^(1-theta)+(1-omega(1,2))*((1+tau(1,2))*P(2,1))^(1-theta))^(1/(1-theta)); index = index+1;

for i = 1:CO
SS0(index) = W(1,i) - mu(1,i)*(1-alpha(1,i))*q_c(1,i)/h(1,i); index = index +1;
SS0(index) = R_K(1,i) - mu(1,i)*(alpha(1,i))*q_c(1,i)/K(1,i); index = index +1;
end
%SS0(index) = P_C(1,1)*(C(1,1)+I(1,1)) - W(1,1)*h(1,1) - R_K(1,1)*K(1,1) - Pi(1,1) - TR(1,1);
SS0(index) = P(1,2)*q(1,2) - P(2,1)*q(2,1);
%P_C(1,2)*(C(1,2)+I(1,2)) - W(1,2)*h(1,2) - R_K(1,2)*K(1,2) - Pi(1,2) - TR(1,2)

end