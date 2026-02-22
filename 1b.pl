% parent(child, parent)

parent(charlie, alice).
parent(diane, alice).
parent(charlie, bob).
parent(diane, bob).
parent(gregory, emily).
parent(harry, emily).
parent(gregory, fred).
parent(harry, fred).
parent(ian, diane).
parent(jack, diane).
parent(kevin, diane).
parent(ian, gregory).
parent(jack, gregory).
parent(kevin, gregory).
parent(michael, linda).
parent(norman, linda).
parent(michael, kevin).
parent(norman, kevin).
parent(oscar, fred).

% добавим информацию для проверки
parent(test_child, bob).
parent(test_child, linda).

woman(alice).
woman(diane).
woman(emily).
woman(linda).
man(bob).
man(charlie).
man(fred).
man(gregory).
man(harry).
man(ian).
man(jack).
man(kevin).
man(michael).
man(norman).
man(oscar).

kazanova(X) :-
	parent(Ch1, P1),
	parent(Ch1, X),
	X \= P1,
	parent(Ch2, P2),
	parent(Ch2, X),
	X \= P2,
	P1 \= P2,
	Ch1 \= Ch2.

% во избежании дублирования можно вызывать запрос "distinct()".
% test: ?- distinct(kazanova(X))
	