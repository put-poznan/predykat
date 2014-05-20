in2sorted(X, [], [X]).
in2sorted(X, [In1,In2|Tin], Lout) :-
	In1 < X, X < In2, append([In1,X,In2],Tin,Lout).
in2sorted(X, [In1|Tin], [Hout|Tout]) :- Hout = In1,
	in2sorted(X, Tin, Tout).

