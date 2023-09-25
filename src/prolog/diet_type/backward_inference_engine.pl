% backward_chaining.pl

% Goal
% goal :- ancestor(mary, susan).

% Backward chaining algorithm
% goal :- true.
% goal :- ancestor(X, Y), goal.

% ---------
% Modules to consult
% ---------
% inference_engine.pl

% Consult the files with goals and rules.
:- consult('rules.pl').
:- consult('demo_test.pl').     % temporary -> what asserted here will be assert dynamically while compiling the questionnaire

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
    call(Goal),  % This will call the appropriate rule based on the goal.
    infer_goal(Goal).
