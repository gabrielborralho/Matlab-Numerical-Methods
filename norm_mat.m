% Implemente uma fun��o denominada norma_mat, usando a linguagem de
% programa��o do MATLAB, para calcular as seguintes normas matriciais: 
% ||A||1 , ||A||2, ||A||inf, ||A||F. Os dados de entrada dessa fun��o s�o:
% 1 - Matriz A;
% 2 - p: vari�vel que indica a norma da matriz que ser� calculada de acordo
% com a seguinte conven��o:
%           p=1 -> Norma da soma de colunas;
%           p=2 -> Norma euclidiana;
%           p=inf -> Norma da soma de linhas;
%           p='fro' -> Norma de Frobenius
function dum=norm_mat(A,p)
n=length(A);
if ischar(p)
    if strcmp(p,'fro')
        dum=0;
        for i=1:n
            for j=1:n
                dum=dum+A(i,j)^2;
            end
        end
        dum=sqrt(dum);
    else
        error('Norma indefinida !!!');
    end
else
    switch p
        case 1
            dum=0;
            for j=1:n
                sum_col=sum(abs(A(:,j)));
                if sum_col>dum
                    dum=sum_col;
                end
            end
        case 2 
            dum=sqrt(max(eigs(A'*A)));
        case inf
            dum=0;
            for i=1:n
                sum_row=sum(abs(A(i,:)));
                if sum_row>dum
                    dum=sum_row;
                end
            end
        otherwise
            error('Norma indefinida !!!');
    end
end