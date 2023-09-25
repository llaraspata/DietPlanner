% ---------
% Modules to consult
% ---------
:- consult('rules.pl').
:- consult('demo_test.pl').     % temporary -> what is asserted here will be asserted dynamically while compiling the questionnaire

% Define the dynamic predicate to store the goal.
:- dynamic(goal/1).

% Read and assert the goal.
read_goal :-
    inference_goal(Goal),
    writeln(Goal),
    assert(goal(Goal)).

% Backward chaining inference rule.
infer_goal(Goal) :-
    Goal,  % Check if the goal is already satisfied.
    !,
    writeln('Goal satisfied: '), writeln(Goal).

infer_goal(Goal) :-
    % Check if there's a rule that can help satisfy the goal.
    rule(Id, Conclusion, Premises),  % Retrieve a rule from 'rules.pl'.
    Goal = Conclusion,           % Match the conclusion of the rule to the current goal.
    all_true(Premises),         % Check if all premises of the rule are true.
    !,
    assertz(Goal),
    infer_goal(Goal).           % Recursively check if any further sub-goals need to be satisfied.

% Helper predicate to check if all premises are true.
all_true([]).
all_true([H | T]) :- fact(H), all_true(T).
