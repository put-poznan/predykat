get_step([A, B|_], STEP) :- STEP is B - A.

extract_all_with_step([], _, [], []) :- !.
extract_all_with_step([H|T], STEP, [H|RESULT], OTHER) :-
	get_step(H, STEP), extract_all_with_step(T, STEP, RESULT, OTHER), !.
extract_all_with_step([H|T], STEP, RESULT, [H|OTHER]) :-
	extract_all_with_step(T, STEP, RESULT, OTHER), !.


group([], []).
group([Hin|Tin], [Hout|Tout]) :- get_step(Hin, STEP),
	extract_all_with_step([Hin|Tin], STEP, Hout, Rest),
	group(Rest, Tout).
