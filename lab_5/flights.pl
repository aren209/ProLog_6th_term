% Аэропорты: a, b, c, d, e, f, g, h, i, j (N = 10)
%dist(a, b, 15). dist(a, c, 28). dist(a, d, 12). dist(a, e, 35). dist(a, f, 19). dist(a, g, 42). dist(a, h, 21). dist(a, i, 33). dist(a, j, 18).
%dist(b, c, 22). dist(b, d, 14). dist(b, e, 29). dist(b, f, 38). dist(b, g, 17). dist(b, h, 25). dist(b, i, 41). dist(b, j, 30).
%dist(c, d, 31). dist(c, e, 16). dist(c, f, 24). dist(c, g, 39). dist(c, h, 11). dist(c, i, 27). dist(c, j, 45).
%dist(d, e, 20). dist(d, f, 34). dist(d, g, 13). dist(d, h, 40). dist(d, i, 23). dist(d, j, 36).
%dist(e, f, 26). dist(e, g, 37). dist(e, h, 19). dist(e, i, 44). dist(e, j, 15).
%dist(f, g, 21). dist(f, h, 32). dist(f, i, 18). dist(f, j, 29).
%dist(g, h, 43). dist(g, i, 16). dist(g, j, 35).
%dist(h, i, 38). dist(h, j, 22).
%dist(i, j, 14).

% Аэропорты: a, b, c, d, e, f, g (N = 7)
dist(a, b, 14). dist(a, c, 22). dist(a, d, 18). dist(a, e, 31). dist(a, f, 10). dist(a, g, 25).
dist(b, c, 12). dist(b, d, 28). dist(b, e, 17). dist(b, f, 34). dist(b, g, 19).
dist(c, d, 15). dist(c, e, 24). dist(c, f, 29). dist(c, g, 11).
dist(d, e, 16). dist(d, f, 21). dist(d, g, 33).
dist(e, f, 13). dist(e, g, 20).
dist(f, g, 27).

% Аэропорты: a, b, c, d (N = 4)
%dist(a, b, 14). dist(a, c, 15). dist(a, d, 20).
%dist(b, c, 13). dist(b, d, 22).
%dist(c, d, 18).

edge(X, Y, D) :- dist(X, Y, D).
edge(X, Y, D) :- dist(Y, X, D).

airport(A) :- edge(A, _, _).
airport_count(N) :-
    setof(A, airport(A), AirportList),
    length(AirportList, N).

% fly(Current, Visited, Path, Distance)
fly(_, Visited, Path, 0) :-
	airport_count(N),
    length(Visited, N),
    reverse(Visited, Path).
fly(X, Visited, Path, TotalDist) :-
    edge(X, Y, D),
    \+ member(Y, Visited),
	fly(Y, [Y | Visited], Path, RestDist),
    TotalDist is RestDist + D.

% solve_path(Path, Dist)   
solve_path(Path, Dist) :-
    edge(Start, _, _),
    fly(Start, [Start], Path, Dist).

% answer(BestPath, ShortestDistace)
answer(PPath, DDist) :-
    setof(Dist-Path, solve_path(Path, Dist), [DDist-PPath | _]).
