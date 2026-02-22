combine([], B, B).
combine([H | T], B, [H | TRes]) :-
	combine(T, B, TRes).

brackets_off([],[]).
brackets_off([H | T], [H | BOT]) :-
	\+ is_list(H),
	brackets_off(T, BOT).
brackets_off([H | T], Res) :-
	is_list(H),
	brackets_off(H, BOH),
	brackets_off(T, BOT),
	combine(BOH, BOT, Res).

% test: ?- brackets_off([[a,b], [1,2,3], [c,d,[e,f]], [], [4]], X)
% использовался встроенный предикат is_list\1