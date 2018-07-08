function Req=eval_req(Lg,Ug,k,m)
% Obtém o número de nós de um circuito
n=length(Lg);
% Alocação de memória para o vetor ekm
ekm=zeros(n,1);
% Definição do vetor ekm
if (k>0) && (m==0)
    ekm(k)=1;
    % Solução do sistema linear LUx = ekm
    x=Ug\(Lg\ekm);
    % Cálculo de resistência equivalente
    Req=x(k);
end
if (k==0) && (m>0)
    ekm(m)=1;
    % Solução do sistema linear LUx = ekm
    x=Ug\(Lg\ekm);
    % Cálculo de resistência equivalente
    Req=x(m);
end
if (k>0) && (m>0)
    ekm(k)=1;
    ekm(m)=-1;
    % Solução do sistema linear LUx = ekm
    x=Ug\(Lg\ekm);
    % Cálculo de resistência equivalente
    Req=x(k)-x(m);
end