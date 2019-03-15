function demo2_FOForth
%% This demo shows how to call FOForth to solve
%       min  f(X):= E(X)+trace(G'X),   s.t.  X'X=I.
% -----------------------------------------
%   Demo 2:  G = 0      (nonlinear eigvalue problem)
%     ------------------------------------------------------------
%     f(X) = E(X) := 0.5*trace(X'AX)+0.25*alpha*rho(X)'inv(A)*rho(X)
%          where    rho(X) = diag(X*X')
%     ------------------------------------------------------------
%% call solver
    function [funX, F] = fun(X, A,invA, alpha)
        AX = A*X;
        rhoX = sum(X.*X,2);
        Ainvrho = invA*rhoX;
        Fh = diag(alpha*Ainvrho)*X;
        F = AX+Fh;
        funX = 0.5*sum(sum(X.*AX)) + 0.25*alpha*dot(rhoX,Ainvrho);
    end

n = 200;  p = 10;
A = randn(n); A = 0.5*(A+A'); invA = pinv(A);   alpha = 1;
opts = [];  opts.info = 1;
opts.gtol = 1e-5;

G = zeros(n,p);
[X,~] = qr(randn(n,p),0);
tic;[~,Out] = FOForth(X,G,@fun,opts,A,invA, alpha);t=toc;

fprintf('\nFOForth: CPU(s): %.5f, fval: %.10f, kkt: %3.2e, xerr: %3.2e,  feaX: %3.2e, iter: %d\n', ...
    t,Out.fval, Out.kkt, Out.xerr, Out.feaX, Out.iter);
end