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

[t, solution] = ode45(seir_eqn, tspan, x0, 0.8);
plot(t,solution(:, 1), "-g" ,t,solution(:, 2), "-r" , t,solution(:, 3), "-b", t,solution(:, 4), "-k" );
hold on;
xlabel('Time');
ylabel('Infected Population');
legend('S', 'E', 'I', 'R')
grid on;
hold off;
