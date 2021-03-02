one(X) :- random(X), format("~6f\n", [X]).
many(N) :- length(Y,N), maplist(one,Y).
main :- argument_value(1, Arg), number_atom(C, Arg), many(C).
:- initialization(main).


