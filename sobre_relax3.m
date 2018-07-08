function [x,iter,reler]=sobre_relax3(A,b,niter_max,tol_esp,omega,x0)
% alocação de memoria
n=length(A);
x=zeros(n,1);
xold=zeros(n,1);
deltax=zeros(n,1);
% Inicialização das variáveis
switch nargin
    case 5
        for i=1:n
	       x(i)=b(i)/A(i,i);
	       xold(i)=x(i);
        end
    case 6
        for i=1:n
           x(i)=x0(i);
           xold(i)=x(i);
        end
    otherwise
        error('Número de argumentos inválido !!!');
end
iter=0;
reler=inf;
% Laço do processo iterativo
while((reler>tol_esp) && (iter+1 <= niter_max))
    for i=1:n
        dum=0.0;
        for j=1:(i-1)
            dum=dum+A(i,j)*x(j);
        end
        for j=(i+1):n
            dum=dum+A(i,j)*xold(j);
        end
        x(i)=omega*(b(i)-dum)/A(i,i)+(1-omega)*xold(i);
    end
    iter=iter+1;
    for i=1:n
        deltax(i)=x(i)-xold(i);
    end
    reler=norm(deltax,inf)/norm(x,inf);
    for i=1:n
        xold(i)=x(i);
    end
    fprintf(' %4d',iter)
    for i=1:n
        fprintf(' %10.4f',x(i));
    end
    fprintf('   %10.4\n',reler);
end