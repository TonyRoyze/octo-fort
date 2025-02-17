%gi
rankA = rank(A);
detA = det(A);

C = [A(1:2, 1:2)];
%rankC = rank(C);
D = inv(C);
G = [D(1,1) D(1,2) 0; D(2,1) D(2,2) 0; 0 0 0]


if A*G*A = A
    disp('G is the generalized inverse of A')
else
    disp('G is not the generalized inverse of A')
end

x = Gb;
disp('The solution of the equation Ax = b is:');
x
