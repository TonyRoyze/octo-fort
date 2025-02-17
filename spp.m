%spp
Aug = [A, b];

[n, m] = size(Aug);

S = max(abs(Aug(:,1:end-1)), [], 2);

for j = 1:m-2
    m = abs(Aug(:,j))./S;
    [~, rel_index] = max(m(j:n));
    rel_index = rel_index + j - 1;
    
    fprintf('Swapping row %i with %i.\n', j, rel_index);
    Aug([j, rel_index], :) = Aug([rel_index, j], :);
    
    for i = j+1:n
        if Aug(i, j) ~= 0
            r = Aug(i, j) / Aug(j, j);
            Aug(i, :) = Aug(i, :) - r * Aug(j, :)
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
