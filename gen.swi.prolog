one(X) :- random(X), format("~6f\n", [X]).
many(N) :- length(Y,N), maplist(one,Y).
main :- current_prolog_flag(argv, [Arg1|_]), atom_number(Arg1, C), many(C), halt.
:- initialization(main).
