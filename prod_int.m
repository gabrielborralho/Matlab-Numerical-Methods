% Implemente a função produto interno
% ENTRADA: vetores x e y
% SAÍDA: uma variável contendo o produto interno <x,y>
function dum=prod_int(x,y)
[mx,nx]=size(x);
[my,ny]=size(y);
if ((nx==1) && (ny==1) && (mx==my)) || ((mx==1) && (my==1) && (nx==ny))
    n=max(mx,ny);
    dum=0.0;
    for i=1:n
        dum=dum+x(i)*y(i);
    end
else
    error('As dimensões dos vetores devem ser compatíveis\n');
end