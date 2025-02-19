function E = Euler1(a, b, y0, M)
f = @(t, y) 0.5*(t-y);
h = (b-a)/M;
Y = zeros(1, M+1);
T = [a:h:b];
Y(1)= y0;
for j = 1:M
    Y(j+1) = Y(j) + h*f(T(j), Y(j));
endfor
E = [T' Y'];
endfunction

E = Euler1(0, 3, 1, 4)
