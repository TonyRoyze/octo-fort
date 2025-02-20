pkg load symbolic;
syms x;

f = sin(x);

T5S = taylor(f, x, 'ExpansionPoint', 0, 'Order', 6); 

% y = matlabFunction(T0, 'Vars', x)

figure;                   
fplot(matlabFunction(f), [-pi, pi]);          
hold on;                                 
fplot(matlabFunction(T5S), [-pi, pi]);         


xlabel('x');
ylabel('y');
title('Taylor Series Approximations');
legend('sin(x)','6th-order');
grid on;
