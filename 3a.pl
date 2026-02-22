length_209([], 0).
length_209([_ | T], Num) :-
	length_209(T, TNum),
	Num is TNum + 1.

even_length(X) :-
	length_209(X, XNum),
	A is XNum mod 2,
	A == 0.	

% test: ?- even_length([5, g, gz5, ee])
% test: ?- even_length([5, g, gz5, ee, l])