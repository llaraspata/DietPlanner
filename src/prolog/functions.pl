% ---------
% Modules to consult
% ---------
:- consult('instances.pl').
% ---------
% Libraries
% ---------
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(random)).


% ---------
% Constants
% ---------
% Harris-Benedict equation
male_bmr_weight_factor(13.75).
male_bmr_height_factor(5.003).
male_bmr_age_factor(6.75).
male_bmr_constant(66.5).
female_bmr_weight_factor(9.563).
female_bmr_height_factor(1.850).
female_bmr_age_factor(4.676).
female_bmr_constant(655.1).

% TODO: comment
dish_types([breakfast, snack, lunch, snack, dinner]).
%daily_diet_names([daily_diet1, daily_diet2, daily_diet3, daily_diet4, daily_diet5, daily_diet6, daily_diet7]).
daily_diet_names([daily_diet1]).

% Checks on generated Daily Diet
healthy_weight_nutrient_percentages([carbs-40-50, protein-20-25, lipids-25-30, dietary_fiber-1-5]).


% ---------
% Utilities
% ---------
% Sort a given list w.r.t. the second input parameter
ordered_list(List, OrderedList) :-
    predsort(compare_second_param, List, OrderedList).

% Compare a sublist w.r.t the second input parameter
compare_second_param(Order, Sublist1, Sublist2) :-
    nth0(1, Sublist1, Param1),
    nth0(1, Sublist2, Param2),
    compare(Order, Param2, Param1).

order_list_by_values(Values, Keys, OrderedList) :-
    map_list(Values, Keys, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, OrderedList).

map_list([], [], []).
map_list([Value|Values], [Key|Keys], [Value-Key|Rest]) :-
    map_list(Values, Keys, Rest).

% Predicato per confrontare due elementi [_, Value1] e [_, Value2]
compare_values(Order, [_, Value1], [_, Value2]) :-
    compare(Order, Value2, Value1).

% Creates an empty list of N elements/days
create_days_list(0, []).
create_days_list(N, [[] | Rest]) :-
    N > 0,
    NextN is N - 1,
    create_days_list(NextN, Rest).

% Given a list, where each element is a list, returns the index of the shortest element (among the first and the n-th elements).
find_shortest_list_index(Lists, N, Index) :-
    (   Lists = []
    ->  Index = 1  
    ;   find_shortest_list_index(Lists, N, 1, inf, -1, Index)
    ).
% After analyzing all elements within the given list, returns the index of the shortest one
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

% Given a list of lists, adds an element to the shortest element.
add_element_to_shortest(List, _, 0, List). 
add_element_to_shortest(List, Element, Max, Result) :-
    find_shortest_list_index(List, Max, ShortestIndex),
    nth1(ShortestIndex, List, ElementList),
    append(ElementList, [Element], NewShortestList),
    replace_list(List, ShortestIndex, NewShortestList, Result).

% Given a list of lists and a specifed index, replaces a list with a new one
replace_list(OriginalList, Index, NewList, ResultList) :-
    replace_list_helper(OriginalList, Index, NewList, 1, ResultList).

% The original list is empty
replace_list_helper([], _, _, _, []).
% The given element is the list to be substitued
replace_list_helper([_|Rest], Index, NewList, Index, [NewList|RestResult]) :-
    NextIndex is Index + 1,
    replace_list_helper(Rest, Index, NewList, NextIndex, RestResult).
% The given element is not the list to be substitued
replace_list_helper([X|Rest], Index, NewList, CurrIndex, [X|RestResult]) :-
    CurrIndex \= Index,
    NextIndex is CurrIndex + 1,
    replace_list_helper(Rest, Index, NewList, NextIndex, RestResult).

% Process the file's content and find specific instances
read_relationships(ListRelationships) :-
    findall(has(DailyDiet, FoodBeverage, IngredientsList), has(DailyDiet, FoodBeverage, IngredientsList), ListRelationships).

select_elements_with_pattern([], _, []).
select_elements_with_pattern([Element | Rest], Pattern, [Element | RestSelected]) :-
    Element =.. [has, FirstArg | _], FirstArg = Pattern,
    select_elements_with_pattern(Rest, Pattern, RestSelected).
select_elements_with_pattern([_ | Rest], Pattern, SelectedElements) :-
    select_elements_with_pattern(Rest, Pattern, SelectedElements).

get_list_relationships(DailyDiet, ListRelationships) :-
    read_relationships(TotalList),   
    !,
    select_elements_with_pattern(TotalList, DailyDiet, ListRelationships).

% ---------
% Calories
% ---------
% Gets the standard calories amount in a given Food or Beverage
standard_calories_quantity(FoodBeverage, Quantity) :-
    attribute_value(dietplanner, FoodBeverage, calories, Quantity).

% Convert the calories content to the actual quantity in the given portion size
actual_calories_quantity(FoodBeverage, PortionSizeGrams, ActualQuantity) :-
    standard_calories_quantity(FoodBeverage, QuantityPer100),
    ActualQuantity is (PortionSizeGrams / 100) * QuantityPer100.

% TODO: comment
set_calories_week([], _, _, []).
set_calories_week([Day|Rest], BMI, EnergyValue, [TotalCalories|Tail]) :-
    set_right_number_calories(BMI, EnergyValue, ActivityDurationList, BaseCalories),
    set_calories_day(Day, BMI, TotalEffort),
    TotalCalories is TotalEffort + BaseCalories,
    set_calories_week(Rest, BMI, EnergyValue, Tail).

% TODO: comment
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

% Generates a list with the maximum amount of calories per days
generate_list_calories_week(PersonID, TotalCaloriesList) :-
    find_bmi_energyeffort_dayon(PersonID, BMI, EnergyValue, NumberDayOn),
    get_activities(PersonID, ActivityList),
    length(ActivityList, Length),
    (Length =\= 0 -> 
        distribute_activities(NumberDayOn, ActivityList, DistributedList)
    ; 
        create_days_list(7, DistributedList)),
    set_calories_week(DistributedList, BMI, EnergyValue, TotalCaloriesList).

% Given the daily amount of calories, distributes them among meals
get_daily_diet_calories(TotalDayCalories, DailyCalories) :-
    BreakfastCalories is TotalDayCalories * 0.20,
    MorningSnackCalories is TotalDayCalories * 0.08,
    LunchCalories is TotalDayCalories * 0.40,
    AfternoonSnackCalories is TotalDayCalories * 0.08,
    DinnerCalories is TotalDayCalories * 0.24,
    DailyCalories = [BreakfastCalories, MorningSnackCalories, LunchCalories, AfternoonSnackCalories, DinnerCalories].

% Given a list of ingredients for a dish, computes its actual calories amount
compute_actual_dish_calories([], ActualCalories, ActualCalories).
compute_actual_dish_calories([FoodBeverage-Grams | Rest], PartialCalories, ActualCalories) :-
    actual_calories_quantity(FoodBeverage, Grams, Calories),
    NewPartialCalories is PartialCalories + Calories,
    compute_actual_dish_calories(Rest, NewPartialCalories, ActualCalories).


% ---------
% Nutrient
% ---------
% Convert the nutrient content to the actual quantity in the given portion size
actual_nutrient_quantity(FoodBeverage, Nutrient, PortionSizeGrams, ActualQuantity) :-
    has_nutrient(FoodBeverage, Nutrient, NutrientContentPer100),
    ActualQuantity is (PortionSizeGrams / 100) * NutrientContentPer100.

% Calculate cumulative nutrient quantity for a specified macro nutrient category
cumulative_macro_nutrient_quantity(FoodGramsList, MacroNutrient, CumulativeQuantity) :-
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    cumulative_macro_nutrient_quantity(FoodGramsList, Nutrients, 0, CumulativeQuantity).
% Base case: When no nutrients are left to process, the cumulative quantity is 0.
cumulative_macro_nutrient_quantity(_, [], CumulativeQuantity, CumulativeQuantity).
% Recursive case: Calculate the cumulative quantity for the first nutrient in the category.
cumulative_macro_nutrient_quantity(FoodGramsList, [Nutrient|Rest], PartialCumulativeQuantity, CumulativeQuantity) :-
    cumulative_nutrient_quantity(FoodGramsList, Nutrient, NutrientQuantity),
    NewPartialCumulativeQuantity is PartialCumulativeQuantity + NutrientQuantity,
    cumulative_macro_nutrient_quantity(FoodGramsList, Rest, NewPartialCumulativeQuantity, CumulativeQuantity).

% Calculate the cumulative quantity of a specific nutrient in a list of food-grams pairs.
cumulative_nutrient_quantity(FoodGramsList, Nutrient, CumulativeQuantity) :-
    compute_nutrient_quantity(FoodGramsList, Nutrient, 0, CumulativeQuantity).
% Base case: When the list is empty, the cumulative quantity is 0.
compute_nutrient_quantity([], _, CumulativeQuantity, CumulativeQuantity).
% Recursive case: Calculate the cumulative quantity for the first pair in the list.
compute_nutrient_quantity([FoodBeverage-Grams|Rest], Nutrient, PartialCumulativeQuantity, CumulativeQuantity) :-
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
    compute_nutrient_quantity(Rest, Nutrient, NewPartialCumulativeQuantity, CumulativeQuantity).


% Get total nutrient percentage in a daily diet
daily_diet_total_nutrient_percentage(DailyDiet, MacroNutrient, TotalNutrientQuantity) :-
    unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients), 
    writeln('Macro'),
    writeln(MacroNutrient),
    cumulative_nutrient_quantity(UniqueIngredients, MacroNutrient, TotalNutrientQuantity),
    !.


% ---------
% Allergen
% ---------
collect_allergen_names(Names) :-
    findall(Name, allergen_instance(_, _, Name), Names).

% Get person's allergies
get_person_allergies(Person, Allergies) :-
    findall(Allergen, is_allergic(Person, Allergen), Allergies).

% ---------
% Activities
% ---------
% Gets a list of activity names
collect_activities_names(Names) :-
    findall(Name, activity_instance(_, _, Name), Names).

% Gets the list of activities carried out of a given person
get_activities(PersonID, ActivityList) :-
    (   setof([Activity-Hours, Frequency],
                carry_out(PersonID, Activity-Hours, Frequency),
                ActivityList)
        ->  true;   
        ActivityList = []
    ).

% Equally distribuites the activities over 7 days
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    DaysPerWeek > 0,
    !,
    % Create an empty list for 7 days
    create_days_list(7, EmptyList),  
    % Sort the activity list w.r.t. their frequency
    sort_activity_list(ActivityList, SortedActivityList),  
    distribute_activities_recursive(DaysPerWeek, SortedActivityList, EmptyList, DistributedList).
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    writeln('Error: the number of days is not valid'), 
    fail.

% Sort the activity list without removing duplicates
sort_activity_list(ActivityList, SortedActivityList) :-
    predsort(compare_activity_frequency, ActivityList, SortedActivityList).

% Compare two activity frequencies
compare_activity_frequency(Order, [_, Frequency1], [_, Frequency2]) :-
    compare(OrderFreq, Frequency2, Frequency1),
    (OrderFreq = (=) -> compare(OrderName, [_, Name1], [_, Name2]), Order = OrderName ; Order = OrderFreq).

% Distributes the activities
distribute_activities_recursive(_, [], DistributedList, DistributedList). 
distribute_activities_recursive(DaysPerWeek, [[Activity-Hours, Frequency] | RestActivities], EmptyList, DistributedList) :-
    distribute_activity(Activity-Hours, Frequency, DaysPerWeek, EmptyList, TempDistributedList),
    distribute_activities_recursive(DaysPerWeek, RestActivities, TempDistributedList, DistributedList).

% Distributes an activity according to hours and a list of days
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

% TODO: comment
create_week(PersonID, Week) :-
    attribute_value(dietplanner, PersonID, number_day_on, NumeberDayOn),
    create_days_list(7, EmptyDay),
    ordered_list(ActivityList, OrderedList),
    distribute_sorted_activities(OrderedList, EmptyDay, NumeberDayOn, Week).


% ---------
% Person
% ---------
% Get the id of a person given his/her name and surname
find_person_id(Name, Surname, PersonID) :-
    person_instance(dietplanner, person, PersonID),
    attribute_value(dietplanner, PersonID, name, Name),
    attribute_value(dietplanner, PersonID, surname, Surname),
    !.
find_person_id(_, _, false).

% Compute Needed Calories for a Person (basal metabolism)
compute_needed_calories(Person, NeededCalories) :-
    % Get the person's data
    attribute_value(dietplanner, Person, name, PersonName),
    attribute_value(dietplanner, Person, name, PersonSurname),
    attribute_value(dietplanner, Person, age, Age),
    attribute_value(dietplanner, Person, gender, Gender),
    attribute_value(dietplanner, Person, height, Height),
    attribute_value(dietplanner, Person, weight, Weight),
    
    % Load constants according to person's gender
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

    % Compute needed calories
    BMR is Constant + (WeightFactor * Weight) + (HeightFactor * Height) - (AgeFactor * Age),
    NeededCalories is BMR.

% TODO: comment
find_bmi_energyeffort_dayon(PersonID, BMIValue, EnergyValue, NumberDayOn) :-
    attribute_value(dietplanner, PersonID, bmi, BMIValue),
    attribute_value(dietplanner, PersonID, energy_demand, EnergyValue),
    attribute_value(dietplanner, PersonID, number_day_on, NumberDayOn),
    !.


% ---------
% Dish
% ---------
% Get the list of ingredients in a dish of a daily diet as a flat list
get_ingredients_in_dish(ListRelationships, Dish, Ingredients) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, Dishes), % Get the list of dishes
    select_ingredients(IngredientLists, Dishes, Dish, Ingredients),
    !.

select_ingredients([], [], _, []).
select_ingredients([Head|Tail], [First|Rest], Dish, Ingredients) :-
    (
        First = Dish ->
            Ingredients = Head,
            !
        ;
        select_ingredients(Tail, Rest, Dish, Ingredients)
    ).
    

% Get unique ingredients and cumulative quantities for a daily diet
unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients) :-
    get_list_relationships(DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, _, [], _, Dishes), % Get the list of dishes
    remove_duplicates(Dishes, FinalDishes),
    accumulate_ingredients(ListRelationships, FinalDishes, [], UniqueIngredients).

% Helper predicate to accumulate ingredients from a list of dishes
accumulate_ingredients(_, [], Acc, Acc).
accumulate_ingredients(ListRelationships, [Dish|Rest], Acc, UniqueIngredients) :-
    get_ingredients_in_dish(ListRelationships, Dish, Ingredients), % Get ingredients in the dish
    accumulate_ingredients(ListRelationships, Rest, Acc, UpdatedAcc),
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

% Get the list of ingredients in a dish of a daily diet as a flat list
get_foodbeverages_in_dish(Dish, FoodBeverageList) :-
    findall(FoodBeverage, made_of(Dish, FoodBeverage, _, _), FoodBeverageList).

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
    is_contained(Allergen, FoodBeverage),
    member(Allergen, Allergens).

% Get dishes whose ingredients don't contain allergens a specific person is allergic to
get_dishes_without_allergens_for_person(Person, DishType, DishesWithoutAllergens) :-
    get_person_allergies(Person, Allergies),
    get_dishes_without_allergens(Allergies, DishType, DishesWithoutAllergens).

% Get a random dish from a list of candidate dishes
get_random_dish_in_list(DishList, Dish) :-
    length(DishList, Length),
    random(1, Length, Index),
    nth(Index, DishList, Dish).

% Given a person, returns the list of dishes excluding those containing allergens the person is allergic to
get_daily_diet_dishes(_, [], DailyDietDishes, DailyDietDishes).
get_daily_diet_dishes(Person, [DishType | Rest], Acc, DailyDietDishes) :-
    get_dishes_without_allergens_for_person(Person, DishType, DishList),
    get_random_dish_in_list(DishList, Dish),
    append(Acc, [Dish], NewAcc),
    get_daily_diet_dishes(Person, Rest, NewAcc, DailyDietDishes).

% Get the old ingredient list of a given Dish in a specified DailyDiet
get_old_ingredient_list_and_modify_macro(_, [], _, _, OldRelatioships, NewRelatioships, OldRelatioships, NewRelatioships).
get_old_ingredient_list_and_modify_macro(DailyDiet, [Head|Tail], Fix, MacroNutrient, AccOldRel, AccNewRel, OldRelatioships, NewRelatioships) :-
    has(DailyDiet, Head, IngredientsList),
    find_ingredient_with_highest_nutrient(IngredientsList, MacroNutrient, FoodWithMoreNutrient),
    change_ingredient_nutrient_grams(Head, IngredientsList, Fix, FoodWithMoreNutrient, [], TempIngredientList),
    append(AccOldRel, [IngredientsList], NewAccOldRel),
    append(AccNewRel, [TempIngredientList], NewAccNewRel),    
    get_old_ingredient_list_and_modify_macro(DailyDiet, Tail, Fix, MacroNutrient, NewAccOldRel, NewAccNewRel, OldRelatioships, NewRelatioships).



get_old_new_relationship([], [], _, 0).
get_old_new_relationship([OldRel | Rest], [NewRel | Tail], OldRel, NewRel) :-
    OldRel \== NewRel.
get_old_new_relationship([OldRel | Rest], [NewRel | Tail], OldIngredientList, NewIngredientList) :-
    get_old_new_relationship(Rest, Tail, OldIngredientList, NewIngredientList).

% Fix dish grams accoridng to MacroNutrient check results
fix_macronutrients_grams(NewId, ListDish, DefaultDish, MacroNutrient, Fix) :-
    writeln('APPENA ENTRATO NEL fix'),
    get_old_ingredient_list_and_modify_macro(NewId, ListDish, Fix, MacroNutrient, [], [], OldRelatioships, NewRelatioships),
    
    writeln('--Macronutrient'),
    writeln(MacroNutrient),
    writeln('--OldRelatioships'),
    writeln(OldRelatioships),
    writeln('--NewRelatioships'),
    writeln(NewRelatioships),

    get_old_new_relationship(OldRelatioships, NewRelatioships, OldIngredientList, NewIngredientList),

    writeln('--OldIngredientList'),
    writeln(OldIngredientList),
    writeln('--NewIngredientList'),
    writeln(NewIngredientList),

    !,
    has(NewId, Dish, OldIngredientList),
    (
        NewIngredientList = 0 ->
        (
            has(NewId, DefaultDish, IngredientList),
            find_ingredient_with_highest_nutrient(IngredientList, MacroNutrient, FoodWithMoreNutrient),
            default_case_fix(FoodWithMoreNutrient, Fix, IngredientList, [], DefaultIngredientList),
            retract(has(NewId, DefaultDish, IngredientList)),
            assertz(has(NewId, DefaultDish, DefaultIngredientList)),
            
            writeln('Default case:'),
            writeln(has(NewId, DefaultDish, IngredientList)),
            writeln(has(NewId, DefaultDish, DefaultIngredientList))
            
        )
        ;
        (
            retract(has(NewId, Dish, OldIngredientList)),
            assertz(has(NewId, Dish, NewIngredientList)),

            writeln('Old relation'),
            writeln(has(NewId, Dish, OldIngredientList)),
            writeln('New relation'),
            writeln(has(NewId, Dish, NewIngredientList))
        )
    ).


% Gets the Food in a list of ingredients (Aliments) which has the highest content of a given macronutrient
find_ingredient_with_highest_nutrient(Aliments, MacroNutrient, FoodWithMore) :- 
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    findall(Content-Food, (member(Food-Gram, Aliments), member(Nutrient, Nutrients), has_nutrient(Food, Nutrient, Content)), NutrientContentPairs),
    keysort(NutrientContentPairs, SortedPairs),
    reverse(SortedPairs, [Content-FoodWithMore | _]).

get_old_ingredient_list_and_modify_calories(_, [], _, _, OldRelationships, NewRelationships, OldRelationships, NewRelationships).
get_old_ingredient_list_and_modify_calories(DailyDiet, [Head|Tail], Fix, MacroNutrient, AccOldRel, AccNewRel, OldRelationships, NewRelationships) :-
    has(DailyDiet, Head, IngredientsList),
    find_ingredient_with_more_calories(IngredientsList, FoodWithMoreCalories),

    writeln('--Fix'),
    writeln(Fix),
    writeln('--FoodWithMoreCalories'),
    writeln(FoodWithMoreCalories),

    change_ingredient_calories_grams(Head, IngredientsList, Fix, FoodWithMoreCalories, [], TempIngredientList),

    writeln('--TempIngredientList'),
    writeln(TempIngredientList),

    append(AccOldRel, [IngredientsList], NewAccOldRel),
    append(AccNewRel, [TempIngredientList], NewAccNewRel), 
    get_old_ingredient_list_and_modify_calories(DailyDiet, Tail, Fix, MacroNutrient, NewAccOldRel, NewAccNewRel, OldRelationships, NewRelationships).



find_ingredient_with_more_calories([], MaxFoodBeverage, MaxFoodBeverage).
find_ingredient_with_more_calories([FoodBeverage-Grams | Rest], CurrentMax, FoodWithMoreCalories) :-
    attribute_value(dietplanner, FoodBeverage, calories, CaloriesFood),
    (
        CaloriesFood > CurrentMax ->
            find_ingredient_with_more_calories(Rest, FoodBeverages, CaloriesFood, MaxFoodBeverage)
        ;
            find_ingredient_with_more_calories(Rest, FoodBeverages, CurrentMax, MaxFoodBeverage)
        
    ).

default_case_fix(_, _, [], NewIngredientList, NewIngredientList).
default_case_fix(Food, Fix, [FoodBeverage-Grams | Rest], Acc, NewIngredientList) :-
    (
        FoodBeverage = Food,
        (
            % If Fix = 1, Decrease by 5%
            Fix = 1,
            NewGrams is (Grams * 90) / 100
        ;
            % If Fix = -1, Increase by 5%
            Fix = -1,
            NewGrams is (Grams * 110) / 100
        )
        ;
        NewGrams = Grams
    ),
    IntegerNewGrams is round(NewGrams),
    append(Acc, [FoodBeverage-IntegerNewGrams], NewAcc),
    default_case_fix(Food, Fix, Rest, NewAcc, NewIngredientList),
    !.


% Fix dish grams accoridng to Calories check results
fix_calories_grams(NewId, ListDish, DefaultDish, Fix) :-
    get_old_ingredient_list_and_modify_calories(NewId, ListDish, Fix, [], [], OldRelatioships, NewRelatioships),
    get_old_new_relationship(OldRelatioships, NewRelatioships, OldIngredientList, NewIngredientList),
    has(NewId, Dish, OldIngredientList),
    (
        NewIngredientList = 0 ->
        (            
            has(NewId, DefaultDish, IngredientList),
            find_ingredient_with_more_calories(IngredientList, FoodWithMoreCalories),
            default_case_fix(FoodWithMoreCalories, Fix, IngredientList, [], DefaultIngredientList),
            !,
            writeln(has(NewId, DefaultDish, IngredientList)),
            writeln(has(NewId, DefaultDish, DefaultIngredientList)), 
            retract(has(NewId, DefaultDish, IngredientList)),
            assertz(has(NewId, DefaultDish, DefaultIngredientList))
        )
        ;
        (
            retract(has(NewId, Dish, OldIngredientList)),
            assertz(has(NewId, Dish, NewIngredientList)),
            
            writeln('Old relation'),
            writeln(has(NewId, Dish, OldIngredientList)),
            writeln('New relation'),
            writeln(has(NewId, Dish, NewIngredientList))
        )
    ).
    

change_ingredient_nutrient_grams(_, [], _, _, NewIngredientList, NewIngredientList).
change_ingredient_nutrient_grams(Dish, [FoodBeverage-Grams | Rest], Fix, FoodWithMoreNutrient, Acc, NewIngredientList) :-
    made_of(Dish, FoodWithMoreNutrient, Min, Max),
    (
        FoodBeverage = FoodWithMoreNutrient,
        (
            % If Fix = 1, Decrease by 5%
            (Fix = 1) ->
            (
                NewGrams is (Grams * 90) / 100,
                ((NewGrams >= Min, NewGrams =< Max) ->
                    true
                ;
                    NewGrams = Grams
                )
            )
            ;
            % If Fix = -1, Increase by 5%
            (Fix = -1) ->
            (
                NewGrams is (Grams * 110) / 100,
                ((NewGrams >= Min, NewGrams =< Max) ->
                    true
                ;
                    NewGrams = Grams
                )
            )
        )
        ;
        % Else (FoodBeverage è diverso da FoodWithMore)
        NewGrams = Grams
    ),
    IntegerNewGrams is round(NewGrams),
    append(Acc, [FoodBeverage-IntegerNewGrams], NewAcc),
    change_ingredient_nutrient_grams(Dish, Rest, Fix, FoodWithMoreNutrient, NewAcc, NewIngredientList).

change_ingredient_calories_grams(_, [], _, _, NewIngredientList, NewIngredientList).  % La versione iniziale aveva 5 argomenti, ho aggiunto un 5° argomento per restituire il risultato.
change_ingredient_calories_grams(Dish, [FoodBeverage-Grams | Rest], Fix, FoodWithMoreCalories, Acc, NewIngredientList) :-
    made_of(Dish, FoodWithMoreCalories, Min, Max),
    (
        % If Fix = 1, Decrease by 5%
        (Fix = 1) ->
        (
            NewGrams is (Grams * 90) / 100,
            ((NewGrams >= Min, NewGrams =< Max) ->
                true
            ;
                NewGrams = Grams
            )
        )
        ;
        % If Fix = -1, Increase by 5%
        (Fix = -1) ->
        (
            NewGrams is (Grams * 110) / 100,
            ((NewGrams >= Min, NewGrams =< Max) ->
                true
            ;
                NewGrams = Grams
            )
        )
    ),
    IntegerNewGrams is round(NewGrams),
    append(Acc, [FoodBeverage-IntegerNewGrams], NewAcc),
    change_ingredient_calories_grams(Dish, Rest, Fix, FoodWithMoreCalories, NewAcc, NewIngredientList),  % Chiamata ricorsiva


% Returns the the list of calories, where each element corresponds to the calories of a dish (represented by its ingredients)
get_dish_calories_lists([], CaloriesList, CaloriesList).
get_dish_calories_lists([Ingredients | Rest], Acc, CaloriesList) :-
    compute_actual_dish_calories(Ingredients, 0, ActualCalories),
    IntegerCalories is round(ActualCalories),
    append(Acc, [IntegerCalories], NewAcc),
    get_dish_calories_lists(Rest, NewAcc, CaloriesList).

% Returns the most caloric dish in a daily diet
get_ordered_list_dish_by_calories(ListRelationships, FinalListDish) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, DishList),
    get_dish_calories_lists(IngredientLists, MacroNutrient, [], CaloriesList),
    order_list_by_values(CaloriesList, DishList, FinalListDish).
    
% Returns the dish with the highest macronutrient quantity in a daily diet
get_ordered_list_dish_by_nutrient(ListRelationships, MacroNutrient, FinalListDish) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, DishList),
    get_dish_macronutrient_amount_lists(IngredientLists, MacroNutrient, [], MacroNutrientQuantityList),
    order_list_by_values(MacroNutrientQuantityList, DishList, FinalListDish).   

% Returns the list of macronutrient quantities, where each element represents a dish
get_dish_macronutrient_amount_lists([], _, CaloriesList, CaloriesList).
get_dish_macronutrient_amount_lists([Ingredients | Rest], MacroNutrient, Acc, CaloriesList) :-
    cumulative_macro_nutrient_quantity(Ingredients, MacroNutrient, Quantity),
    IntegerQuantity is round(Quantity),
    append(Acc, [IntegerQuantity], NewAcc),
    get_dish_macronutrient_amount_lists(Rest, MacroNutrient, NewAcc, CaloriesList).

% Generate ingredients' grams for all dishes in a daily diet
set_grams_for_dish(_, []).
set_grams_for_dish(NewId, [Dish | RestDish]) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    actual_foodbeverage_grams(FoodBeverageList, Dish, [], IngredientLists), 
    !,
    assertz(has(NewId, Dish, IngredientLists)),
    set_grams_for_dish(NewId, RestDish).
 

% Computes the ingredient's grams given the final daily calories
actual_foodbeverage_grams([], _, IngredientLists, IngredientLists).
actual_foodbeverage_grams([FoodBeverage | Rest], Dish, Acc, IngredientLists) :-
    made_of(Dish, FoodBeverage, Min, _),
    append(Acc, [FoodBeverage-Min], NewAcc),
    actual_foodbeverage_grams(Rest, Dish, NewAcc, IngredientLists).

% ---------
% Daily Diet
% ---------
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

% Generate a daily diet for a person
generate_daily_diet(_, [], []).
generate_daily_diet(Person, [NewId | RestNames], [TotalDayCalories | Rest]) :-
    dish_types(DishTypes),
    healthy_weight_nutrient_percentages(MacronutrientLimits),
    
    get_daily_diet_dishes(Person, DishTypes, [], DailyDietDishes),
    get_daily_diet_calories(TotalDayCalories, DailyCalories),
    set_grams_for_dish(NewId, DailyDietDishes),
    
    writeln('-----------------------'),
    writeln('Dopo set_grams_for_dish'),

    check_and_fix_daily_diet(NewId, MacronutrientLimits, DailyCalories),

    writeln('Ho fixato tutto'),
    writeln('-----------------------'),
    
    !,
    generate_daily_diet(Person, RestNames, Rest).

% Checks Macronutrients and Calories contraints and fix the generated daily diet
check_and_fix_daily_diet(NewId, MacronutrientLimits, DailyCalories) :-
    repeat,
    (
        check_daily_macronutrient(NewId, DailyCalories, MacronutrientLimits, MacronutrientResult, FailedMacroNutrient),
        check_daily_calories(NewId, DailyCalories, CaloryResult),
        (
            MacronutrientResult = 0, CaloryResult = 0 ->
                writeln('Daily Diet generated successfully'),
                !
            ;
            MacronutrientResult = -1    ->
                fix_macronutient(NewId, FailedMacroNutrient, MacronutrientResult)
            ;
            MacronutrientResult = 1     ->
                fix_macronutient(NewId, FailedMacroNutrient, MacronutrientResult)
            ;
            CaloryResult = -1    ->
                fix_calories(NewId, CaloriesResult)
            ;
            CaloryResult = 1     ->
                fix_calories(NewId, CaloriesResult)
        )
    ). % Fail to exit the repeat loop.


% Fix dish grams w.r.t. macronutrient checks
fix_macronutient(NewId, MacroNutrient, MacronutrientResult) :-
    writeln('Diet does not meet Macronutrients constraints, regenerating...'),
    get_list_dish_by_nutrient(NewId, MacroNutrient, ListDish),
    nth0(0, ListDish, DefaultDish),
    fix_macronutrients_grams(NewId, ListDish, DefaultDish, MacroNutrient, MacronutrientResult),
    !,
    fail.

% Fix dish grams w.r.t. calories checks
fix_calories(NewId, CaloriesResult) :-
    writeln('Diet does not meet Calories constraints, regenerating...'),
    get_list_dish_by_calories(NewId, ListDish),
    nth0(0, ListDish, DefaultDish),
    fix_calories_grams(NewId, ListDish, DefaultDish, CaloryResult),
    !,
    fail.

% Read a file and find specific instances
get_list_dish_by_calories(DailyDiet, ListDish) :-
    get_list_relationships(DailyDiet, ListRelationships),
    get_ordered_list_dish_by_calories(ListRelationships, ListDish).

% Predicate to read a file and find specific instances
get_list_dish_by_nutrient(DailyDiet, MacroNutrient, ListDish) :-
    get_list_relationships(DailyDiet, ListRelationships),
    get_ordered_list_dish_by_nutrient(ListRelationships, MacroNutrient, ListDish).

% Given a list of terms, gets the list of ingredients and a list of dishes
extract_ingredients_and_dishes([], AllIngredients, AllDishes, AllIngredients, AllDishes).
extract_ingredients_and_dishes([Term | Rest], AccIngredients, AccDishes, AllIngredients, AllDishes) :-
    Term = has(_, Dish, Ingredients),
    append(AccIngredients, [Ingredients], NewIngredient),
    append(AccDishes, [Dish], NewDish),
    extract_ingredients_and_dishes(Rest, NewIngredient, NewDish, AllIngredients, AllDishes).

convert_grams_in_calories(MacroNutrient, TotalNutrientQuantity, TotalCalories) :-
    (   MacroNutrient = lipids ->
            TotalCalories is (TotalNutrientQuantity * 9)
        ;   
        MacroNutrient = dietary_fiber ->    
            TotalCalories is TotalNutrientQuantity 
        ;   
            TotalCalories is (TotalNutrientQuantity * 5)
    ).

% Checks that the macronutrient quantity in a daily diet is between a specified range
check_macronutrient_helper(DailyDiet, DailyCalories, MacroNutrient, LowerBound, UpperBound, Result) :-
    unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients), 
    sum_list(DailyCalories, DayCalories),
    !,
    cumulative_macro_nutrient_quantity(UniqueIngredients, MacroNutrient, TotalNutrientQuantity),
    convert_grams_in_calories(MacroNutrient, TotalNutrientQuantity, TotalCalories),

    Min is round((DayCalories * LowerBound) / 100),
    Max is round((DayCalories * UpperBound) / 100),

    (
        TotalCalories < Min ->
        TempResult is -1
        ;
        TotalCalories > Max ->
        TempResult is 1
        ;
        TotalCalories >= Min, TotalCalories =< Max ->
        TempResult is 0 
    ),

    Result = TempResult,
    
    writeln('Result'),
    writeln(Result),
    writeln('TotalCalories'),
    writeln(TotalCalories),
    writeln('Min'),
    writeln(Min),
    writeln('Max'),
    writeln(Max).


% Caso base: se la lista è vuota, e non ci sono altre macro da controllare, la funzione restituisce 0 (nessun errore).
check_daily_macronutrient(_, _, [], 0, _) :-
    writeln('TUTTO CORRRETOOOOOOO'),
    !.

% Caso ricorsivo: se il check del macronutriente corrente fallisce (InnerResult \= 0), 
% la funzione restituisce l'InnerResult e il MacroNutrient corrente come FailedMacroNutrient.
check_daily_macronutrient(DailyDiet, DailyCalories, [MacroNutrient-LowerBound-UpperBound | Rest], Result, FailedMacroNutrient) :-
    writeln('--- sto esaminando un elemento della lista dei vincoli ---'),
    check_macronutrient_helper(DailyDiet, DailyCalories, MacroNutrient, LowerBound, UpperBound, InnerResult),
    (
        InnerResult \= 0 
        ->
            Result = InnerResult,
            FailedMacroNutrient = MacroNutrient,
            !  % Blocca ulteriori backtracking
        ;
            check_daily_macronutrient(DailyDiet, DailyCalories, Rest, Result, FailedMacroNutrient)
    ).


% Checks that the calories in a daily diet is between a specified range
check_daily_calories(DailyDiet, DailyCalories, Result) :-
    get_list_relationships(DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, [], _, IngredientLists, _),
    check_dish_calories(IngredientsList, DailyCalories, Result),
    !.

% Checks calories constraints among dishes, stopping the execution when the result is different from 0, meaning that some check failed
check_dish_calories([], _, 0).
check_dish_calories([Ingredients | RestIngredients], [DishCalories | RestCalories], Result) :-
    compute_actual_dish_calories(Ingredients, 0, ActualCalories),
    (
        ActualCalories =< DishCalories - 40   ->
        InnerResult is -1
    ;
        ActualCalories >= DishCalories + 1    ->
        InnerResult is 1
    ;
        ActualCalories >= DishCalories - 40, ActualCalories =< DishCalories + 1 ->
        InnerResult is 0
    ),
    (InnerResult = 0 ->
        check_dish_calories(RestIngredients, RestCalories, Result)
        ;
        Result = InnerResult % Pass along the non-zero result
    ).
check_dish_calories(_, _, Result) :- 
    Result \= 0, 
    !.


init_diet(Name, Surname, Type, Person, Structure) :-
    find_person_id(Name, Surname, Person),
    atomic_concat('diet_', Person, DietName),
    atomic_concat('Diet for ', Name, Temp),
    atomic_concat(Temp, ' ', Temp1),
    atomic_concat(Temp1, Surname, TotalName),
    Structure = [diet_instance(dietplanner, diet, DietName),
                attribute_value(dietplanner, DietName, name, TotalName),
                attribute_value(dietplanner, diet_nome, type, Type),
                daily_diet_instance(dietplanner, daily_diet, daily_diet1),
                attribute_value(dietplanner, daily_diet1, name, 'Daily Diet 1'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet2),
                attribute_value(dietplanner, daily_diet2, name, 'Daily Diet 2'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet3),
                attribute_value(dietplanner, daily_diet3, name, 'Daily Diet 3'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet4),
                attribute_value(dietplanner, daily_diet4, name, 'Daily Diet 4'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet5),
                attribute_value(dietplanner, daily_diet5, name, 'Daily Diet 5'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet6),
                attribute_value(dietplanner, daily_diet6, name, 'Daily Diet 6'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet7),
                attribute_value(dietplanner, daily_diet7, name, 'Daily Diet 7'),
                made_for(DietName, Person),
                suggested_diet(Person, DietName),
                composed_of(DietName, daily_diet1),
                composed_of(DietName, daily_diet2),
                composed_of(DietName, daily_diet3),
                composed_of(DietName, daily_diet4),
                composed_of(DietName, daily_diet5),
                composed_of(DietName, daily_diet6),
                composed_of(DietName, daily_diet7)].

% ---------
% Diet
% ---------
% Compute the diet for a specific person
compute_diet(Name, Surname, Type, Structure, Instances) :-
    init_diet(Name, Surname, Type, Person, Structure),
    generate_list_calories_week(Person, TotalWeekCaloriesList),
    daily_diet_names(DailyDietNames),
    retractall(has(_, _, _)),
    !,
    generate_daily_diet(Person, DailyDietNames, TotalWeekCaloriesList),
    read_relationships(Instances),
    writeln(Instances).   