% Sugira melhorias na função gradientes para melhorar o desempenho
% computacional do método dos gradientes e implemente estas melhorias em
% uma função denominada gradientes_opt.
function [v,iter,reler,res_ninf]=gradientes_opt(A,b,niter_max,tol_esp,x0)
n=length(A);v=zeros(n,1);
% Inicialização das variáveis
v=x0; vold=v; res=A*v-b; iter=0; reler=inf; res_ninf=norm(res,inf);
while((reler>tol_esp) && (res_ninf>tol_esp) && (iter+1<=niter_max))
    % Calculo do comprimento do passo
    Ar=A*res;
    tmin=dot(res,res)/dot(Ar,res);
    % Atualizações do vetor solução
    v=v-tmin*res;
    % Atualização do resíduo
    res=res-tmin*Ar;
    % Atualização do contador de iterações
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
    % Armazena a estimativa na última iteração
    vold=v;
end