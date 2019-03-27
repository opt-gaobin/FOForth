# FOForth
A Matlab solver for optimization problems with orthogonality constraints.
## Problems
This solver is to solve the following problem,
> min h(X)+trace(G'X),
  s.t.  X'X=I,
  
  where X is n-by-p matrix, and h(X) is orthogonal invariant (h(XQ)=h(X) for any orthogonal matrix Q) and satisfies \nabla h(X)=H(X)X.
  
  

# References
+ Bin Gao, Xin Liu, Xiaojun Chen and Ya-xiang Yuan, [A New First-order Algorithmic Framework for Optimization Problems with Orthogonality Constraints](https://doi.org/10.1137/16M1098759), SIAM Journal on Optimization, 28-1(2018), 302–332. 

# Authors
+ [Bin Gao](https://www.gaobin.cc/) (AMSS, CAS, China)
+ [Xin Liu](http://lsec.cc.ac.cn/~liuxin/index.html) (AMSS, CAS, China)
# Copyright
Copyright (C) 2016, Bin Gao, Xin Liu

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/)
