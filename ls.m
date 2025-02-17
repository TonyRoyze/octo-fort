%ls
w = 'FF[+FF][-FF]FF[+F][-F]F';
lenw = length(w);

x = zeros(1, lenw + 1);
y = zeros(1, lenw + 1);
a = ones(1, lenw + 1) * pi / 2;

turn_ang = 30 * pi / 180;
d = 1;
saves = [];
index = 1;
fprintf('%-10s %-10s %-10s %-10s\n', 'Symbol', 'x', 'y', 'alpha');
fprintf('-----------------------------------------\n');
fprintf('%-10s %-10.5f %-10.5f %-10.2f\n', 'None', x(1), y(1), rad2deg(a(1)));
for i = 1:lenw
  if w(i) == 'F'
    x(index + 1) = x(index) + d * cos(a(index));
    y(index + 1) = y(index) + d * sin(a(index));
    a(index + 1) = a(index);
    index = index + 1;
  elseif w(i) == '+'
    x(index + 1) = x(index);
    y(index + 1) = y(index);
    a(index + 1) = a(index) + turn_ang;
    index = index + 1;
  elseif w(i) == '-'
    x(index + 1) = x(index);
    y(index + 1) = y(index);
    a(index + 1) = a(index) - turn_ang;
    index = index + 1;
  elseif w(i) == '['
    saves = [saves; x(index), y(index), a(index)];
  elseif w(i) == ']'
    x(index + 1) = saves(end, 1);
    y(index + 1) = saves(end, 2);
    a(index + 1) = saves(end, 3);
    saves(end, :) = [];
    index = index + 1;
  end
  fprintf('%-10s %-10.5f %-10.5f %-10.2f\n', w(i), x(index), y(index), rad2deg(a(index)));
end

plot (x, y, '-r', 'LineWidth', 1.5);
grid on
title('L-System');
xlabel('X Coordinate');
ylabel('Y Coordinate');
