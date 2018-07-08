% Implemente uma função no MATLAB denominada norm_vet, para calcular as 
% seguintes normas de um vetor: ||x||1, ||x||2, ||x||inf. Os dados de
% entrada do programa são:
% x -> Vetor cuja norma será calculada;
%   -> 1   -> Norma da soma dos módulos;
% p -> 2   -> Norma euclidiana;
%   -> Inf -> Norma de máximo módulo.
% onde p é uma variável fornecida pelo usuário e indica a norma que será 
% calculada;
% O programa deve retornar apenas a norma especificada pelo usuário através
% da variável p.
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