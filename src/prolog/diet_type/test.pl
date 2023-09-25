% knowledge_base.pl

% Define facts.
% likes(mary, apples).
% likes(mary, carrots).
% 
% % Define rules.
% healthy_food(X) :- likes(mary, X), (X = apples ; X = carrots).
% diet_type(User, DietType) :- healthy_food(apples), User = mary, DietType = vegan.

% Define facts.
fact(likes(mary, apples)).
fact(X = apples).
fact(X = carrots).
fact(likes(mary, carrots)).

% Define rules.
rule([likes(mary, X), X = apples], healthy_food(apples)).
rule([likes(mary, X), X = carrots], healthy_food(carrots)).
rule([healthy_food(apples), User = mary], diet_type(User, vegan)).