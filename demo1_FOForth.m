function demo1_FOForth
%% This demo shows how to call FOForth to solve
%       min  f(X):= E(X)+trace(G'X),   s.t.  X'X=I.
% -----------------------------------------
%   Demo 1:  G~=0
%     ---------------------------------
%      f(X):= 0.5*trace(X'AX)+trace(G'X)
%     ---------------------------------
%% call solver
    function [funX, F] = fun(X,A,G)
        F = A*X+G;
        funX = 0.5*sum(sum(X.*(F+G)));
    end

n = 3000;  p = 60;
A = randn(n); A = 0.5*(A+A');
G = randn(n,p);
normG = norm(G,'fro');
A = A/normG; G = G/normG;
opts = [];  opts.info = 1;
opts.gtol = 1e-5;

[X,~] = qr(randn(n,p),0);
tic;[~,Out] = FOForth(X,G,@fun,opts,A,G);t=toc;

fprintf('\nFOForth: CPU(s): %.5f, fval: %.10f, kkt: %3.2e, xerr: %3.2e,  feaX: %3.2e, iter: %d\n', ...
    t,Out.fval, Out.kkt, Out.xerr, Out.feaX, Out.iter);
end
