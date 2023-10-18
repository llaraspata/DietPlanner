% ---------
% Predicates
% ---------
% Dynamic predicate to store inferred facts.
:- dynamic(inferred_fact/1).


% ---------
% Backward strategy
% ---------
backward_chaining(Goal) :-
    rule(Id, Conclusion, Premises),
    Goal = Conclusion,
    all_true(Premises),
    !,
    assertz(Goal),
    get_explanation(Id, Explanation),
    assertz(why(Conclusion, Explanation)).

% ---------
% Forward strategy
% ---------
forward_chaining :-
    rule(Id, Conclusion, Premises),
    \+ inferred_fact(Conclusion),
    all_true(Premises),
    assertz(inferred_fact(Conclusion)),
    assertz(Conclusion),
    get_explanation(Id, Explanation),
    assertz(why(Conclusion, Explanation)),
    forward_chaining.
forward_chaining.

% ---------
% Utilities
% ---------
% Helper predicate to check if all premises are true.
all_true([]).
all_true([H | T]) :- fact(H), all_true(T).
all_true([H | T]) :- inferred_fact(H), all_true(T).

% Gets the explanation in natural language of a rule
get_explanation(RuleId, Explanation) :-
    explanation(RuleId, Explanation).