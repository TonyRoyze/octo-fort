%spp
Aug = [A, b]

[nRows, nCols] = size(Aug);
S = max(abs(Aug(:,1:end-1)), [], 2);


for j = 1:nCols-2
    m = abs(Aug(:,j))./S;
    [maximum, rel_index] = max(abs(m(j:nRows)));
    fprintf('Maximum of column %i is %i.\n', j , maximum);
    if j ~= rel_index+j-1
        fprintf('Swapping row %i with %i.\n', j, rel_index+j-1);
        Aug([j, rel_index+j-1], :) = Aug([rel_index+j-1, j], :);
    end

    for i = j+1:nRows
        if Aug(i, j) ~= 0 
            r = Aug(i, j) / Aug(j, j); 
            Aug(i, :) -= r * Aug(j, :);
        end
    end 
end

U = Aug(:, 1:end-1);
b = Aug(:, end);

x = zeros(nRows, 1);

for i = nRows:-1:1
    x(i) = (b(i) - U(i, i+1:end) * x(i+1:end)) / U(i, i);
end

fprintf('The solution vector is:\n');
disp(x);
