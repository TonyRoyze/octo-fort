%norm
X = [-1; 4; 2];

% norm(X, 1)
x_1_norm = sum(abs(X))

% norm(X, 2)
x_2_norm = sqrt(sum(X.^2))

% norm(X, inf)
x_infty_norm = max(abs(X))

% Matrix
A = [4 1 1; 0 -2 2; 0 5 -4];

% Norms of matrix
L1A = norm(A, 1);
L2A = norm(A, 2);
LfroA = norm(A, 'fro');
LinfA = norm(A, inf);

% Eigen Values
[V, D] = eig(A);
