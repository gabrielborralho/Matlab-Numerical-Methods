% Implemente uma função em MATLAB para resolver um sistema de equações
% lineares através do Método de Gauss-Jacobi. Os dados referentes a esta
% função são:
% ENTRADA : a) A - Matriz de coeficientes
%           b) b - Vetor de termos independentes
%           c) niter_max - Número máximo de iterações
%           d) tol_esp - 
%           e) x0 - Estimativa inicial para a solução
% SAÍDA :
%           a) x - Solução obtida
%           b) iter - Número de iterações realizado para obter a solução
%           c) reler - O erro relativo associado com a solução
% A função implementada deve gerar automaticamente uma estimativa inicial
% para a solução do sistema se o último argumento não for oferecido pelo 
% usuario
function [x,iter,reler]=jacobi_conv(A,b,niter_max,tol_esp,x0)
n=length(A);
x=zeros(n,1);
xold=zeros(n,1);
deltax=zeros(n,1);
switch nargin
    case 4 
        for i=1:n
            x(i)=b(i)/A(i,i);
        end
        xold(i)=x(i);
    case 5
        for i=1:n
            x(i)=x0(i);
            xold(i)=x(i);
        end
    otherwise
        error('Número de argumentos inválido ! ! !');
end
iter=0;
while(1)
    for i=1:n
        dum=b(i);
        for j=1:n
            if j~=i
                dum=dum-A(i,j)*xold(j);
            end
        end
        x(i)=dum/A(i,i);
    end
    iter=iter+1;
    for i=1:n
        deltax(i)=x(i)-xold(i);
    end
    reler=norm(deltax,inf)/norm(x,inf);
    fprintf(' %4d',iter);
    for i=1:n
        fprintf(' %10.4f',x(i));
    end
    fprintf(' %14.8e\n',reler);
    if reler < tol_esp
        break;
    end
    if iter >= niter_max
        break;
    end
    for i=1:n
        xold(i)=x(i);
    end
end