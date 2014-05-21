aresame(pair(X,X)).
istree(nil).
istree(t(_,L,R)) :- istree(L), istree(R),!.

maxtree(nil, -99999).
%maxtree(t(V,nil,nil), V).
maxtree(t(V,L,R),Max) :- maxtree(L, Lmax), maxtree(R, Rmax), V > Lmax, V > Rmax, Max = V.
maxtree(t(V,L,R),Max) :- maxtree(L, Lmax), maxtree(R, Rmax), Rmax > V, Rmax > Lmax, Max = Rmax.
maxtree(t(V,L,R),Max) :- maxtree(L, Lmax), maxtree(R, Rmax), Lmax > V, Lmax > Rmax, Max = Lmax.

mintree(nil, 99999).
%maxtree(t(V,nil,nil), V).
mintree(t(V,L,R),Max) :- mintree(L, Lmax), mintree(R, Rmax), V < Lmax, V < Rmax, Max = V.
mintree(t(V,L,R),Max) :- mintree(L, Lmax), mintree(R, Rmax), Rmax < V, Rmax < Lmax, Max = Rmax.
mintree(t(V,L,R),Max) :- mintree(L, Lmax), mintree(R, Rmax), Lmax < V, Lmax < Rmax, Max = Lmax.




isbst(nil).
isbst(t(V,L,R)) :- maxtree(L, Lmax), mintree(R, Rmin), Lmax < V, V < Rmin,
	isbst(L),isbst(R).


