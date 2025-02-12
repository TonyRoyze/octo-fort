Aug = [A, b']

[n, m] = size(Aug);

for j = 1:m-2
    [maximum, rel_index] = max(abs(Aug(j:n,j)));
    printf('Maximum of column %i is %i.\n', j , maximum);
    if j ~= rel_index+j-1
        printf('Swapping row %i with %i.\n', j, rel_index+j-1);
        Aug([j, rel_index+j-1], :) = Aug([rel_index+j-1, j], :)
    end

    for i = j+1:n
        if Aug(i, j) ~= 0 
            r = Aug(i, j) / Aug(j, j); 
            Aug(i, :) -= r * Aug(j, :)
        end
    end

end

x = zeros(n,1);
x(n) = Aug(n,m)/Aug(n,n);

for i = n-1:-1:1
    if Aug(i,i) = 0
        disp('Matrix is singular');
    end
    x(i) = (Aug(i,m) - Aug(i, i+1:end)*x(i+1:end))/Aug(i,i);
end
fprintf('The solution vector is:\n');
x
