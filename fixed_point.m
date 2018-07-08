function [x]=fixed_point(myfun,myphi,x0,niter_max,toler)
% Usando a linguagem de programação do MATLAB, implemente uma função, 
% denominada fixed_point, para obter a raiz de uma equação f(x)=0 usando o
% método do ponto fixo. Os dados de entrada da função são:
%  1 - Função myfun: função f(x) definida pelo usuário;
%  2 - Função myphi: função de iteração definida pelo usuário;
%  3 - x0: estimativa inicial da solução 
%  4 - niter_max: número máximo de iterações
%  5 - toler: tolerância para convergência
% ** A unica variavel de saida da função é a solução estimada xbar;
% ** Considere que o método do ponto fixo converge para uma solução quando 
% |f(x)|<toler
% ** Além disso, considere que o programa será testado inicialmente para obter
% uma raiz da equação x^3-9x+3=0 com phi(x)=(x^3/9)+(1/3)
%========================================================
%Cálculo do zero de uma função usando o método do ponto fixo
%Dados de entrada/saída:
%myfun...............Função definida pelo usuário para qual um valor nulo
%será calculado (f(x))
%myphi...............Função de iteração definida pelo usuário associada
%com f(x) (phi(x))
%x0..................Estimativa inicial para a solução (ponto de partida)
%niter_max...........Número máximo de iterações
%toler...............Tolerância para o critério de parada
%x...................Solução estimada para a tolerancia especificada
%========================================================
%Assume que a solução é o valor inicial fornecido nos dados de entrada
x = x0;
%Cálculo do resíduo para a solução inicial
res_fun=abs(feval(myfun,x));
%Inicializa o contador de iterações
iter=0;
%Impressão do cabeçalho
fprintf('----X----------------X------------------\n');
fprintf('  k        x^(k)           |f(x^(k))|   \n');
fprintf('----X----------------X------------------\n');
%Laço de iterações 
while((res_fun >= toler) && ((iter+1) <= niter_max))
    %Atualiza a solução usando a função de iteração
    x=feval(myphi,x);
    %Calcula o resíduo da função para a solução atual
    res_fun = abs(feval(myfun,x));
    %Incrementa o contador de iterações
    iter = iter + 1;
    %Impressão dos resultados
    fprintf('%4d %16.8e %16.8e\n',iter,x,res_fun);
end