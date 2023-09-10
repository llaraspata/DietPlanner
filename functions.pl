:- consult('instances.pl').
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(random)).


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

compute_diet(Name, Surname, Diet) :-
    find_person_id(Name, Surname, PersonID),
    find_bmi_energyeffort_dayon(PersonID, BMI, EnergyValue, NumberDayOn),
    get_activities(PersonID, ActivityList),
    length(ActivityList, Length),
    (Length =\= 0 -> 
        distribute_activities(NumberDayOn, ActivityList, DistributedList)
    ; 
        create_days_list(7, DistributedList)),
    set_calories_week(DistributedList, BMI, EnergyValue, TotalCaloriesList),
    writeln(TotalCaloriesList).

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

% Predicate to calculate the total grams in a list of food-grams pairs
total_grams(FoodGramsList, Total) :-
    total_grams(FoodGramsList, 0, Total).

% Base case: When the list is empty, the total grams is 0.
total_grams([], Total, Total).

% Recursive case: Calculate the total grams for the first pair in the list.
total_grams([_Food-Grams|Rest], PartialTotal, Total) :-
    NewPartialTotal is PartialTotal + Grams,
    % Recursively process the rest of the list.
    total_grams(Rest, NewPartialTotal, Total).


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

get_daily_diet_dishes(_, [], DailyDiet, DailyDiet).

get_daily_diet_dishes(Person, [DishType | Rest], Acc, DailyDiet) :-
    get_dishes_without_allergens_for_person(Person, DishType, DishList),
    get_random_dish_in_list(DishList, Dish),
    append(Acc, [Dish], NewAcc ),
    get_daily_diet_dishes(Person, Rest, NewAcc, DailyDiet).


% Define a predicate to generate a daily diet for a person
generate_daily_diet(Person, DailyDiet) :-
    dish_types(DishTypes),
    get_daily_diet_dishes(Person, DishTypes, [], DailyDiet).
    



check_macronutrient_percentage(DailyDiet, MacroNutrient, LowerBound, UpperBound) :-
    daily_diet_total_nutrient_percentage(DailyDiet, MacroNutrient, TotalPercentage),
    TotalPercentage >= LowerBound,
    TotalPercentage =< UpperBound.

check_macronutrient_grams(DailyDiet, MacroNutrient, LowerBound, UpperBound) :-
    daily_diet_total_nutrient_grams(DailyDiet, MacroNutrient, TotalGrams),
    TotalGrams >= LowerBound,
    TotalGrams =< UpperBound.