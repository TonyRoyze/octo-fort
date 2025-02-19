function X = jacobi(A,B,P,max1)
    N = length(B);
    X = zeros(1,N);
    for k = 1: max1
        for j =1:N
            X(j) = (B(j) - A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j);
        endfor
        % err = norm(X - P);
        % if (err < 0.0001)
        %     break;
        % endif
        P = X';
    endfor
    X = X';
endfunction

jacobi(A,b,[1;2;2],30)
