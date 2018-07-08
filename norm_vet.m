% Implemente uma fun��o no MATLAB denominada norm_vet, para calcular as 
% seguintes normas de um vetor: ||x||1, ||x||2, ||x||inf. Os dados de
% entrada do programa s�o:
% x -> Vetor cuja norma ser� calculada;
%   -> 1   -> Norma da soma dos m�dulos;
% p -> 2   -> Norma euclidiana;
%   -> Inf -> Norma de m�ximo m�dulo.
% onde p � uma vari�vel fornecida pelo usu�rio e indica a norma que ser� 
% calculada;
% O programa deve retornar apenas a norma especificada pelo usu�rio atrav�s
% da vari�vel p.
function dum=norm_vet(x,p)
n=length(x);
dum=0.0;
switch p
    case 1  %calcula ||x||1
        for i=1:n
            dum=dum+abs(x(i));
        end
    case 2  %calcula ||x||2
        for i=1:n
            dum=dum+x(i)^2;
        end
        dum=sqrt(dum);
    case inf %calcula ||x||inf
        for i=1:n
            aux=abs(x(i));
            if aux>dum
                dum=aux;
            end
        end
    otherwise %Mostra mensagem de erro para normas indefinidas
        error('Norma desconhecida');
end