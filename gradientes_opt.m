% Sugira melhorias na fun��o gradientes para melhorar o desempenho
% computacional do m�todo dos gradientes e implemente estas melhorias em
% uma fun��o denominada gradientes_opt.
function [v,iter,reler,res_ninf]=gradientes_opt(A,b,niter_max,tol_esp,x0)
n=length(A);v=zeros(n,1);
% Inicializa��o das vari�veis
v=x0; vold=v; res=A*v-b; iter=0; reler=inf; res_ninf=norm(res,inf);
while((reler>tol_esp) && (res_ninf>tol_esp) && (iter+1<=niter_max))
    % Calculo do comprimento do passo
    Ar=A*res;
    tmin=dot(res,res)/dot(Ar,res);
    % Atualiza��es do vetor solu��o
    v=v-tmin*res;
    % Atualiza��o do res�duo
    res=res-tmin*Ar;
    % Atualiza��o do contador de itera��es
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
    % Armazena a estimativa na �ltima itera��o
    vold=v;
end