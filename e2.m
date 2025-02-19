function E = Euler2(h, y0, tn)
f = @(x) 0.0318*x*(1-x/200) ;
Y = zeros(1, tn/h);
Y(1)= y0;
for j = 1:tn/h
    Y(j+1) = Y(j) + h*f(Y(j));
endfor
E = [Y'];
%plot(T,Y)
endfunction

P_t60 = Euler2(0.1, 3.9, 60);
