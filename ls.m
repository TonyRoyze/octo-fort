w = 'F++F++F';
n = length(w)

a = ones(1, n)*pi/3;
x = zeros(1, n);
y = zeros(1, n);
a(1) = 0;
d = 1;
delta = pi/3;
fprintf('%-10s %-10s %-10s %-10s\n', 'Symbol', 'x', 'y', 'alpha');
fprintf('-----------------------------------------\n');


for i=1:n
    if w(i) == 'F'
        x(i+1) = x(i) + d*cos(a(i));
        y(i+1) = y(i) + d*sin(a(i));
        a(i+1) = a(i);
    elseif w(i) == '+'
        x(i+1) = x(i);
        y(i+1) = y(i);
        a(i+1) = a(i) + delta;
    elseif w(i) == '-'
        x(i+1) = x(i);
        y(i+1) = y(i);
        a(i+1) = a(i) - delta;
    end
    fprintf('%-10s %-10.5f %-10.5f %-10.2f\n', w(i), x(i), y(i), rad2deg(a(i)));
end

plot (x, y, '-r', 'LineWidth', 1.5);
grid on
title('L-System');
xlabel('X Coordinate');
ylabel('Y Coordinate');
