%subp
u_values = [0.8, 0.6, 0.5, 0.4, 0.2];
colors = ['r', 'g', 'b', 'm', 'k']; 


figure;
for i = 1:length(u_values)
    u = u_values(i);
    [t, solution] = ode45(@(t, x) seir_eqn(t, x, u), tspan, x0);
    

    subplot(2, 1, 1); 
    hold on;
    plot(t, solution(:, 3), colors(i));
    xlabel('Time');
    ylabel('Infected Population I1');
    title('Patch 1');
    legend('0.8', '0.6', '0.5', '0.4', '0.2')
    grid on;

    subplot(2, 1, 2); 
    hold on;
    plot(t, solution(:, 7), colors(i));
    xlabel('Time');
    ylabel('Infected Population I2');
    title('Patch 2');
    legend('0.8', '0.6', '0.5', '0.4', '0.2')
    grid on;
end

hold off;
