my_last([X], X).
my_last([_|T], X) :- my_last(T, X).

m2([X,_], X).
m2([_,B|T], X) :- m2([B|T], X).

kth([Hin|_], 1, Hin).
kth([_|Tin], K, OUT) :- KK is K - 1, kth(Tin, KK, OUT).

cl([], 0).
cl([_|Tin], COUNT) :- cl(Tin, INNER), COUNT is INNER + 1.

nolast([_], []).
nolast([Hin|Tin], [Hout|Tout]) :- Hin = Hout, nolast(Tin, Tout).

rev([X],[X]).
rev(IN, [Hout|Tout]) :- my_last(IN, Hout), nolast(IN, REVERSED),
	rev(REVERSED, Tout).

pal([]).
pal([_]).
pal([H|T]) :- my_last(T,H),!, nolast(T, CUT), pal(CUT).

pal2(X) :- rev(X,X).
%needs expanding
%flat(X, Y) :- is_list(X), flat(X, Y).
%flat(X, Y)
%
%expand(X, Y


flatt([], OUT, ACC) :- OUT = ACC,!.
flatt([Hin|Tin], OUT, ACC) :- is_list(Hin), flatt(Hin, FHEAD, []),
       append(ACC, FHEAD, A2), flatt(Tin, OUT, A2),!.
flatt([Hin|Tin], OUT, ACC) :- append(ACC, [Hin], A2), flatt(Tin, OUT, A2).

f2(X, [X]) :- \+ is_list(X).
f2([], []).
f2([H|T], OUT) :- f2(H, X), f2(T, Y), append(X, Y, OUT).

uniq([X], [X]).
uniq([A,B|T], OUT) :- A = B, uniq([B|T], OUT).
uniq([A,B|T], [Hout|Tout]) :- A\=B, Hout=A, uniq([B|T], Tout).

pack([], []).
pack([X|Xs], [Y|Ys]) :- transfer(X, Xs, Zs, Y), pack(Zs, Ys).

transfer(_, [],[],[]).
transfer(X, [H|T], T, [X]) :- X \= H.
transfer(X, [X|T], LEFT, [X|Tout]) :- transfer(X, T, LEFT, Tout).

recount([], []).
recount([Hin|Tin], [Hout|Tout]) :- cl(Hin, COUNT), my_last(Hin, ELEM),
	Hout = [COUNT,ELEM], recount(Tin,Tout).


recount2([], []).
recount2([Hin|Tin], [Hout|Tout]) :- cl(Hin, 1), my_last(Hin, ELEM),
	Hout = ELEM, recount2(Tin,Tout),!.

recount2([Hin|Tin], [Hout|Tout]) :- cl(Hin, COUNT), my_last(Hin, ELEM),
	Hout = [COUNT,ELEM], recount2(Tin,Tout).

gen_list(_, 0, []).
gen_list(X, COUNT, [X|Ys]) :- COUNT @> 0, CC is COUNT - 1, gen_list(X, CC, Ys),!.

expand_item([A,B], Y) :- gen_list(B, A, Y), !.
expand_item(X, [X]).

uncompress([], []).
uncompress([Hin|Tin], Y) :- expand_item(Hin, HU), uncompress(Tin, ACC),
	append(HU, ACC, Y).

%dupli([], []).
dupli([X], [X,X]).
dupli([Hin|Tin], [Hin,Hin|Tout]) :- dupli(Tin, Tout).











