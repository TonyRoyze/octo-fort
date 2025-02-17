%spp3
A=[pi -e sqrt(2) -sqrt(3) sqrt(11);
pi^2 e -e^2 3/7 0;sqrt(5) -sqrt(6) 1 -sqrt(2) pi;
pi^3 e^2 -sqrt(7) 1/9 sqrt(2)];

n=size(A)(1,1);
m=size(A)(1,2);
for j=1:n-1 % j is the column number
for i=j+1:n %i is the row number
if A(i,j)~=0
%m=A(i,:)./A(j,j);
A(i,:)=A(i,:)-A(j,:)./A(j,j).*A(i,j);
endif
endfor
endfor

%back subbing
x=zeros(4,1);
x(n)=A(n,m)/A(n,n);
for i=n-1:-1:1
x(i)=(A(i,m)-A(i,i+1:n)*x(i+1:n))./A(i,i);
endfor
disp("Using GE ")
x
disp("Rounding the solution to 3 significant figures")
x=eval(mat2str(x, 3)) %Actual solution in 3-digit rounding arithmetic-

%--------------GE and three-digit rounding arithmetic---
B=[pi -e sqrt(2) -sqrt(3) sqrt(11);
pi^2 e -e^2 3/7 0;sqrt(5) -sqrt(6) 1 -sqrt(2) pi;
pi^3 e^2 -sqrt(7) 1/9 sqrt(2)];

B=eval(mat2str(B, 3));%roundingoff to 3 sig figures

for j=1:n-1 % j is the counter for column number
for i=j+1:n %i is the counter for row number
if B(i,j)~=0

B(i,:)=eval(mat2str(B(i,:)-eval(mat2str(eval(mat2str(B(j,:)./B(j,j),3)).*B(i,j),3)),3));
endif
endfor
endfor
%back subbing
y=zeros(4,1);
y(n)=eval(mat2str(B(n,m)/B(n,n),3));
for i=n-1:-1:1
y(i)=eval(mat2str((B(i,m)-eval(mat2str(B(i,i+1:n)*y(i+1:n),3)))./B(i,i),3));
endfor
disp("Using GE and three-digit rounding ")
y


%---GE with partial pivoting and three-digit rounding arithmetic---

B=[pi -e sqrt(2) -sqrt(3) sqrt(11);
pi^2 e -e^2 3/7 0;sqrt(5) -sqrt(6) 1 -sqrt(2) pi;
pi^3 e^2 -sqrt(7) 1/9 sqrt(2)];
C=zeros(1,m);
B=eval(mat2str(B, 3));%roundingoff to 3 sig figures

for i=1:m-1 %no of columns of A
[max_num,ir]=max(abs(B(i:n,i)));
irow=i+ir-1;
C=B(i,:);
B(i,:)=B(irow,:);
B(irow,:)=C;
endfor
B

for j=1:n-1 % j is the counter for column number
for i=j+1:n %i is the counter for row number
if B(i,j)~=0

B(i,:)=eval(mat2str(B(i,:)-eval(mat2str(eval(mat2str(B(j,:)./B(j,j),3)).*B(i,j),3)),3));
endif
endfor
endfor
%back subbing
z=zeros(4,1);
z(n)=eval(mat2str(B(n,m)/B(n,n),3));
for i=n-1:-1:1
z(i)=eval(mat2str((B(i,m)-eval(mat2str(B(i,i+1:n)*z(i+1:n),3)))./B(i,i),3));
endfor
disp("Using GE with partial pivoting and three-digit rounding arithmetic ")
z

%---GE with Scaled partial pivoting and three-digit rounding arithmetic---

B=[pi -e sqrt(2) -sqrt(3) sqrt(11);
pi^2 e -e^2 3/7 0;sqrt(5) -sqrt(6) 1 -sqrt(2) pi;
pi^3 e^2 -sqrt(7) 1/9 sqrt(2)];
[n,m]=size(B);
C=zeros(1,m);
B=eval(mat2str(B, 3));%roundingoff to 3 sig figures

for i=1:n
S(i)=max(abs(B(i,:)));
endfor

for j=1:m-1
L=zeros(1,n);
for k=j:n
L(k)=eval(mat2str(abs(B(k,j))/S(k),3));
endfor

[maxVal,maxInd]=max(L);
C=B(j,:);
B(j,:)=B(maxInd,:);
B(maxInd,:)=C;


%Elimination
for i=j+1:n %i is the counter for row number
if B(i,j)~=0
B(i,:)=eval(mat2str(B(i,:)-eval(mat2str(eval(mat2str(B(j,:)./B(j,j),3)).*B(i,j),3)),3));
endif
endfor
endfor

%back subbing
w=zeros(4,1);
w(n)=eval(mat2str(B(n,m)/B(n,n),3));
for i=n-1:-1:1
w(i)=eval(mat2str((B(i,m)-eval(mat2str(B(i,i+1:n)*w(i+1:n),3)))./B(i,i),3));
endfor
disp("Using GE with scaled partial pivoting and three-digit rounding ")
w
