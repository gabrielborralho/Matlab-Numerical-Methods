function [xref,iter,ninf_xcor]=ref_iter(A,L,U,P,b,niter_max,tol_esp)
iter=0;
ninf_xcor=inf;
xref=U\(L\(P*b));
while((ninf_xcor>tol_esp) && ((iter+1)<=niter_max))
    res=b-A*xref;
    xcor=U\(L\(P*res));
    xref=xref+xcor;
    ninf_xcor=norm(xcor,inf);
    iter=iter+1;
    fprintf('%4d ',iter);
    fprintf('%12.4e',ninf_xcor);
    for i=1:length(b)
        fprintf('%12.4e',xcor(i));
    end
    fprintf('\n');
end