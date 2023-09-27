% ---------
% Modules to consult
% ---------
:- consult('demo_test.pl').
:- consult('rules.pl').

% ---------
% Predicates
% ---------
:- dynamic(goal/1).
:- dynamic(inferred_fact/1).


% Read and assert the goal.
read_goal :-
    inference_goal(Goal),
    writeln(Goal),
    assert(goal(Goal)).

% Backward chaining inference rule.
backward_chaining(Goal) :-
    Goal,
    !,
    writeln('Goal satisfied: '), writeln(Goal).
backward_chaining(Goal) :-
    rule(Id, Conclusion, Premises),
    Goal = Conclusion,
    all_true(Premises),
    !,
    assertz(Goal),
    get_explanation(Id, Explanation),
    assertz(why(Conclusion, Explanation)),
    backward_chaining(Goal).

% Forward chaining algorithm.
forward_chaining :-
    rule(Id, Conclusion, Premises),
    \+ inferred_fact(Conclusion),
    all_true(Premises),
    assert(inferred_fact(Conclusion)),
    assertz(Conclusion),
    get_explanation(Id, Explanation),
    assertz(why(Conclusion, Explanation)),
    write('Inferred: '), writeln(Conclusion),
    forward_chaining.
forward_chaining.

% Helper predicate to check if all premises are true.
all_true([]).
all_true([H | T]) :- fact(H), all_true(T).
all_true([H | T]) :- inferred_fact(H), all_true(T).

% Gets the explanation in natural language of a rule
get_explanation(RuleId, Explanation) :-
    explanation(RuleId, Explanation).