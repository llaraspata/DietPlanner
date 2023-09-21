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
daily_diet_names([daily_diet1, daily_diet2]).

% Checks on generated Daily Diet
healthy_weight_nutrient_percentages([carbs-45-65, protein-15-20, lipids-20-35, dietary_fiber-1-5]).


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

% Writes a new relationship to a file
add_new_relationship(NewRelationship, FileName) :-
	assertz(NewRelationship),
    writeln('ha scritto'),
    writeln(NewRelationship),
	open(FileName, append, Stream),
    format(Stream, '~w.~n', [NewRelationship]),
	close(Stream).

% Delete the content of a specified file
delete_file_content(FileName) :-
    open(FileName, write, Stream),
    close(Stream),
    writeln('File content deleted successfully').

% Predicato per escludere elementi con il Pattern specificato dalla lista
exclude_items_with_pattern([], _, []).
exclude_items_with_pattern([Item | Rest], Pattern, Excluded) :-
    Item =.. [FirstArg | _],  % Estrae il primo argomento dell'Item
    \+ FirstArg = Pattern,    % Controlla se il primo argomento non corrisponde al Pattern
    exclude_items_with_pattern(Rest, Pattern, RestExcluded),
    Excluded = [Item | RestExcluded].
exclude_items_with_pattern([_ | Rest], Pattern, Excluded) :-
    exclude_items_with_pattern(Rest, Pattern, Excluded).

% Predicato per eliminare dalla lista degli elementi il DailyDiet specificato e scrivere il risultato su un file
delete_daily_diet(FileName, DailyDiet) :-
    open(FileName, read, Stream),
    read_relationships_from_file(Stream, [], TotalList),
    close(Stream),
    writeln('ciao'),
    writeln(TotalList),
    open(FileName, write, WriteStream),
    exclude_items_with_pattern(TotalList, DailyDiet, ExcludedList),
    maplist(write_relationship(WriteStream), ExcludedList),
    close(WriteStream),
    writeln('cazzo'),
    writeln(ExcludedList),
    writeln('File content updated successfully').


% Predicato per sostituire un predicato specifico con uno nuovo in una lista
replace_specific_predicate([], _, _, []).
replace_specific_predicate([OldPredicate | Rest], OldPredicate, NewPredicate, [NewPredicate | RestModified]) :-
    replace_specific_predicate(Rest, OldPredicate, NewPredicate, RestModified).
replace_specific_predicate([Predicate | Rest], OldPredicate, NewPredicate, [Predicate | RestModified]) :-
    replace_specific_predicate(Rest, OldPredicate, NewPredicate, RestModified).

% Writes a list of relationships in a specified file
write_relationship([], _).
write_relationship([Relationship | Rest], FileName) :-
    add_new_relationship(Relationship, FileName),
    write_relationship(Rest, FileName).

% Process the file's content and find specific instances
read_relationships_from_file(Stream, Acc, ListRelationships) :-
    \+ at_end_of_stream(Stream),
    read(Stream, Term),
    ( Term \= end_of_file
    ->
        append(Acc, [Term], NewAcc) 
    ;
        NewAcc = Acc
    ),
    read_relationships_from_file(Stream, NewAcc, ListRelationships).
read_relationships_from_file(_, ListRelationships, ListRelationships) :-
    !.

select_elements_with_pattern([], _, []).
select_elements_with_pattern([Element | Rest], Pattern, [Element | RestSelected]) :-
    Element =.. [has, FirstArg | _], FirstArg = Pattern,
    select_elements_with_pattern(Rest, Pattern, RestSelected).
select_elements_with_pattern([_ | Rest], Pattern, SelectedElements) :-
    select_elements_with_pattern(Rest, Pattern, SelectedElements).

get_list_relationships_in_file(Stream, DailyDiet, ListRelationships) :-
    read_relationships_from_file(Stream, [], TotalList),   
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

% Compute the total calories about a list of foods 
compute_calories_amount([], 0).
compute_calories_amount([Food|Rest], TotalCalories) :-
    attribute_value(dietplanner, Food, calories, CaloriesFood),
    compute_calories_amount(Rest, RestCalories),
    TotalCalories is RestCalories + CaloriesFood.

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

% Compute the cumulative macro nutrient quantity as a percentage
cumulative_macro_nutrient_percentage(FoodGramsList, MacroNutrient, Percentage) :-
    % Calculate the cumulative macro nutrient quantity
    cumulative_macro_nutrient_quantity(FoodGramsList, MacroNutrient, MacroNutrientQuantity),
    total_grams(FoodGramsList, TotalQuantity),
    % Calculate the percentage
    Percentage is (100 * MacroNutrientQuantity) / TotalQuantity.

% Compute the total grams in a list of food-grams pairs
total_grams(FoodGramsList, Total) :-
    total_grams(FoodGramsList, 0, Total).
% Base case: When the list is empty, the total grams is 0.
total_grams([], Total, Total).
% Recursive case: Calculate the total grams for the first pair in the list.
total_grams([_Food-Grams|Rest], PartialTotal, Total) :-
    NewPartialTotal is PartialTotal + Grams,
    total_grams(Rest, NewPartialTotal, Total).

% Get total nutrient percentage in a daily diet
daily_diet_total_nutrient_percentage(FileName, DailyDiet, MacroNutrient, TotalPercentage) :-
    unique_ingredients_in_daily_diet(FileName, DailyDiet, UniqueIngredients), 
    cumulative_macro_nutrient_percentage(UniqueIngredients, MacroNutrient, TotalPercentage),
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
    select_ingredients(IngredientLists, Dishes, Dish, Ingredients).

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
unique_ingredients_in_daily_diet(FileName, DailyDiet, UniqueIngredients) :-
    open(FileName, read, Stream),
    get_list_relationships_in_file(Stream, DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, _, [], _, Dishes), % Get the list of dishes
    remove_duplicates(Dishes, FinalDishes),
    accumulate_ingredients(ListRelationships, FinalDishes, [], UniqueIngredients),
    close(Stream).

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
    get_dishes_without_allergens(Allergens, DishType, DishesWithoutAllergens).

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
    append(Acc, [Dish], NewAcc ),
    get_daily_diet_dishes(Person, Rest, NewAcc, DailyDietDishes).

equal_lists([], []).
equal_lists([X|Xs], [X|Ys]) :- 
    equal_lists(Xs, Ys).

% Get the old ingredient list of a given Dish in a specified DailyDiet
get_old_ingredient_list_and_modify_macro(_, [], _, _, _, _, _, _).
get_old_ingredient_list_and_modify_macro(DailyDiet, [Head|Tail], ListRelationships, Fix, MacroNutrient, Dish, IngredientsList, NewIngredientList) :-
    member(Relation, ListRelationships),
    Relation = has(DailyDiet, Head, IngredientsList),
    Dish = Head,
    find_ingredient_with_highest_nutrient(IngredientsList, MacroNutrient, FoodWithMoreNutrient),
    change_ingredient_nutrient_grams(Head, IngredientsList, Fix, FoodWithMoreNutrient, [], NewIngredientList),
    (equal_lists(IngredientsList, NewIngredientList) ->
        get_old_ingredient_list_and_modify_macro(DailyDiet, Tail, ListRelationships, Fix, MacroNutrient, Dish, [], [])
    ;
        !
    ).

% Fix dish grams accoridng to Macrnutrient check results
fix_macronutrients_grams(NewId, FileName, ListDish, MacroNutrient, Fix, FinalRelationships) :-
    open(FileName, read, Stream),
    get_list_relationships_in_file(Stream, NewId, ListRelationships),
    !,
    close(Stream),
    get_old_ingredient_list_and_modify_macro(NewId, ListDish, ListRelationships, Fix, MacroNutrient, Dish, OldIngredientList, NewIngredientList),
    OldRelationship = has(NewId, Dish, OldIngredientList),
    NewRelationship = has(NewId, Dish, NewIngredientList),
    replace_specific_predicate(ListRelationships, OldRelationship, NewRelationship, FinalRelationships).

% Gets the Food in a list of ingredients (Aliments) which has the highest content of a given macronutrient
find_ingredient_with_highest_nutrient(Aliments, MacroNutrient, FoodWithMore) :- 
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    findall(Content-Food, (member(Food-Gram, Aliments), member(Nutrient, Nutrients), has_nutrient(Food, Nutrient, Content)), NutrientContentPairs),
    keysort(NutrientContentPairs, SortedPairs),
    reverse(SortedPairs, [Content-FoodWithMore | _]).

get_old_ingredient_list_and_modify_calories(_, [], _, _, _, _, _).
get_old_ingredient_list_and_modify_calories(DailyDiet, [Head|Tail], ListRelationships, Fix, Dish, IngredientsList, NewIngredientList) :-
    member(Relation, ListRelationships),
    Relation = has(DailyDiet, Head, IngredientsList),
    Dish = Head,
    change_ingredient_calories_grams(Head, IngredientsList, Fix, [], NewIngredientList),
    (equal_lists(IngredientsList, NewIngredientList) ->
        get_old_ingredient_list_and_modify_calories(DailyDiet, Tail, ListRelationships, Fix, Dish, [], [])
    ;
        !
    ).

% Fix dish grams accoridng to Calories check results
fix_calories_grams(NewId, FileName, ListDish, Fix, FinalRelationships) :-
    open(FileName, read, Stream),
    get_list_relationships_in_file(Stream, NewId, ListRelationships),
    !,
    close(Stream),
    get_old_ingredient_list_and_modify_calories(NewId, ListDish, ListRelationships, Fix, Dish, OldIngredientList, NewIngredientList),
    OldRelationship = has(NewId, Dish, OldIngredientList),
    NewRelationship = has(NewId, Dish, NewIngredientList),
    replace_specific_predicate(ListRelationships, OldRelationship, NewRelationship, FinalRelationships).

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
            ;
            % If Fix = 0
            (Fix = 0) ->
            (
                NewGrams = Grams
            )
        )
        ;
        % Else (FoodBeverage è diverso da FoodWithMore)
        NewGrams = Grams
    ),
    IntegerNewGrams is round(NewGrams),
    append(Acc, [FoodBeverage-IntegerNewGrams], NewAcc),
    change_ingredient_nutrient_grams(Dish, Rest, Fix, FoodWithMoreNutrient, NewAcc, NewIngredientList).

change_ingredient_calories_grams(_, [], _, NewIngredientList, NewIngredientList).  % La versione iniziale aveva 5 argomenti, ho aggiunto un 5° argomento per restituire il risultato.
change_ingredient_calories_grams(Dish, [FoodBeverage-Grams | Rest], Fix, Acc, NewIngredientList) :-
    made_of(Dish, FoodWithMoreNutrient, Min, Max),
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
        ;
        % If Fix = 0
        (Fix = 0) ->
        (
            NewGrams = Grams
        )
    ),
    IntegerNewGrams is round(NewGrams),
    append(Acc, [FoodBeverage-IntegerNewGrams], NewAcc),
    change_ingredient_calories_grams(Dish, Rest, Fix, NewAcc, NewIngredientList),  % Chiamata ricorsiva


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
    cumulative_macro_nutrient_percentage(Ingredients, MacroNutrient, Percentage),
    IntegerPercentage is round(Percentage),
    append(Acc, [IntegerPercentage], NewAcc),
    get_dish_macronutrient_amount_lists(Rest, MacroNutrient, NewAcc, CaloriesList).

% Generate ingredients' grams for all dishes in a daily diet
set_grams_for_dish(_, []).
set_grams_for_dish(NewId, [Dish | RestDish]) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    actual_foodbeverage_grams(FoodBeverageList, Dish, [], IngredientLists), 
    NewRelationship = has(NewId, Dish, IngredientLists),
    !,
    add_new_relationship(NewRelationship, 'temp_computed_diet.pl'),
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
generate_daily_diet(_, [], _, []).
generate_daily_diet(Person, [NewId | RestNames], FileName, [TotalDayCalories | Rest]) :-
    dish_types(DishTypes),
    healthy_weight_nutrient_percentages(MacronutrientLimits),
    
    get_daily_diet_dishes(Person, DishTypes, [], DailyDietDishes),
    get_daily_diet_calories(TotalDayCalories, DailyCalories),  
    set_grams_for_dish(NewId, DailyDietDishes),
    
    check_and_fix_daily_diet(FileName, NewId, MacronutrientLimits, DailyCalories),
    

    generate_daily_diet(Person, RestNames, FileName, Rest).

% Checks Macronutrients and Calories contraints and fix the generated daily diet
check_and_fix_daily_diet(FileName, NewId, MacronutrientLimits, DailyCalories) :-
    repeat,
        (
            check_macronutrient_percentage(FileName, NewId, MacronutrientLimits, MacronutrientResult, MacroNutrient),
            check_daily_calories(FileName, NewId, DailyCalories, CaloryResult),
            (
                MacronutrientResult = 0, CaloryResult = 0 ->
                    !,
                    writeln('Diet generated successfully')
                ;
                MacronutrientResult = -1    ->
                    fix_macronutient(FileName, NewId, MacroNutrient, MacronutrientResult)
                ;
                MacronutrientResult = 1     ->
                    fix_macronutient(FileName, NewId, MacroNutrient, MacronutrientResult)
                ;
                CaloryResult = -1    ->
                    fix_calories(FileName, NewId, CaloriesResult)
                ;
                CaloryResult = 1     ->
                    fix_calories(FileName, NewId, CaloriesResult)
            )
        ).

% Fix dish grams w.r.t. macronutrient checks
fix_macronutient(FileName, NewId, MacroNutrient, MacronutrientResult) :-
    writeln('Diet does not meet Macronutrients constraints, regenerating...'),
    read_file_and_get_list_dish_by_nutrient(FileName, NewId, MacroNutrient, ListDish),
    %(FileName, NewId),
    fix_macronutrients_grams(NewId, FileName, ListDish, MacroNutrient, MacronutrientResult, FinalRelationships),
    writeln('inizio'),
    writeln(FinalRelationships),
    writeln('fine'),
    !,
    write_relationship(FinalRelationships, FileName).

% Fix dish grams w.r.t. calories checks
fix_calories(FileName, NewId, CaloriesResult) :-
    writeln('Diet does not meet Calories constraints, regenerating...'),
    read_file_and_get_list_dish_by_calories(FileName, NewId, ListDish),
    fix_calories_grams(NewId, FileName, ListDish, CaloryResult, FinalRelationships),
    !,
    get_list_relationships_in_file(Stream, DailyDiet, ListRelationships),
    write_relationship(FinalRelationships, FileName).

% Read a file and find specific instances
read_file_and_get_list_dish_by_calories(FileName, DailyDiet, ListDish) :-
    open(FileName, read, Stream),
    get_list_relationships_in_file(Stream, DailyDiet, ListRelationships),
    close(Stream),
    get_ordered_list_dish_by_calories(ListRelationships, ListDish).

% Predicate to read a file and find specific instances
read_file_and_get_list_dish_by_nutrient(FileName, DailyDiet, MacroNutrient, ListDish) :-
    open(FileName, read, Stream),
    get_list_relationships_in_file(Stream, DailyDiet, ListRelationships),
    close(Stream),
    get_ordered_list_dish_by_nutrient(ListRelationships, MacroNutrient, ListDish).

% Given a list of terms, gets the list of ingredients and a list of dishes
extract_ingredients_and_dishes([], AllIngredients, AllDishes, AllIngredients, AllDishes).
extract_ingredients_and_dishes([Term | Rest], AccIngredients, AccDishes, AllIngredients, AllDishes) :-
    Term = has(_, Dish, Ingredients),
    append(AccIngredients, [Ingredients], NewIngredient),
    append(AccDishes, [Dish], NewDish),
    extract_ingredients_and_dishes(Rest, NewIngredient, NewDish, AllIngredients, AllDishes).

% Checks that the macronutrient quantity (in percentage) in a daily diet is between a specified range
check_macronutrient_helper(FileName, DailyDiet, MacroNutrient, LowerBound, UpperBound, Result) :-
    daily_diet_total_nutrient_percentage(FileName, DailyDiet, MacroNutrient, Percentage),
    (
        Percentage < LowerBound ->
        TempResult is -1
        ;
        Percentage > UpperBound ->
        TempResult is 1
        ;
        Percentage >= LowerBound, Percentage =< UpperBound ->
        TempResult is 0 
    ),
    Result = TempResult.

% Checks different macronutrients constraints, stopping the execution when the result is different from 0, meaning that some check failed
check_macronutrient_percentage(_, _, [], 0, _).
check_macronutrient_percentage(FileName, DailyDiet, [MacroNutrient-LowerBound-UpperBound | Rest], Result, MacroNutrient) :-
    check_macronutrient_helper(FileName, DailyDiet, MacroNutrient, LowerBound, UpperBound, InnerResult),
    (InnerResult = 0 ->
        check_macronutrient_percentage(FileName, DailyDiet, Rest, Result, MacroNutrient)
        ;
        Result = InnerResult
    ).
check_macronutrient_percentage(_, _, _, Result, _) :- 
    Result \= 0, 
    !.

% Checks that the calories in a daily diet is between a specified range
check_daily_calories(FileName, DailyDiet, DailyCalories, Result) :-
    open(FileName, read, Stream),
    get_list_relationships_in_file(Stream, DailyDiet, ListRelationships),
    close(Stream),
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


% ---------
% Diet
% ---------
% Compute the diet for a specific person
compute_diet(Name, Surname) :-
    find_person_id(Name, Surname, Person),
    generate_list_calories_week(Person, TotalWeekCaloriesList),
    !,
    daily_diet_names(DailyDietNames),
    FileName = 'temp_computed_diet.pl',
    delete_file_content(FileName),
    generate_daily_diet(Person, DailyDietNames, FileName, TotalWeekCaloriesList).