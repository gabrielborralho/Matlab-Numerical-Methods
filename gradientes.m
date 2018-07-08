% Implemente uma função em MATLAB, denominada gradientes, para obter a
% solução de um sistema linear usando o Método dos Gradientes com os
% seguintes dados:
%   ENTRADA: a) A - Matriz dos coeficientes
%            b) b - Vetor de termos independentes
%            c) niter_max - Número máximo de soluções
%            d) tol_esp
%            e) x0 - Estimativa inicial para a solução
%   SAÍDA: a) x - Solução obtida
%          b) iter - Número de iterações realizado para obter a solução
%          c) reler - Erro relativo associado com a solução
%          d) res_ninf - Norma infinita do vetor de resíduos
% Considere que a solução do sistema linear é obtida quando o erro
% relativo(reler) e a norma infinita do resíduo (res_ninf) forem menores
% que a tolerância especificada (tol_esp)
function [v,iter,reler,res_ninf]=gradientes(A,b,niter_max,tol_esp,x0)
n=length(A);
v=zeros(n,1);
% Inicialização das variáveis
v=x0; vold=v; res=A*v-b; iter=0; reler=inf; res_ninf=norm(res,inf);
while((reler>tol_esp) && (res_ninf>tol_esp) && (iter+1<=niter_max))
    % Calculo do comprimento do passo
    tmin=dot(res,res)/dot(A*res,res);
    % Atualização do vetor da solução
    v=v-tmin*res;
    % Atualização do resíduo
    res=res-tmin*A*res;
    % Atualização do contador iterações
    iter=iter+1;
    % Cálculo das normas dos resíduos e dos erros relativos
    reler=norm(v-vold,inf)/norm(v,inf);
    res_ninf=norm(res,inf);
    % Impressão dos resultados associados com a iteração k
    fprintf(' %4d',iter);
    for i=1:n
        fprintf(' %10.4f',v(i));
    end
    fprintf(' %16.4e',reler);
    fprintf(' %16.4e\n',res_ninf);
    % Armazena a estimativa da ultima iteração
    vold=v;
end