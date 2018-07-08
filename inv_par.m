function V=inv_par(A,list_col)
[L,U]=lu(A);
n=length(A);
num_col=length(list_col);
e=zeros(n,1);
V=zeros(n,num_col);
for ipos=1:num_col
    icol=list_col(ipos);
    e(icol)=1.0;
    V(:,ipos)=U\(L\e);
    e(icol)=0.0;
end