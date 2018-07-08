% O m�todo da secante se baseia em uma aproxima��o do M�todo de
% Newton-Raphson para obter a solu��o de uma equa��o n�o-linear univariada 
% de acordo com a seguinte equa��o:
%                      f(x[i])(x[i-1]-x[i])
%        x[i+1]=x[i]- -----------------------
%                      f(x[i-1])-f(x[i])
% onde x[i+1], x[i] e x[i-1] s�o aproxima��es associadas �s itera��es
% i+1,i,i-1 para a solu��o x' da equa��o f(x)=0.
% Implemente uma fun��o usando a linguagem de programa��o do MATLAB,
% denominada secante, para obter uma raiz de uma equa��o n�o-linear f(x)=0
% usando o M�todo Secante. Os dados de entrada/sa�da desta fun��o s�o
% definidos abaixo:
% a) entrada
%      myfun: fun��o f(x) definida pelo usuario;
%      x0,x1: aproxima��es x0 e x1 associadas com a solu��o procurada x';
%      toler: tolerancia eps usada no teste de converg�ncia |f(x)|<eps
%      niter_max: numero m�ximo de itera��es
% b) sa�da
%      xsol: solu��o estimada
%
% Implementa��o do m�todo da secante para a solu��o de equa��es
% n�o-lineares multivariadas
function x2=secante2(myfun,x0,x1,toler,niter_max)
iter=0;
res_fun=inf;
fprintf('--------X----------------X---------------\n');
fprintf('Itera��o     Solu��o         Res�duo     \n');
fprintf('--------X----------------X---------------\n');
while((res_fun>=toler) && ((iter+1)<=niter_max))
    % Calculo da nova estimativa da solu��o com base nas duas aproxima��es
    % dispon�veis
    fun_x1=feval(myfun,x1);
    fun_x0=feval(myfun,x0);
    x2=x1-fun_x1*(x0-x1)/(fun_x0-fun_x1);
    
    % Calcula o residuo da fun��o com a nova estimativa da solu��o
    res_fun=abs(feval(myfun,x2));
    
    % Atualiza o contador de itera��es
    iter=iter+1;
    
    % Impress�o dos resultados
    fprintf('%8d %16.8e %16.8e\n',iter,x2,res_fun);
    
    % Armazena as duas aproxima��es para a proxima itera��o
    x0=x1;
    x1=x2;
end
if iter ==niter_max
    display('Fun��o secante alcan�ou o n�mero m�ximo de itera��es');
end