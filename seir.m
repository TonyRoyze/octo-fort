%seir
a = 0.006; % Recovery rate
e = 0.1;   % Transition rate 
b = 0.75;  % Transmission rate
N = 10000000; 

E0 = 2000; 
I0 = 10;   
R0 = 0;    
S0 = N - E0 - I0; 

tspan = [0 300];       
x0 = [S0, E0, I0, R0]; 


seir_eqn = @(t, x, u) [
    -b * (1-u) * x(1) * x(3) / N;      
    b * (1-u) * x(1) * x(3) / N - e * x(2); 
    e * x(2) - a * x(3);              
    a * x(3)                           
];


u = [0.8, 0.6, 0.5, 0.4, 0.2];
colors = ['r', 'g', 'b', 'm', 'k']; 
hold on;


for i = 1:length(u)
    u_i = u(i);
    [t, solution] = ode45(@(t, x) seir_eqn(t, x, u_i), tspan, x0);
    plot(t, solution(:, 3), colors(i));
end


hold off;
xlabel('Time');
ylabel('Infected Population');
legend('0.8', '0.6', '0.5', '0.4', '0.2')
grid on;
