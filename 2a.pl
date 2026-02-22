combine([], B, B).
combine([H | T], B, [H | TRes]) :-
	combine(T, B, TRes).

belarusian_roulette([], []).
belarusian_roulette([X], [X]).
belarusian_roulette([X, Y], [X, Y]).
belarusian_roulette([X, Y, _ | Tail], Res) :-
	belarusian_roulette(Tail, BR_Tail),
	combine([X, Y], BR_Tail, Res).	

% test: ?- belarusian_roulette([1,2,3,4,5,6,7], Res)
% test: ?- belarusian_roulette([4, g, 66, efx, 78, 3, rr, 209, z, xui], Res)