inference_goal(suggested_diet_type(User, DietType)).

% ---------
% Rules
% ---------
% rule(id, conclusion, [premises])
% ---------
rule(
    r1,
    suggested_diet_type(User, vegan_diet), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        do_not_eat(User, fish_seafood),
        do_not_eat(User, animal_derived)
    ]
).

rule(
    r2,
    suggested_diet_type(User, vegetarian_diet), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        do_not_eat(User, fish_seafood),
        \+ do_not_eat(User, animal_derived)
    ]
).

rule(
    r3,
    suggested_diet_type(User, diabetic_diet), 
    [
        has_medical_issues(User),
        has(User, diabetes)
    ]
).

rule(
    r4,
    suggested_diet_type(User, high_cholesterol_diet), 
    [
        has_medical_issues(User),
        has(User, high_blood_pressure),
        has(User, high_cholesterol)
    ]
).

rule(
    r5,
    suggested_diet_type(User, gastrointestinal_disorder_diet), 
    [
        has_medical_issues(User),
        has(User, gastrointestinal_disorders)
    ]
).

rule(
    r6,
    suggested_diet_type(User, kidney_problem_diet), 
    [
        has_medical_issues(User),
        has(User, kidney_problems)
    ]
).

rule(
    r7,
    suggested_diet_type(User, healthy_weight_diet), 
    [
        \+ has_dietary_restrictions(User),
        wants_to(User, reach_healthy_weight)
    ]
).

rule(
    r8,
    suggested_diet_type(User, healthy_weight_diet_no_meat), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        wants_to(User, reach_healthy_weight)
    ]
).

rule(
    r9,
    suggested_diet_type(User, healthy_weight_diet_no_fish_seafood),
    [
        has_dietary_restrictions(User),
        do_not_eat(User, fish_seafood),
        wants_to(User, reach_healthy_weight)
    ]
).

rule(
    r10,
    suggested_diet_type(User, hyperproteic_diet), 
    [
        \+ has_dietary_restrictions(User),
        wants_to(User, increase_muscle_mass)
    ]
).

rule(
    r11,
    suggested_diet_type(User, hyperproteic_diet_no_meat), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        wants_to(User, increase_muscle_mass)
    ]
).

rule(
    r12,
    suggested_diet_type(User, hyperproteic_diet_no_fish_seafood), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, fish_seafood),
        wants_to(User, increase_muscle_mass)
    ]
).

rule(
    r13,
    suggested_diet_type(User, hypocaloric_diet), 
    [
        \+ has_dietary_restrictions(User),
        wants_to(User, reduce_body_fat)
    ]
).

rule(
    r14,
    suggested_diet_type(User, hypocaloric_diet_no_meat), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        wants_to(User, reduce_body_fat)
    ]
).

rule(
    r15,
    suggested_diet_type(User, hypocaloric_diet_no_fish_seafood), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, fish_seafood),
        wants_to(User, reduce_body_fat)
    ]
).
