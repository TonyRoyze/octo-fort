function X = jacobi(A,B,P,max1)
    N = length(B);
    %X = zeros(1,N)
    for k = 1: max1
        for j =1:N
            X(j) = (B(j) - A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j)
        endfor
        P = X';
    endfor
    X = X';
endfunction
