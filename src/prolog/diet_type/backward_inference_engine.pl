% backward_chaining.pl

% Goal
% goal :- ancestor(mary, susan).

% Backward chaining algorithm
% goal :- true.
% goal :- ancestor(X, Y), goal.

% ---------
% Modules to consult
% ---------
:- consult('fact_person.pl').
