% Implemente uma fun��o em MATLAB, denominada gradientes, para obter a
% solu��o de um sistema linear usando o M�todo dos Gradientes com os
% seguintes dados:
%   ENTRADA: a) A - Matriz dos coeficientes
%            b) b - Vetor de termos independentes
%            c) niter_max - N�mero m�ximo de solu��es
%            d) tol_esp
%            e) x0 - Estimativa inicial para a solu��o
%   SA�DA: a) x - Solu��o obtida
%          b) iter - N�mero de itera��es realizado para obter a solu��o
%          c) reler - Erro relativo associado com a solu��o
%          d) res_ninf - Norma infinita do vetor de res�duos
% Considere que a solu��o do sistema linear � obtida quando o erro
% relativo(reler) e a norma infinita do res�duo (res_ninf) forem menores
% que a toler�ncia especificada (tol_esp)
function [v,iter,reler,res_ninf]=gradientes(A,b,niter_max,tol_esp,x0)
n=length(A);
v=zeros(n,1);
% Inicializa��o das vari�veis
v=x0; vold=v; res=A*v-b; iter=0; reler=inf; res_ninf=norm(res,inf);
while((reler>tol_esp) && (res_ninf>tol_esp) && (iter+1<=niter_max))
    % Calculo do comprimento do passo
    tmin=dot(res,res)/dot(A*res,res);
    % Atualiza��o do vetor da solu��o
    v=v-tmin*res;
    % Atualiza��o do res�duo
    res=res-tmin*A*res;
    % Atualiza��o do contador itera��es
    iter=iter+1;
    % C�lculo das normas dos res�duos e dos erros relativos
    reler=norm(v-vold,inf)/norm(v,inf);
    res_ninf=norm(res,inf);
    % Impress�o dos resultados associados com a itera��o k
    fprintf(' %4d',iter);
    for i=1:n
        fprintf(' %10.4f',v(i));
    end
    fprintf(' %16.4e',reler);
    fprintf(' %16.4e\n',res_ninf);
    % Armazena a estimativa da ultima itera��o
    vold=v;
end