function X = gseid(A,B,P,max1)
    N = length(B);
    X = zeros(1,N)
    for k = 1: max1
        for j =1:N
            if j==1
                X(1) = (B(1)-A(1,2:N)*P(2:N))/A(1,1);
            elseif j==N
                X(N) = (B(N) - A(N, 1:N-1)*(X(1:N-1))')/A(N,N);
            else
                X(j) = (B(j) - A(j,1:j-1)*X(1:j-1)' -A(j,j+1:N)*P(j+1:N))/A(j,j);
            endif
        endfor
    P = X';
    endfor
    X = X';
endfunction
