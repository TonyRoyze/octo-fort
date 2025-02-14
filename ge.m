Aug = [A, b]
[n, m] =  size(Aug);
% Gaussian Elimination
for j = 1:m-2
    if Aug(j,j) = 0
        swapRow = find(Aug(j+1:n, j) ~= 0, 1) + j;
        if isempty(swapRow)
            disp('Matrix is singular');
        else
            Aug([j, swapRow], :) = Aug([swapRow, j], :);
        end
    end
    for i = j+1:n
        if Aug(i,j) ~= 0
            % Aug(j,j) give the diagonal elements
            r = Aug(i,j)/Aug(j,j);
            Aug(i,:) = Aug(i,:) - r*Aug(j,:);
        end
    end
end

x = zeros(n,1);
x(n) = Aug(n,m)/Aug(n,n);

for i = n-1:-1:1
    if Aug(i,i) = 0
        disp('Matrix is singular');
    end
    x(i) = (Aug(i,m) - Aug(i, i+1:n)*x(i+1:n))/Aug(i,i);
end
x
