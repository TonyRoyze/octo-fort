rankA = rank(A);
A_dag = inv(transpose(A)*A)*transpose(A);

A_pse = pinv(A);

C = [2 4 6; 2 0 2; 6 8 14];
D = [2 -2 1; -4 -8 -8];

[P, W, Q] = svd(C);
[U, S, V] = svd(D);

CTC_eig = eig(transpose(C)*C);
DTD_eig = eig(transpose(D)*D);

(* Properties
- $U$ and $V$ are unitary matrices since $UU^T = I$
- Diagonal elements of the diagonal matrix $\Sigma$ are the singular values of the matrix
- The sqaure roots of the eigand values of the matrix $AA^T$ are the singular values of the matrix
- Spectral Norm `norm(A, 2)` is the maximum of the singular values *)
