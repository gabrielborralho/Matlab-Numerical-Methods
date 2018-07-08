% Função que faça o produto de uma matriz por um vetor 
% ENTRADA: matriz A e o vetor b
% SAÍDA: um vetor contendo o produto Axb
function x=mat_vet(A,b)
[ma,na]=size(A);
[mb,nb]=size(b);
if (nb==1) && (na==mb)
    x=zeros(ma,1);
    for i=1:ma
        dum=0.0;
        for j=1:na
            dum=dum+A(i,j)*b(j);
        end
        x(i)=dum;
    end
else
    error('As dimensões da matriz e do vetor devem ser compatíveis\n');
end