% O método da secante se baseia em uma aproximação do Método de
% Newton-Raphson para obter a solução de uma equação não-linear univariada 
% de acordo com a seguinte equação:
%                      f(x[i])(x[i-1]-x[i])
%        x[i+1]=x[i]- -----------------------
%                      f(x[i-1])-f(x[i])
% onde x[i+1], x[i] e x[i-1] são aproximações associadas às iterações
% i+1,i,i-1 para a solução x' da equação f(x)=0.
% Implemente uma função usando a linguagem de programação do MATLAB,
% denominada secante, para obter uma raiz de uma equação não-linear f(x)=0
% usando o Método Secante. Os dados de entrada/saída desta função são
% definidos abaixo:
% a) entrada
%      myfun: função f(x) definida pelo usuario;
%      x0,x1: aproximações x0 e x1 associadas com a solução procurada x';
%      toler: tolerancia eps usada no teste de convergência |f(x)|<eps
%      niter_max: numero máximo de iterações
% b) saída
%      xsol: solução estimada
%
% Implementação do método da secante para a solução de equações
% não-lineares multivariadas
function x2=secante2(myfun,x0,x1,toler,niter_max)
iter=0;
res_fun=inf;
fprintf('--------X----------------X---------------\n');
fprintf('Iteração     Solução         Resíduo     \n');
fprintf('--------X----------------X---------------\n');
while((res_fun>=toler) && ((iter+1)<=niter_max))
    % Calculo da nova estimativa da solução com base nas duas aproximações
    % disponíveis
    fun_x1=feval(myfun,x1);
    fun_x0=feval(myfun,x0);
    x2=x1-fun_x1*(x0-x1)/(fun_x0-fun_x1);
    
    % Calcula o residuo da função com a nova estimativa da solução
    res_fun=abs(feval(myfun,x2));
    
    % Atualiza o contador de iterações
    iter=iter+1;
    
    % Impressão dos resultados
    fprintf('%8d %16.8e %16.8e\n',iter,x2,res_fun);
    
    % Armazena as duas aproximações para a proxima iteração
    x0=x1;
    x1=x2;
end
if iter ==niter_max
    display('Função secante alcançou o número máximo de iterações');
end