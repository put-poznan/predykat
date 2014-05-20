in2sorted(X, [], [X]).
in2sorted(X, [In2|Tin], Lout) :-
	 X < In2, append([X,In2],Tin,Lout).
in2sorted(X, [In1|Tin], [Hout|Tout]) :- Hout = In1,
	in2sorted(X, Tin, Tout).

