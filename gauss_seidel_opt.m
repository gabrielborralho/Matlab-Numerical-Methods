% Implemente uma função em MATLAB, denominada gauss_seidel, para resolver
% um sistema de equações lineares pelo Método de Gauss-Seidel com os
% seguintes dados:
% ENTRADA:  a) A - Matriz dos coeficientes
%           b) b - vetor de termos independentes
%           c) niter_max - número máximo de iterações
%           d) tol_esp - tolerância
%           e) x0 - estimativa inicial para a solução
% SAÍDA:    a) x - Solução obtida
%           b) iter - Número de iterações realizado para obter a solução
%           c) reler - Erro relativo associado à solução
function [x,iter,reler]=gauss_seidel_opt(A,b,niter_max,tol_esp,x0)
% Solução de sistemas lineares via método de Gauss-Seidel
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
        error('Número de argumentos inválido ! ! !');
end
iter=0;
reler=inf;
while(((iter+1)<= niter_max) && (reler>=tol_esp))
    % Atualiza a solução
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
    % Incrementa o contador de iterações
    iter=iter+1;
    for i=1:n
        deltax(i)=x(i)-xold(i);
    end
    % Calcula o erro relativo
    reler=norm(deltax,inf)/norm(x,inf);
    % Armazena a última solução
    for i=1:n
        xold(i)=x(i);
    end
    % Impressão de resultados
    fprintf(' %4d',iter);
    for i=1:n
        fprintf(' %10.4f',x(i));
    end
    fprintf('  %14.8e\n',reler);
end