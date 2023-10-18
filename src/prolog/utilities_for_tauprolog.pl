predsort(P, L, R) :-
	length(L, N),
	predsort(P, N, L, _, R1), !,
	R = R1.

predsort(P, 2, [X1, X2|L], L, R) :- !,
	call(P, Delta, X1, X2),
	sort2(Delta, X1, X2, R).
predsort(_, 1, [X|L], L, [X]) :- !.
predsort(_, 0, L, L, []) :- !.
predsort(P, N, L1, L3, R) :-
	N1 is N // 2,
	plus(N1, N2, N),
	predsort(P, N1, L1, L2, R1),
	predsort(P, N2, L2, L3, R2),
	predmerge(P, R1, R2, R).

sort2(<, X1, X2, [X1, X2]).
sort2(=, X1, _,  [X1]).
sort2(>, X1, X2, [X2, X1]).

predmerge(_, [], R, R) :- !.
predmerge(_, R, [], R) :- !.
predmerge(P, [H1|T1], [H2|T2], Result) :-
	call(P, Delta, H1, H2),
	predmerge(Delta, P, H1, H2, T1, T2, Result).

predmerge(>, P, H1, H2, T1, T2, [H2|R]) :-
	predmerge(P, [H1|T1], T2, R).
predmerge(=, P, H1, _, T1, T2, [H1|R]) :-
	predmerge(P, T1, T2, R).
predmerge(<, P, H1, H2, T1, T2, [H1|R]) :-
	predmerge(P, T1, [H2|T2], R).

append(ListOfLists, List) :-
%	must_be(list, ListOfLists),
	append_(ListOfLists, List).

append_([], []).
append_([L|Ls], As) :-
	append(L, Ws, As),
	append_(Ls, Ws).


delete([], _, []).
delete([Head|List], Elem, Residue) :-
	Head == Elem, !,
	delete(List, Elem, Residue).
delete([Head|List], Elem, [Head|Residue]) :-
	delete(List, Elem, Residue).


last([H|List], Last) :-
	last(List, H, Last).

last([], Last, Last).
last([H|List], _, Last) :-
	last(List, H, Last).

nextto(X,Y, [X,Y|_]).
nextto(X,Y, [_|List]) :-
	nextto(X,Y, List).

nth0(V, In, Element) :- var(V), !,
	generate_nth(0, V, In, Element).
nth0(0, [Head|_], Head) :- !.
nth0(N, [_|Tail], Elem) :-
	M is N-1,
	find_nth0(M, Tail, Elem).

find_nth0(0, [Head|_], Head) :- !.
find_nth0(N, [_|Tail], Elem) :-
	M is N-1,
	find_nth0(M, Tail, Elem).


nth1(V, In, Element) :- var(V), !,
	generate_nth(1, V, In, Element).
nth1(1, [Head|_], Head) :- !.
nth1(N, [_|Tail], Elem) :-
	nonvar(N), !,
	M is N-1,			% should be succ(M, N)
	find_nth(M, Tail, Elem).

nth(V, In, Element) :- var(V), !,
	generate_nth(1, V, In, Element).
nth(1, [Head|_], Head) :- !.
nth(N, [_|Tail], Elem) :-
	nonvar(N), !,
	M is N-1,			% should be succ(M, N)
	find_nth(M, Tail, Elem).

find_nth(1, [Head|_], Head) :- !.
find_nth(N, [_|Tail], Elem) :-
	M is N-1,
	find_nth(M, Tail, Elem).


generate_nth(I, I, [Head|_], Head).
generate_nth(I, IN, [_|List], El) :-
	I1 is I+1,
	generate_nth(I1, IN, List, El).


nth0(V, In, Element, Tail) :- var(V), !,
	generate_nth(0, V, In, Element, Tail).
nth0(0, [Head|Tail], Head, Tail) :- !.
nth0(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	nth0(M, Tail, Elem, Rest).

find_nth0(0, [Head|Tail], Head, Tail) :- !.
find_nth0(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	find_nth0(M, Tail, Elem, Rest).



nth1(V, In, Element, Tail) :- var(V), !,
	generate_nth(1, V, In, Element, Tail).
nth1(1, [Head|Tail], Head, Tail) :- !.
nth1(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	nth1(M, Tail, Elem, Rest).

nth(V, In, Element, Tail) :- var(V), !,
	generate_nth(1, V, In, Element, Tail).
nth(1, [Head|Tail], Head, Tail) :- !.
nth(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	nth(M, Tail, Elem, Rest).

find_nth(1, [Head|Tail], Head, Tail) :- !.
find_nth(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	find_nth(M, Tail, Elem, Rest).


generate_nth(I, I, [Head|Tail], Head, Tail).
generate_nth(I, IN, [E|List], El, [E|Tail]) :-
	I1 is I+1,
	generate_nth(I1, IN, List, El, Tail).

permutation([], []).
permutation(List, [First|Perm]) :-
	select(First, List, Rest),	%  tries each List element in turn
	permutation(Rest, Perm).


prefix([], _).
prefix([Elem | Rest_of_part], [Elem | Rest_of_whole]) :-
  prefix(Rest_of_part, Rest_of_whole).

remove_duplicates([], []).
remove_duplicates([Elem|L], [Elem|NL]) :-
	delete(L, Elem, Temp),
	remove_duplicates(Temp, NL).

reverse(List, Reversed) :-
	reverse(List, [], Reversed).

reverse([], Reversed, Reversed).
reverse([Head|Tail], Sofar, Reversed) :-
	reverse(Tail, [Head|Sofar], Reversed).


same_length([], []).
same_length([_|List1], [_|List2]) :-
	same_length(List1, List2).

selectchk(Elem, List, Rest) :-
        select(Elem, List, Rest0), !,
        Rest = Rest0.


select(Element, [Element|Rest], Rest).
select(Element, [Head|Tail], [Head|Rest]) :-
	select(Element, Tail, Rest).

sublist(L, L).
sublist(Sub, [H|T]) :-
	'$sublist1'(T, H, Sub).

'$sublist1'(Sub, _, Sub).
'$sublist1'([H|T], _, Sub) :-
	'$sublist1'(T, H, Sub).
'$sublist1'([H|T], X, [X|Sub]) :-
	'$sublist1'(T, H, Sub).

substitute(X, XList, Y, YList) :-
	substitute2(XList, X, Y, YList).

substitute2([], _, _, []).
substitute2([X0|XList], X, Y, [Y|YList]) :-
	X == X0, !,
	substitute2(XList, X, Y, YList).
substitute2([X0|XList], X, Y, [X0|YList]) :-
	substitute2(XList, X, Y, YList).

suffix(Suffix, Suffix).
suffix(Suffix, [_|List]) :-
	suffix(Suffix,List).


sumlist(Numbers, Total) :-
	sumlist(Numbers, 0, Total).

sum_list(Numbers, SoFar, Total) :-
	sumlist(Numbers, SoFar, Total).

sum_list(Numbers, Total) :-
	sumlist(Numbers, 0, Total).

sumlist([], Total, Total).
sumlist([Head|Tail], Sofar, Total) :-
	Next is Sofar+Head,
	sumlist(Tail, Next, Total).


list_concat([], []).
list_concat([H|T], L) :-
	list_concat(H, L, Li),
	list_concat(T, Li).

list_concat([], L, L).
list_concat([H|T], [H|Lf], Li) :-
	list_concat(T, Lf, Li).


flatten(X,Y) :- flatten_list(X,Y,[]).

flatten_list(V) --> {var(V)}, !, [V].
flatten_list([]) --> !.
flatten_list([H|T]) --> !, flatten_list(H),flatten_list(T).
flatten_list(H) --> [H].

max_list([H|L],Max) :-
	max_list(L,H,Max).

max_list([],Max,Max).
max_list([H|L],Max0,Max) :-
	(
	  H > Max0
	->
	  max_list(L,H,Max)
	;
	  max_list(L,Max0,Max)
	).

min_list([H|L],Max) :-
	min_list(L,H,Max).

min_list([],Max,Max).
min_list([H|L],Max0,Max) :-
	(
	  H < Max0
	->
	  min_list(L, H, Max)
	;
	  min_list(L, Max0, Max)
	).

numlist(L, U, Ns) :-
        must_be(integer, L),
        must_be(integer, U),
        L =< U,
        numlist_(L, U, Ns).

numlist_(U, U, OUT) :- !, OUT = [U].
numlist_(L, U, [L|Ns]) :-
        succ(L, L2),
        numlist_(L2, U, Ns).


intersection([], _, []) :- !.
intersection([X|T], L, Intersect) :-
	memberchk(X, L), !,
	Intersect = [X|R],
	intersection(T, L, R).
intersection([_|T], L, R) :-
	intersection(T, L, R).

subtract([], _, []) :- !.
subtract([E|T], D, R) :-
	memberchk(E, D), !,
	subtract(T, D, R).
subtract([H|T], D, [H|R]) :-
	subtract(T, D, R).

pairs_values([], []).
pairs_values([_-V|T0], [V|T]) :-
   pairs_values(T0, T).