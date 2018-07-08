% Implemente uma fun��o em MATLAB para resolver um sistema de equa��es
% lineares atrav�s do M�todo de Gauss-Jacobi. Os dados referentes a esta
% fun��o s�o:
% ENTRADA : a) A - Matriz de coeficientes
%           b) b - Vetor de termos independentes
%           c) niter_max - N�mero m�ximo de itera��es
%           d) tol_esp - 
%           e) x0 - Estimativa inicial para a solu��o
% SA�DA :
%           a) x - Solu��o obtida
%           b) iter - N�mero de itera��es realizado para obter a solu��o
%           c) reler - O erro relativo associado com a solu��o
% A fun��o implementada deve gerar automaticamente uma estimativa inicial
% para a solu��o do sistema se o �ltimo argumento n�o for oferecido pelo 
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
        error('N�mero de argumentos inv�lido ! ! !');
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