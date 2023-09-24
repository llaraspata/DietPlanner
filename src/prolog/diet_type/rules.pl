% ---------
% Goal predicate
% ---------
inference_goal(suggested_diet_type(User, DietType)).


% ---------
% Rules
% ---------
suggested_diet_type(User, vegan_diet) :-
    do_not_eat(User, meat),
    do_not_eat(User, fish_seafood),
    do_not_eat(User, animal_derived).
