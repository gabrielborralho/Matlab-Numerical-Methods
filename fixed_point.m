function [x]=fixed_point(myfun,myphi,x0,niter_max,toler)
% Usando a linguagem de programa��o do MATLAB, implemente uma fun��o, 
% denominada fixed_point, para obter a raiz de uma equa��o f(x)=0 usando o
% m�todo do ponto fixo. Os dados de entrada da fun��o s�o:
%  1 - Fun��o myfun: fun��o f(x) definida pelo usu�rio;
%  2 - Fun��o myphi: fun��o de itera��o definida pelo usu�rio;
%  3 - x0: estimativa inicial da solu��o 
%  4 - niter_max: n�mero m�ximo de itera��es
%  5 - toler: toler�ncia para converg�ncia
% ** A unica variavel de saida da fun��o � a solu��o estimada xbar;
% ** Considere que o m�todo do ponto fixo converge para uma solu��o quando 
% |f(x)|<toler
% ** Al�m disso, considere que o programa ser� testado inicialmente para obter
% uma raiz da equa��o x^3-9x+3=0 com phi(x)=(x^3/9)+(1/3)
%========================================================
%C�lculo do zero de uma fun��o usando o m�todo do ponto fixo
%Dados de entrada/sa�da:
%myfun...............Fun��o definida pelo usu�rio para qual um valor nulo
%ser� calculado (f(x))
%myphi...............Fun��o de itera��o definida pelo usu�rio associada
%com f(x) (phi(x))
%x0..................Estimativa inicial para a solu��o (ponto de partida)
%niter_max...........N�mero m�ximo de itera��es
%toler...............Toler�ncia para o crit�rio de parada
%x...................Solu��o estimada para a tolerancia especificada
%========================================================
%Assume que a solu��o � o valor inicial fornecido nos dados de entrada
x = x0;
%C�lculo do res�duo para a solu��o inicial
res_fun=abs(feval(myfun,x));
%Inicializa o contador de itera��es
iter=0;
%Impress�o do cabe�alho
fprintf('----X----------------X------------------\n');
fprintf('  k        x^(k)           |f(x^(k))|   \n');
fprintf('----X----------------X------------------\n');
%La�o de itera��es 
while((res_fun >= toler) && ((iter+1) <= niter_max))
    %Atualiza a solu��o usando a fun��o de itera��o
    x=feval(myphi,x);
    %Calcula o res�duo da fun��o para a solu��o atual
    res_fun = abs(feval(myfun,x));
    %Incrementa o contador de itera��es
    iter = iter + 1;
    %Impress�o dos resultados
    fprintf('%4d %16.8e %16.8e\n',iter,x,res_fun);
end