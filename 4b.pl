beginner([], _).
beginner([H | T1], [H | T2]) :-
	beginner(T1, T2).

container(A, C) :-
	beginner(A, C), !.
container(B, [_ | C]) :-
	container(B, C).

% test: ?- container([1,2,3], [a,b,c,1,2,3,d])
% test: ?- container([1,2,3], [1,2,a,b,4,3])