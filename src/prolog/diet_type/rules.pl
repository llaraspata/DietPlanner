% ---------
% Goal predicate
% ---------
inference_goal(suggested_diet_type(User, DietType)).


% ---------
% Rules
% ---------
suggested_diet_type(User, vegan_diet) :-
    has_dietary_restrictions(User),
    do_not_eat(User, meat),
    do_not_eat(User, fish_seafood),
    do_not_eat(User, animal_derived).

suggested_diet_type(User, vegetarian_diet) :-
    has_dietary_restrictions(User),
    do_not_eat(User, meat),
    do_not_eat(User, fish_seafood),
    \+ do_not_eat(User, animal_derived).

suggested_diet_type(User, diabetic_diet) :-
    has_medical_issues(User),
    has(User, diabetes).

suggested_diet_type(User, high_cholesterol_diet) :-
    has_medical_issues(User),
    has(User, high_blood_pressure),
    has(User, high_cholesterol).

suggested_diet_type(User, gastrointestinal_disorder_diet) :-
    has_medical_issues(User),
    has(User, gastrointestinal_disorders).

suggested_diet_type(User, kidney_problem_diet) :-
    has_medical_issues(User),
    has(User, kidney_problems).

suggested_diet_type(User, healthy_weight_diet) :-
    \+ has_dietary_restrictions(User),
    wants_to(User, reach_healthy_weight).

suggested_diet_type(User, healthy_weight_diet_no_meat) :-
    has_dietary_restrictions(User),
    do_not_eat(User, meat),
    wants_to(User, reach_healthy_weight).

suggested_diet_type(User, healthy_weight_diet_no_fish_seafood) :-
    has_dietary_restrictions(User),
    do_not_eat(User, fish_seafood),
    wants_to(User, reach_healthy_weight).

suggested_diet_type(User, hyperproteic_diet) :-
    \+ has_dietary_restrictions(User),
    wants_to(User, increase_muscle_mass).

suggested_diet_type(User, hyperproteic_diet_no_meat) :-
    has_dietary_restrictions(User),
    do_not_eat(User, meat),
    wants_to(User, increase_muscle_mass).

suggested_diet_type(User, hyperproteic_diet_no_fish_seafood) :-
    has_dietary_restrictions(User),
    do_not_eat(User, fish_seafood),
    wants_to(User, increase_muscle_mass).

suggested_diet_type(User, hypocaloric_diet) :-
    \+ has_dietary_restrictions(User),
    wants_to(User, reduce_body_fat).

suggested_diet_type(User, hypocaloric_diet_no_meat) :-
    has_dietary_restrictions(User),
    do_not_eat(User, meat),
    wants_to(User, reduce_body_fat).

suggested_diet_type(User, hypocaloric_diet_no_fish_seafood) :-
    has_dietary_restrictions(User),
    do_not_eat(User, fish_seafood),
    wants_to(User, reduce_body_fat).