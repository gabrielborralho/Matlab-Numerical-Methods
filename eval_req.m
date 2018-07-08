function Req=eval_req(Lg,Ug,k,m)
% Obt�m o n�mero de n�s de um circuito
n=length(Lg);
% Aloca��o de mem�ria para o vetor ekm
ekm=zeros(n,1);
% Defini��o do vetor ekm
if (k>0) && (m==0)
    ekm(k)=1;
    % Solu��o do sistema linear LUx = ekm
    x=Ug\(Lg\ekm);
    % C�lculo de resist�ncia equivalente
    Req=x(k);
end
if (k==0) && (m>0)
    ekm(m)=1;
    % Solu��o do sistema linear LUx = ekm
    x=Ug\(Lg\ekm);
    % C�lculo de resist�ncia equivalente
    Req=x(m);
end
if (k>0) && (m>0)
    ekm(k)=1;
    ekm(m)=-1;
    % Solu��o do sistema linear LUx = ekm
    x=Ug\(Lg\ekm);
    % C�lculo de resist�ncia equivalente
    Req=x(k)-x(m);
end