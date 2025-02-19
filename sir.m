%sir
beta=0.1;
alpha=0.05;
N=1000;

tspan=[0 300];
x0=[999, 1, 0];

sir_eqn=@(t,x) [
- beta*x(1)*x(2)/N;
beta*x(1)*x(2)/N - alpha*x(2) ;
alpha*x(2) ;
];
[t, solution]=ode45(sir_eqn,tspan,x0);

plot(t,solution(:, 1), "-g" ,t,solution(:, 2), "-r" , t,solution(:, 3), "-b" );
legend('S', 'I', 'R')
xlabel('Time')
ylabel('Population')
