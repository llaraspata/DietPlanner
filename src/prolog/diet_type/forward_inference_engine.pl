% ---------
% Modules to consult
% ---------
:- consult('demo_test.pl').
:- consult('rules.pl').


% Define a dynamic predicate to store inferred facts.
:- dynamic(inferred_fact/1).

% Forward chaining algorithm.
forward_chaining :-
    rule(Id, Conclusion, Premises),
    \+ inferred_fact(Conclusion),
    all_true(Premises),
    assert(inferred_fact(Conclusion)),
    assertz(Conclusion),
    write('Inferred: '), writeln(Conclusion),
    forward_chaining.
forward_chaining.

% Helper predicate to check if all premises are true.
all_true([]).
all_true([H | T]) :- inferred_fact(H), all_true(T).
all_true([H | T]) :- fact(H), all_true(T).