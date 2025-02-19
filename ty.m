%ty
pkg load symbolic;
syms x;

f = sin(x);

T0S = taylor(f, x, 'ExpansionPoint', 0, 'Order', 1); 
T1S = taylor(f, x, 'ExpansionPoint', 0, 'Order', 2); 
T3S = taylor(f, x, 'ExpansionPoint', 0, 'Order', 4); 
T5S = taylor(f, x, 'ExpansionPoint', 0, 'Order', 6); 

% y = matlabFunction(T0, 'Vars', x)

figure;                   
fplot(f, [-pi, pi]);          
hold on;                           
% fplot(T0S, [-pi, pi]);
% fplot(matlabFunction(T0S), [-pi, pi]);
% fplot('0', [-pi, pi]);
fplot('x-x', [-pi, pi]);
% ezplot(@(x) 0, [-pi, pi]);
fplot(T1S, [-pi, pi]);         
fplot(T3S, [-pi, pi]);        
fplot(T5S, [-pi, pi]);         


xlabel('x');
ylabel('y');
title('Taylor Series Approximations of sin(x)');
legend('sin(x)', '1st-order', '2nd-order','4th-order','6th-order');
grid on;
