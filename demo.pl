:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(random)).  

% Food and Beverage
foodbeverage_instance(dietplanner, vegetables, carrot).
foodbeverage_instance(dietplanner, vegetables, spinach).
foodbeverage_instance(dietplanner, vegetables, broccoli).
foodbeverage_instance(dietplanner, vegetables, bell_pepper).
foodbeverage_instance(dietplanner, vegetables, tomato).
foodbeverage_instance(dietplanner, fruits_olives, apple).
foodbeverage_instance(dietplanner, fruits_olives, banana).
foodbeverage_instance(dietplanner, fruits_olives, grapes).
foodbeverage_instance(dietplanner, fruits_olives, olive).
foodbeverage_instance(dietplanner, fruits_olives, orange).
foodbeverage_instance(dietplanner, fruits_olives, blueberries).
attribute_value(dietplanner, spinach, calories, 71).
attribute_value(dietplanner, tomato, calories, 20).
attribute_value(dietplanner, egg, calories, 40).
attribute_value(dietplanner, bread, calories, 100).
attribute_value(dietplanner, quinoa, calories, 46).
attribute_value(dietplanner, salmon, calories, 55).
attribute_value(dietplanner, shrimp, calories, 120).
attribute_value(dietplanner, potato, calories, 230).
attribute_value(dietplanner, banana, calories, 90).
attribute_value(dietplanner, turkey, calories, 160).


% Nutrient
nutrient_instance(dietplanner, minerals, potassium).
nutrient_instance(dietplanner, vitamin, vitamin_c).
nutrient_instance(dietplanner, protein, whey_protein).
nutrient_instance(dietplanner, lipids, omega_3_fatty_acids).

% Person
person_instance(dietplanner, person, alice_johnson).
attribute_value(dietplanner, alice_johnson, name, 'Alice').
attribute_value(dietplanner, alice_johnson, surname, 'Johnson').
attribute_value(dietplanner, alice_johnson, age, 30).
attribute_value(dietplanner, alice_johnson, gender, 'Female').
attribute_value(dietplanner, alice_johnson, height, 165).
attribute_value(dietplanner, alice_johnson, weight, 60.5).
attribute_value(dietplanner, alice_johnson, bmi, 22.22).
attribute_value(dietplanner, alice_johnson, energy_demand, 1710).
attribute_value(dietplanner, alice_johnson, number_day_on, 2).

person_instance(dietplanner, person, bob_smith).
attribute_value(dietplanner, bob_smith, name, 'Bob').
attribute_value(dietplanner, bob_smith, surname, 'Smith').
attribute_value(dietplanner, bob_smith, age, 28).
attribute_value(dietplanner, bob_smith, gender, 'Male').
attribute_value(dietplanner, bob_smith, height, 180).
attribute_value(dietplanner, bob_smith, weight, 75.2).
attribute_value(dietplanner, bob_smith, bmi, 23.21).
attribute_value(dietplanner, bob_smith, energy_demand, 2080).
attribute_value(dietplanner, bob_smith, number_day_on, 4).


activity_instance(dietplanner, activity, running).
attribute_value(dietplanner, running, name, 'Running').
attribute_value(dietplanner, running, description, 'Go for a run to boost your cardiovascular health.').
attribute_value(dietplanner, running, calory_effort, 400).

activity_instance(dietplanner, activity, swimming).
attribute_value(dietplanner, swimming, name, 'Swimming').
attribute_value(dietplanner, swimming, description, 'Hit the pool for a full-body workout.').
attribute_value(dietplanner, swimming, calory_effort, 500).


% Dish
dish_instance(dietplanner, dish, english_breakfast).
attribute_value(dietplanner, english_breakfast, type, breakfast).
dish_instance(dietplanner, dish, poke).
attribute_value(dietplanner, poke, type, lunch).
attribute_value(dietplanner, poke, type, dinner).
dish_instance(dietplanner, dish, yogurt_banana).
attribute_value(dietplanner, yogurt_banana, type, breakfast).
attribute_value(dietplanner, yogurt_banana, type, snack).
dish_instance(dietplanner, dish, turkey_sandwich).
attribute_value(dietplanner, turkey_sandwich, type, dinner).
attribute_value(dietplanner, turkey_sandwich, type, lunch).

% Define is_allergic relationship
is_allergic(alice_johnson, dairy).
is_allergic(bob_smith, peanuts).
is_allergic(alice_johnson, shellfish).
is_allergic(bob_smith, dairy).

% Define is_contained relationship
is_contained(dietplanner, nuts, almond_milk).
is_contained(dietplanner, shellfish, shrimp).
is_contained(dietplanner, shellfish, crab).
is_contained(dietplanner, shellfish, salmon).
is_contained(dietplanner, gluten, wheat_bread).
is_contained(dietplanner, gluten, pasta).
is_contained(dietplanner, eggs, chicken_eggs).
is_contained(dietplanner, eggs, quail_eggs).
is_contained(dietplanner, eggs, duck_eggs).
is_contained(dietplanner, eggs, goose_eggs).
is_contained(dietplanner, eggs, egg_whites).
is_contained(dietplanner, dairy, whole_milk).
is_contained(dietplanner, shellfish, lobster).
is_contained(dietplanner, dairy, cheese).

% Define has_nutrient relationship
has_nutrient(apple, vitamin_c, 0.5).
has_nutrient(banana, potassium, 0.4).
has_nutrient(chicken_breast, whey_protein, 30).
has_nutrient(salmon, omega_3_fatty_acids, 2).
has_nutrient(salmon, whey_protein, 20).
has_nutrient(turkey, whey_protein, 50).
has_nutrient(egg, whey_protein, 35).

% Define composed_of relationship
composed_of(diet1, daily_diet10).

% Define has relationship
has(daily_diet10, english_breakfast, [egg-20, bread-50]).
has(daily_diet10, poke, [quinoa-70, salmon-150, tomato-100]).
has(daily_diet10, yogurt_banana, [banana-10]).
has(daily_diet10, turkey_sandwich, [turkey-200, bread-70, spinach-200]).

% Define made_of relationship
made_of(english_breakfast, egg).
made_of(english_breakfast, bread).
made_of(toast, bread).
made_of(chicken_breast, chicken).
made_of(boiled_broccoli, broccoli).
made_of(yogurt_banana, banana).
made_of(grilled_salmon, salmon).
made_of(soup_asparagus, asparagus).
made_of(orange_juice, orange).
made_of(poke, quinoa).
made_of(poke, salmon).
made_of(poke, shrimp).
made_of(poke, potato).
made_of(poke, tomato).
made_of(turkey_sandwich, turkey).
made_of(turkey_sandwich, bread).
made_of(turkey_sandwich, spinach).
made_of(turkey_sandwich, tomato).


carry_out(alice_johnson, running-1, 2).
carry_out(alice_johnson, swimming-1.5, 1).

carry_out(bob_smith, swimming-2, 1).
carry_out(bob_smith, running-1, 1).
carry_out(bob_smith, weightlifting-2, 4).


% Compute the total calories about a list of foods 
compute_calories_amount([], 0).
compute_calories_amount([Food|Rest], TotalCalories) :-
    attribute_value(dietplanner, Food, calories, CaloriesFood),
    compute_calories_amount(Rest, RestCalories),
    TotalCalories is RestCalories + CaloriesFood.

% Constants for the Harris-Benedict equation
male_bmr_weight_factor(13.75).
male_bmr_height_factor(5.003).
male_bmr_age_factor(6.75).
male_bmr_constant(66.5).

female_bmr_weight_factor(9.563).
female_bmr_height_factor(1.850).
female_bmr_age_factor(4.676).
female_bmr_constant(655.1).

% Compute Needed Calories for a Person
compute_needed_calories(Person, NeededCalories) :-
    % Get the person's attributes
    attribute_value(dietplanner, Person, name, PersonName),
    attribute_value(dietplanner, Person, name, PersonSurname),
    attribute_value(dietplanner, Person, age, Age),
    attribute_value(dietplanner, Person, gender, Gender),
    attribute_value(dietplanner, Person, height, Height),
    attribute_value(dietplanner, Person, weight, Weight),
    
    (Gender = "Male" ->
        male_bmr_weight_factor(WeightFactor),
        male_bmr_height_factor(HeightFactor),
        male_bmr_age_factor(AgeFactor),
        male_bmr_constant(Constant);
    Gender = "Female" ->
        female_bmr_weight_factor(WeightFactor),
        female_bmr_height_factor(HeightFactor),
        female_bmr_age_factor(AgeFactor),
        female_bmr_constant(Constant)
    ),

    BMR is Constant + (WeightFactor * Weight) + (HeightFactor * Height) - (AgeFactor * Age),
    NeededCalories is BMR.

name_allergen(Name) :- 
    allergen_instance(dietplanner, allergen, X),
    attribute_value(dietplanner, X, name, Name),
    !.

find_person_id(Name, Surname, PersonID) :-
    person_instance(dietplanner, person, PersonID),
    attribute_value(dietplanner, PersonID, name, Name),
    attribute_value(dietplanner, PersonID, surname, Surname),
    !.
find_person_id(_, _, false).


find_bmi_energyeffort_dayon(PersonID, BMIValue, EnergyValue, NumberDayOn) :-
    attribute_value(dietplanner, PersonID, bmi, BMIValue),
    attribute_value(dietplanner, PersonID, energy_demand, EnergyValue),
    attribute_value(dietplanner, PersonID, number_day_on, NumberDayOn),
    !.

% Ordinamento decrescente in base al secondo parametro
ordered_list(List, OrderedList) :-
    predsort(compare_second_param, List, OrderedList).

% Predicato per confrontare sublist in base al secondo parametro
compare_second_param(Order, Sublist1, Sublist2) :-
    nth0(1, Sublist1, Param1),
    nth0(1, Sublist2, Param2),
    compare(Order, Param2, Param1).

create_week(PersonID, Week) :-
    attribute_value(dietplanner, PersonID, number_day_on, NumeberDayOn),
    create_days_list(7, EmptyDay),
    ordered_list(ActivityList, OrderedList),
    distribute_sorted_activities(OrderedList, EmptyDay, NumeberDayOn, Week).

set_calories_week([], _, _, []).
set_calories_week([Day|Rest], BMI, EnergyValue, [TotalCalories|Tail]) :-
    set_right_number_calories(BMI, EnergyValue, ActivityDurationList, BaseCalories),
    set_calories_day(Day, BMI, TotalEffort),
    TotalCalories is TotalEffort + BaseCalories,
    set_calories_week(Rest, BMI, EnergyValue, Tail).

set_calories_day([], _, 0).
set_calories_day([Activity-Duration|Rest], BMI, TotalEffort) :-
    attribute_value(dietplanner, Activity, calory_effort, EffortOneHour),
    (   BMI < 18.49 ->
        Param is 90
    ;   (BMI >= 18.50, BMI =< 24.99) ->
        Param is 80
    ;   BMI > 25.00 ->
        Param is 70
    ),
    ActivityEffort is (EffortOneHour * Duration * Param) / 100,
    set_calories_day(Rest, BMI, RestEffort),
    TotalEffort is ActivityEffort + RestEffort.


% Compute the total calories effort for a single day
set_right_number_calories(BMI, EnergyValue, [], TotalCalories) :-
    (BMI < 18.49 ->
        TotalCalories is EnergyValue + 300;
    (BMI >= 18.50, BMI =< 24.99) ->
        TotalCalories is EnergyValue;
    BMI > 25.00 ->
        TotalCalories is EnergyValue - 300).
set_right_number_calories(BMI, EnergyValue, [Activity-Duration|Rest], TotalCalories) :-
    attribute_value(dietplanner, Activity, calory_effort, EffortOneHour),
    ActivityEffort is EffortOneHour * Duration,
    set_right_number_calories(BMI, EnergyValue, Rest, RestEffort),
    TotalCalories is ActivityEffort + RestEffort.

get_activities(PersonID, ActivityList) :-
    (   setof([Activity-Hours, Frequency],
                carry_out(PersonID, Activity-Hours, Frequency),
                ActivityList)
        ->  true;   
        ActivityList = []
    ).

flatten_pairs([], []).
flatten_pairs([[X-Y|RestPairs]|RestLists], [X-Y|FlattenedRest]) :-
    flatten_pairs(RestLists, FlattenedRest).

% Predicato per distribuire le attività equamente su 7 giorni
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    DaysPerWeek > 0,
    !,
    create_days_list(7, EmptyList),  % Crea una lista di 7 giorni vuoti
    sort_activity_list(ActivityList, SortedActivityList),  % Ordina la lista di attività per frequenza
    distribute_activities_recursive(DaysPerWeek, SortedActivityList, EmptyList, DistributedList).
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    writeln('Errore: numero di giorni non valido'), 
    fail.

% Predicato per creare una lista di N giorni vuoti
create_days_list(0, []).
create_days_list(N, [[] | Rest]) :-
    N > 0,
    NextN is N - 1,
    create_days_list(NextN, Rest).

% Predicato principale per ordinare la lista senza eliminare i duplicati
sort_activity_list(ActivityList, SortedActivityList) :-
    predsort(compare_activity_frequency, ActivityList, SortedActivityList).

% Predicato per confrontare due elementi Activity-Hours, Frequency
compare_activity_frequency(Order, [_, Frequency1], [_, Frequency2]) :-
    compare(OrderFreq, Frequency2, Frequency1),
    % Aggiungi un criterio di confronto per gli elementi con la stessa frequenza
    (OrderFreq = (=) -> compare(OrderName, [_, Name1], [_, Name2]), Order = OrderName ; Order = OrderFreq).


% Predicato per distribuire le attività
distribute_activities_recursive(_, [], DistributedList, DistributedList).  % Tutte le attività sono state distribuite
distribute_activities_recursive(DaysPerWeek, [[Activity-Hours, Frequency] | RestActivities], EmptyList, DistributedList) :-
    distribute_activity(Activity-Hours, Frequency, DaysPerWeek, EmptyList, TempDistributedList),
    distribute_activities_recursive(DaysPerWeek, RestActivities, TempDistributedList, DistributedList).

% Predicato per distribuire un'attività in base alle ore su una lista di giorni
distribute_activity(_, 0, _, DaysList, DaysList).
distribute_activity(ActivityHours, Frequency, DaysPerWeek, [Day | RestDays], DistributedList) :-
    Frequency > 0,
    add_element_to_shortest([Day | RestDays], ActivityHours, DaysPerWeek, TempDistributedList),
    NewFrequency is Frequency - 1,
    distribute_activity(ActivityHours, NewFrequency, DaysPerWeek, TempDistributedList, DistributedList),
    !.
distribute_activity(_, Frequency, DaysPerWeek, [Day | RestDays], DistributedList) :-
    Frequency > 0,
    distribute_activity(0, Frequency, DaysPerWeek, RestDays, DistributedList).

% Predicato principale che restituisce l'indice della lista più corta tra la prima e la n-esima lista.
find_shortest_list_index(Lists, N, Index) :-
    (   Lists = []
    ->  Index = 1  % Lista vuota, restituisci un indice non valido
    ;   find_shortest_list_index(Lists, N, 1, inf, -1, Index)
    ).

% Caso base: Quando abbiamo analizzato tutte le liste fino alla n-esima lista, restituisci l'indice della lista più corta trovata.
find_shortest_list_index(_, 0, _, _, ShortestIndex, ShortestIndex).
find_shortest_list_index([List|Rest], N, Index, CurrentMinLength, ShortestIndex, ResultIndex) :-
    length(List, Length),
    (Length < CurrentMinLength ->
        NewShortestIndex is Index,
        NewMinLength is Length
    ;
        NewShortestIndex is ShortestIndex,
        NewMinLength is CurrentMinLength
    ),
    NewN is N - 1,
    NextIndex is Index + 1,
    find_shortest_list_index(Rest, NewN, NextIndex, NewMinLength, NewShortestIndex, ResultIndex).
 
add_element_to_shortest(List, _, 0, List). % Caso base: Max è 0, ritorna la lista originale.

add_element_to_shortest(List, Element, Max, Result) :-
    find_shortest_list_index(List, Max, ShortestIndex),
    nth1(ShortestIndex, List, ElementList),
    append(ElementList, [Element], NewShortestList),
    replace_list(List, ShortestIndex, NewShortestList, Result).

% Predicato per sostituire una lista in una posizione specifica nella lista di liste.
replace_list(OriginalList, Index, NewList, ResultList) :-
    replace_list_helper(OriginalList, Index, NewList, 1, ResultList).

% Caso base: la lista originale è vuota.
replace_list_helper([], _, _, _, []).
% Caso ricorsivo: la lista corrente è la lista da sostituire.
replace_list_helper([_|Rest], Index, NewList, Index, [NewList|RestResult]) :-
    NextIndex is Index + 1,
    replace_list_helper(Rest, Index, NewList, NextIndex, RestResult).
% Caso ricorsivo: la lista corrente non è la lista da sostituire.
replace_list_helper([X|Rest], Index, NewList, CurrIndex, [X|RestResult]) :-
    CurrIndex \= Index,
    NextIndex is CurrIndex + 1,
    replace_list_helper(Rest, Index, NewList, NextIndex, RestResult).

collect_allergen_names(Names) :-
    findall(Name, allergen_instance(_, _, Name), Names).

% Query to find the nutrient content per 100g or 100ml portion
standard_nutrient_content(FoodBeverage, Nutrient, Quantity) :-
    has_nutrient(FoodBeverage, Nutrient, Quantity).

% Convert the nutrient content to the actual quantity in the given portion size
actual_nutrient_quantity(FoodBeverage, Nutrient, PortionSizeGrams, ActualQuantity) :-
    standard_nutrient_content(FoodBeverage, Nutrient, NutrientContentPer100),
    ActualQuantity is (PortionSizeGrams / 100) * NutrientContentPer100.

% Get the list of dishes from a daily diet
get_dishes_from_daily_diet(DailyDiet, Dishes) :-
    findall(Dish, has(DailyDiet, Dish, _), Dishes).

% Get the list of ingredients in a dish of a daily diet as a flat list
get_ingredients_in_dish(DailyDiet, Dish, Ingredients) :-
    findall(Ingredient, has(DailyDiet, Dish, Ingredient), IngredientLists),
    flatten(IngredientLists, Ingredients).

% Predicate to get unique ingredients and cumulative quantities for a daily diet
unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients) :-
    get_dishes_from_daily_diet(DailyDiet, Dishes), % Get the list of dishes
    remove_duplicates(Dishes, FinalDishes),
    accumulate_ingredients(FinalDishes, [], UniqueIngredients).

% Helper predicate to accumulate ingredients from a list of dishes
accumulate_ingredients([], Acc, Acc).
accumulate_ingredients([Dish|Rest], Acc, UniqueIngredients) :-
    get_ingredients_in_dish(DailyDiet, Dish, Ingredients), % Get ingredients in the dish
    accumulate_ingredients(Rest, Acc, UpdatedAcc),
    accumulate_ingredients_from_list(Ingredients, UpdatedAcc, UniqueIngredients).

% Helper predicate to accumulate ingredients from a list
accumulate_ingredients_from_list([], Acc, Acc).
accumulate_ingredients_from_list([Ingredient-Quantity|Rest], Acc, UniqueIngredients) :-
    % Check if the ingredient is already in the accumulated list
    (member(Ingredient-ExistingQuantity, Acc) ->
        NewQuantity is ExistingQuantity + Quantity,
        select(Ingredient-ExistingQuantity, Acc, TempAcc), % Remove the old entry
        append(TempAcc, [Ingredient-NewQuantity], UpdatedAcc)
    ;
        append(Acc, [Ingredient-Quantity], UpdatedAcc)
    ),
    accumulate_ingredients_from_list(Rest, UpdatedAcc, UniqueIngredients).
 
 % Define a predicate to calculate cumulative nutrient quantity for a specified macro nutrient category
cumulative_macro_nutrient_quantity(FoodGramsList, MacroNutrient, CumulativeQuantity) :-
    % Find all nutrients that belong to the specified macro nutrient category
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    % Calculate the cumulative quantity for each nutrient in the category
    cumulative_macro_nutrient_quantity(FoodGramsList, Nutrients, 0, CumulativeQuantity).

% Base case: When no nutrients are left to process, the cumulative quantity is 0.
cumulative_macro_nutrient_quantity(_, [], CumulativeQuantity, CumulativeQuantity).

% Recursive case: Calculate the cumulative quantity for the first nutrient in the category.
cumulative_macro_nutrient_quantity(FoodGramsList, [Nutrient|Rest], PartialCumulativeQuantity, CumulativeQuantity) :-
    % Calculate the cumulative quantity for the current nutrient.
    cumulative_nutrient_quantity(FoodGramsList, Nutrient, NutrientQuantity),
    NewPartialCumulativeQuantity is PartialCumulativeQuantity + NutrientQuantity,
    % Recursively process the rest of the nutrients in the category.
    cumulative_macro_nutrient_quantity(FoodGramsList, Rest, NewPartialCumulativeQuantity, CumulativeQuantity).

% Calculate the cumulative quantity of a specific nutrient in a list of food-grams pairs.
cumulative_nutrient_quantity(FoodGramsList, Nutrient, CumulativeQuantity) :-
    cumulative_nutrient_quantity(FoodGramsList, Nutrient, 0, CumulativeQuantity).

% Base case: When the list is empty, the cumulative quantity is 0.
cumulative_nutrient_quantity([], _, CumulativeQuantity, CumulativeQuantity).

% Recursive case: Calculate the cumulative quantity for the first pair in the list.
cumulative_nutrient_quantity([FoodBeverage-Grams|Rest], Nutrient, PartialCumulativeQuantity, CumulativeQuantity) :-
    % Check if the food item has the specified nutrient.
    (has_nutrient(FoodBeverage, Nutrient, NutrientPer100g) ->
        % Calculate the nutrient quantity for this food item and add it to the partial cumulative quantity.
        actual_nutrient_quantity(FoodBeverage, Nutrient, Grams, NutrientQuantity),
        NewPartialCumulativeQuantity is PartialCumulativeQuantity + NutrientQuantity
    ;
        % If the food item does not have the specified nutrient, leave the cumulative quantity unchanged.
        NewPartialCumulativeQuantity = PartialCumulativeQuantity
    ),
    % Recursively process the rest of the list.
    cumulative_nutrient_quantity(Rest, Nutrient, NewPartialCumulativeQuantity, CumulativeQuantity).

% Define a predicate to calculate the cumulative macro nutrient quantity as a percentage
cumulative_macro_nutrient_percentage(FoodGramsList, MacroNutrient, Percentage) :-
    % Calculate the cumulative macro nutrient quantity using the previous predicate
    cumulative_macro_nutrient_quantity(FoodGramsList, MacroNutrient, MacroNutrientQuantity),
    total_grams(FoodGramsList, TotalQuantity),
    % Calculate the percentage
    Percentage is (100 * MacroNutrientQuantity) / TotalQuantity.

% Get total nutrient quantity in a daily diet
daily_diet_total_nutrient_grams(DailyDiet, MacroNutrient, TotalGrams) :-
    unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients), 
    cumulative_macro_nutrient_quantity(UniqueIngredients, MacroNutrient, TotalGrams).

% Get total nutrient quantity in a daily diet
daily_diet_total_nutrient_percentage(DailyDiet, MacroNutrient, TotalPercentage) :-
    unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients), 
    cumulative_macro_nutrient_percentage(UniqueIngredients, MacroNutrient, TotalPercentage).

% Get the list of food and beverages in a dish of a daily diet
get_foodbeverages_in_daily_diet(DailyDiet, FoodBeverageList) :-
    findall(Ingredient, has(DailyDiet, _, Ingredient), Ingredients),
    flatten(Ingredients, IngredientLists),
    get_only_foodbeverages(IngredientLists, [], FoodBeverageList).

get_only_foodbeverages([], Acc, Acc). 
get_only_foodbeverages([FoodBeverage-_Grams | Rest], Acc, FoodBeverageList) :-
    append(Acc, [FoodBeverage], UpdatedAcc),
    get_only_foodbeverages(Rest, UpdatedAcc, FoodBeverageList).

% Count how many instances of a class of FoodBeverage there are in a daily diet
count_foodbeverage_in_daily_diet(DailyDiet, ItemToCount, Total) :-
    get_foodbeverages_in_daily_diet(DailyDiet, FoodBeverageList),
    count_foodbeverage_in_list(ItemToCount, FoodBeverageList, 0, Total).

count_foodbeverage_in_list(_, [], Count, Count).
count_foodbeverage_in_list(ItemToCount, [FoodBeverage | Rest], PartialCount, Total) :-
    (foodbeverage_instance(dietplanner, ItemToCount, FoodBeverage) ->
        NewPartialCount is PartialCount + 1
        ;
        NewPartialCount is PartialCount
    ),
    count_foodbeverage_in_list(ItemToCount, Rest, NewPartialCount, Total).

% Get person's allergies
get_person_allergies(Person, Allergies) :-
    findall(Allergen, is_allergic(Person, Allergen), Allergies).

% Define a predicate to get dishes whose ingredients do not contain a list of allergens
get_dishes_without_allergens(Allergens, DishType, DishesWithoutAllergens) :-
    findall(Dish, (
        dish_instance(dietplanner, dish, Dish),  % Get all dishes
        \+ dish_contains_allergens(Dish, Allergens),  % Check if dish contains allergens
        attribute_value(dietplanner, Dish, type, DishType)
    ), DishesWithoutAllergens).

% Define a predicate to check if a dish contains allergens
dish_contains_allergens(Dish, Allergens) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    member(FoodBeverage, FoodBeverageList),
    is_contained(dietplanner, Allergen, FoodBeverage),
    member(Allergen, Allergens).

% Get the list of ingredients in a dish of a daily diet as a flat list
get_foodbeverages_in_dish(Dish, FoodBeverageList) :-
    findall(FoodBeverage, made_of(Dish, FoodBeverage), FoodBeverageList).

% Get dishes whose ingredients don't contain allergens a specific person is allergic to
get_dishes_without_allergens_for_person(Person, DishType, DishesWithoutAllergens) :-
    get_person_allergies(Person, Allergies),
    get_dishes_without_allergens(Allergens, DishType, DishesWithoutAllergens).

% Get a random dish from a list of candidate dishes
get_random_dish_in_list(DishList, Dish) :-
    length(DishList, Length),
    random(1, Length, Index),
    nth(Index, DishList, Dish).

dish_types([breakfast, snack, lunch, snack, dinner]).

get_daily_diet_dishes(_, [], DailyDietDishes, DailyDietDishes).
get_daily_diet_dishes(Person, [DishType | Rest], Acc, DailyDietDishes) :-
    get_dishes_without_allergens_for_person(Person, DishType, DishList),
    get_random_dish_in_list(DishList, Dish),
    append(Acc, [Dish], NewAcc ),
    get_daily_diet_dishes(Person, Rest, NewAcc, DailyDietDishes).

had_new_fact(NewIdFact, Obiettivo, Probability) :-
	retract(max_id(Max)),
	NewIdFact is Max + 1,
	NewFact = fact(NewIdFact, Obiettivo, Probability),
	%FactNew = fact_new(NewIdFact, Obiettivo, Probability), %asserzione del fatto in un formato temporaneo per evitare loop
	assertz(NewFact),
	assertz(max_id(NewIdFact)),
	%assertz(FactNew).
%append_fact_to_kb(NewFact) :-
	get_kb(KB),
	open(KB,append,Stream),
	write(Stream,NewFact), nl(Stream),
	close(Stream).

add_new_relationship(NewRelationship) :-
	assertz(NewRelationship),
	open('instances.pl',append,Stream),
    format(Stream, '~w.~n', [NewRelationship]),
    writeln('Write Success'),
	close(Stream).

% Estrai il numero massimo dalla lista Keys
get_unique_keys(Keys) :-
    setof(Key, X^Y^has(Key, X, Y), Keys).

% Genera un nuovo daily_diet con un numero successivo
generate_new_id_daily_diet(NewDailyDiet) :-
    get_unique_keys(Keys), % Estrai le chiavi esistenti
    length(Keys, LengthList),
    nth(LengthList, Keys, LastKey), % Usare nth1 invece di nth
    sub_atom(LastKey, 10, _, 0, LastNumber), % Modifica del sub_atom
    atom_number(LastNumber, Index),
    NewNumber is Index + 1, % Incrementa il numero massimo
    atomic_concat('daily_diet', NewNumber, NewDailyDiet). % Combina con 'daily_diet'

generate_list_calories_week(PersonID, TotalCaloriesList) :-
    find_bmi_energyeffort_dayon(PersonID, BMI, EnergyValue, NumberDayOn),
    get_activities(PersonID, ActivityList),
    length(ActivityList, Length),
    (Length =\= 0 -> 
        distribute_activities(NumberDayOn, ActivityList, DistributedList)
    ; 
        create_days_list(7, DistributedList)),
    set_calories_week(DistributedList, BMI, EnergyValue, TotalCaloriesList).
    
get_daily_diet_calories(TotalDayCalories, DailyCalories) :-
    Percentage1 is TotalDayCalories * 0.20,
    Percentage2 is TotalDayCalories * 0.08,
    Percentage3 is TotalDayCalories * 0.40,
    Percentage4 is TotalDayCalories * 0.08,
    Percentage5 is TotalDayCalories * 0.24,
    DailyCalories = [Percentage1, Percentage2, Percentage3, Percentage4, Percentage5].

% Define a predicate to generate a daily diet for a person
generate_daily_diet(Person, []).
generate_daily_diet(Person, [TotalDayCalories | Rest]) :-
    dish_types(DishTypes),
    generate_new_id_daily_diet(NewId),
    get_daily_diet_dishes(Person, DishTypes, [], DailyDietDishes),
    get_daily_diet_calories(TotalDayCalories, DailyCalories),
    set_grams_for_dish(NewId, DailyDietDishes, DailyCalories),
    generate_daily_diet(Person, Rest).

set_grams_for_dish(_, [], []).
set_grams_for_dish(NewId, [Dish | RestDish], [Calories | RestCalories]) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    compute_ingredients_grams(FoodBeverageList, Calories, IngredientLists),
    NewRelationship = has(NewId, Dish, IngredientLists),
    add_new_relationship(NewRelationship),
    set_grams_for_dish(NewId, RestDish, RestCalories).


compute_ingredients_grams(FoodBeverageList, Calories, IngredientLists) :-
    length(FoodBeverageList, NumberIngredients),
    CaloriesPerIngredient is Calories / NumberIngredients,
    actual_foodbeverage_grams(FoodBeverageList, CaloriesPerIngredient, [], IngredientLists).

% Convert the nutrient content to the actual quantity in the given portion size
actual_foodbeverage_grams([], _, IngredientLists, IngredientLists).
actual_foodbeverage_grams([FoodBeverage | Rest], Calories, Acc, IngredientLists) :-
    attribute_value(dietplanner, FoodBeverage, calories, CaloriesPer100g),
    PortionSizeGrams is round((Calories * 100) / CaloriesPer100g),
    append(Acc, [FoodBeverage-PortionSizeGrams], NewAcc),
    actual_foodbeverage_grams(Rest, Calories, NewAcc, IngredientLists).

compute_diet(Name, Surname, Diet) :-
    find_person_id(Name, Surname, Person),
    generate_list_calories_week(Person, TotalWeekCaloriesList),
    generate_daily_diet(Person, TotalWeekCaloriesList).


check_macronutrient_percentage(DailyDiet, MacroNutrient, LowerBound, UpperBound) :-
    daily_diet_total_nutrient_percentage(DailyDiet, MacroNutrient, TotalPercentage),
    TotalPercentage >= LowerBound,
    TotalPercentage =< UpperBound.

check_macronutrient_grams(DailyDiet, MacroNutrient, LowerBound, UpperBound) :-
    daily_diet_total_nutrient_grams(DailyDiet, MacroNutrient, TotalGrams),
    TotalGrams >= LowerBound,
    TotalGrams =< UpperBound.