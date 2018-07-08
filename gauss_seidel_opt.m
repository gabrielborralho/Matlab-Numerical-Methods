% Implemente uma fun��o em MATLAB, denominada gauss_seidel, para resolver
% um sistema de equa��es lineares pelo M�todo de Gauss-Seidel com os
% seguintes dados:
% ENTRADA:  a) A - Matriz dos coeficientes
%           b) b - vetor de termos independentes
%           c) niter_max - n�mero m�ximo de itera��es
%           d) tol_esp - toler�ncia
%           e) x0 - estimativa inicial para a solu��o
% SA�DA:    a) x - Solu��o obtida
%           b) iter - N�mero de itera��es realizado para obter a solu��o
%           c) reler - Erro relativo associado � solu��o
function [x,iter,reler]=gauss_seidel_opt(A,b,niter_max,tol_esp,x0)
% Solu��o de sistemas lineares via m�todo de Gauss-Seidel
n=length(A);
x=zeros(n,1);
xold=zeros(n,1);
deltax=zeros(n,1);
switch nargin
    case 4
        for i=1:n
            x(i)=b(i)/A(i,i);
            xold(i)=x(i);
        end
    case 5
        for i=1:n
            x(i)=x0(i);
            xold(i)=x(i);
        end
    otherwise
        error('N�mero de argumentos inv�lido ! ! !');
end
iter=0;
reler=inf;
while(((iter+1)<= niter_max) && (reler>=tol_esp))
    % Atualiza a solu��o
    for i=1:n
        dum=b(i);
        for j=1:(i-1)
            dum=dum-A(i,j)*x(j);
        end
        for j=(i+1):n
            dum=dum-A(i,j)*xold(j);
        end
        x(i)=dum/A(i,i);
    end
    % Incrementa o contador de itera��es
    iter=iter+1;
    for i=1:n
        deltax(i)=x(i)-xold(i);
    end
    % Calcula o erro relativo
    reler=norm(deltax,inf)/norm(x,inf);
    % Armazena a �ltima solu��o
    for i=1:n
        xold(i)=x(i);
    end
    % Impress�o de resultados
    fprintf(' %4d',iter);
    for i=1:n
        fprintf(' %10.4f',x(i));
    end
    fprintf('  %14.8e\n',reler);
end