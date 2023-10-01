% Define a dynamic predicate to store inferred facts.
:- dynamic(inferred_fact/1).

backward_chaining(Goal) :-
    % Check if there's a rule that can help satisfy the goal.
    rule(Id, Conclusion, Premises),  % Retrieve a rule from 'rules.pl'.
    Goal = Conclusion,           % Match the conclusion of the rule to the current goal.
    all_true(Premises),         % Check if all premises of the rule are true.
    !,
    assertz(Goal).           % Recursively check if any further sub-goals need to be satisfied.

% Forward chaining algorithm.
forward_chaining :-
    rule(Id, Conclusion, Premises),
    \+ inferred_fact(Conclusion),
    all_true(Premises),
    assertz(inferred_fact(Conclusion)),
    assertz(Conclusion),
    forward_chaining.
forward_chaining.

% Helper predicate to check if all premises are true.
all_true([]).
all_true([H | T]) :- fact(H), all_true(T).
all_true([H | T]) :- inferred_fact(H), all_true(T).