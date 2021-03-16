function [L,U]=LU_Cholesky(A)

[n,m]=size(A);
L=zeros(n,n);

for k=1:n
    L(k,k)=sqrt(A(k,k)-L(k,1:k-1)*L(k,1:k-1)');
    for i=k+1:n
        L(i,k)=(A(i,k)-L(i,1:k-1)*L(k,1:k-1)')/L(k,k);
    end
end
U=L';