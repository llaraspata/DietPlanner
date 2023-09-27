% ---------
% Goal predicate
% ---------
inference_goal(suggested_diet_type(User, DietType)).

% ---------
% Rules
% ---------
% rule(id, conclusion, [premises])
% ---------
rule(
    r1,
    suggested_diet_type(User, omnivorous_diet), 
    [
        \+ has_dietary_restrictions(User)
    ]
).
explanation(r1, 'According to the rule with id r1, the omnivorous diet is suggested if the patient does not have any dietary restrictions.').

rule(
    r2,
    suggested_diet_type(User, vegan_diet), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        do_not_eat(User, fish_seafood),
        do_not_eat(User, animal_derived)
    ]
).
explanation(r2, 'According to the rule with id r2, the vegan diet is suggested if the patient has dietary restrictions that include avoiding meat, fish/seafood, and animal-derived products.').

rule(
    r3,
    suggested_diet_type(User, vegetarian_diet), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        do_not_eat(User, fish_seafood),
        \+ do_not_eat(User, animal_derived)
    ]
).
explanation(r3, 'According to the rule with id r3, the vegetarian diet is suggested if the patient has dietary restrictions that include avoiding meat and fish/seafood, but allow the consumption of animal-derived products.').

rule(
    r4,
    suggested_diet_type(User, no_meat_diet), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, meat),
        \+ do_not_eat(User, fish_seafood),
        \+ do_not_eat(User, animal_derived)
    ]
).
explanation(r4, 'According to the rule with id r4, the no meat diet is suggested if the patient has the only dietary restrictions of avoiding meat, but allow the consumption of fish/seafood and animal-derived products.').

rule(
    r5,
    suggested_diet_type(User, no_fish_seafood_diet), 
    [
        has_dietary_restrictions(User),
        do_not_eat(User, fish_seafood),
        \+ do_not_eat(User, meat),
        \+ do_not_eat(User, animal_derived)
    ]
).
explanation(r5, 'According to the rule with id r5, the no fish and seafood diet is suggested if the patient has the only dietary restrictions of avoiding fish/seafood, but allow the consumption of meat and animal-derived products.').

rule(
    r6,
    suggested_diet_type(User, diabetic_diet), 
    [
        has_medical_issues(User),
        has(User, diabetes)
    ]
).
explanation(r6, 'According to the rule with id r6, the diabetic diet is suggested if the patient has medical issues and has been diagnosed with diabetes.').

rule(
    r7,
    suggested_diet_type(User, high_cholesterol_diet), 
    [
        has_medical_issues(User),
        has(User, high_blood_pressure),
        has(User, high_cholesterol)
    ]
).
explanation(r7, 'According to the rule with id r7, the high cholesterol diet is suggested if the patient has medical issues, specifically high blood pressure and high cholesterol.').

rule(
    r8,
    suggested_diet_type(User, gastrointestinal_disorder_diet), 
    [
        has_medical_issues(User),
        has(User, gastrointestinal_disorders)
    ]
).
explanation(r8, 'According to the rule with id r8, the gastro-intestinal diet is suggested if the patient has medical issues, specifically gastro-intestinal disorders.').

rule(
    r9,
    suggested_diet_type(User, kidney_problem_diet), 
    [
        has_medical_issues(User),
        has(User, kidney_problems)
    ]
).
explanation(r9, 'According to the rule with id r9, the kidney diet is suggested if the patient has medical issues, specifically kidney problems.').

rule(
    r10,
    suggested_diet_type(User, healthy_weight_diet), 
    [
        \+ has_dietary_restrictions(User),
        wants_to(User, reach_healthy_weight)
    ]
).
explanation(r10, 'According to the rule with id r10, the healthy weight diet is suggested if the patient has a goal of reaching a healthy weight.').

rule(
    r11,
    suggested_diet_type(User, hyperproteic_diet), 
    [
        \+ has_dietary_restrictions(User),
        wants_to(User, increase_muscle_mass)
    ]
).
explanation(r11, 'According to the rule with id r11, the hyperproteic weight diet is suggested if the patient has a goal of increasing the muscle mass.').

rule(
    r12,
    suggested_diet_type(User, hypocaloric_diet), 
    [
        \+ has_dietary_restrictions(User),
        wants_to(User, reduce_body_fat)
    ]
).
explanation(r12, 'According to the rule with id r12, the hypocaloric weight diet is suggested if the patient has a goal of reducing the body fat.').