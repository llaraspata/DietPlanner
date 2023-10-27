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

% List of different types of dishes in a day
dish_types([breakfast, snack, lunch, snack, dinner]).
% Names for daily diets for a week
daily_diet_names([daily_diet1, daily_diet2, daily_diet3, daily_diet4, daily_diet5, daily_diet6, daily_diet7]).

% List of recommended nutrient percentages for maintaining a healthy weight
% Format: nutrient-lower_percentage-upper_percentage
healthy_weight_nutrient_percentages([carbs-40-55, protein-20-30, lipids-20-30, dietary_fiber-0.5-3]).
% List of recommended nutrient percentages for a hyperproteic (high protein) diet
hyperproteic_nutrient_percentages([carbs-30-40, protein-35-60, lipids-20-30, dietary_fiber-0.5-3]).

% ---------
% Utilities
% ---------

% Sorts a given list 'List' based on the second element of its sublists.
% Uses 'predsort' with a custom comparator 'compare_second_param'.
ordered_list(List, OrderedList) :-
    predsort(compare_second_param, List, OrderedList).

% Compares the second element of two sublists 'Sublist1' and 'Sublist2'.
% 'Order' is the result of the comparison: '<', '=', or '>'.
% Note that the comparison is done in descending way.
compare_second_param(Order, Sublist1, Sublist2) :-
    nth0(1, Sublist1, Param1),
    nth0(1, Sublist2, Param2),
    compare(Order, Param2, Param1).

% Creates an ordered list 'OrderedList' by mapping 'Values' to corresponding 'Keys',
% then sorts them by keys and finally extracts the ordered values.
order_list_by_values(Values, Keys, OrderedList) :-
    map_list(Values, Keys, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, DescSortedPairs),
    reverse(DescSortedPairs, OrderedList).

% Maps each value in 'Values' to its corresponding key in 'Keys'.
map_list([], [], []).
map_list([Value|Values], [Key|Keys], [Value-Key|Rest]) :-
    map_list(Values, Keys, Rest).

% Flattens a nested list into a single-level list.
flatten_list([], []).
flatten_list([H|T], FlatList) :-
    flatten_list(T, NewFlatList),
    append(H, NewFlatList, FlatList).

% Creates an empty list of N elements/days
create_days_list(0, []) :- !.
create_days_list(N, [[] | Rest]) :-
    N > 0,
    NextN is N - 1,
    create_days_list(NextN, Rest).

% Given a list, where each element is a list, returns the index of the shortest element (among the first and the n-th elements).
find_shortest_list_index(Lists, N, Index) :-
    (   Lists = []
        ->  
            Index = 1  
        ;
            find_shortest_list_index(Lists, N, 1, 9999, -1, Index)
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
    findall(has(DailyDiet, Dish, IngredientsList), has(DailyDiet, Dish, IngredientsList), ListRelationships).

% Base case: Empty list returns an empty list.
select_elements_with_pattern([], _, []).

% Recursive case 1: If the 'Element' matches the pattern, include it in the result list.
select_elements_with_pattern([Element | Rest], Pattern, [Element | RestSelected]) :-
    Element =.. [has, FirstArg | _],  % Decomposes 'Element' for pattern checking.
    FirstArg = Pattern,               % Checks if the element matches the 'Pattern'.
    !,                                % Cut to prevent backtracking once this rule is chosen.
    select_elements_with_pattern(Rest, Pattern, RestSelected).

% Recoursive case 2: Skip the 'Element' if it doesn't match the pattern.
select_elements_with_pattern([_ | Rest], Pattern, SelectedElements) :-
    select_elements_with_pattern(Rest, Pattern, SelectedElements).

% Retrieves the total list of relationships using 'read_relationships',
% then filters this list to keep only the relationships associated with 'DailyDiet'.
get_list_relationships(DailyDiet, ListRelationships) :-
    read_relationships(TotalList),   
    !, % Cut to ensure determinism and prevent backtracking.
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

% Calculates the total calories for each day in a week, considering both the individual's base calorie needs 
% and the calories related to daily activities.
set_calories_week([], _, _, []).
set_calories_week([Day|Rest], BMI, EnergyValue, [TotalCalories|Tail]) :-
    set_right_number_calories(BMI, EnergyValue, ActivityDurationList, BaseCalories),
    set_calories_day(Day, BMI, TotalEffort),
    TotalCalories is TotalEffort + BaseCalories,
    !,
    set_calories_week(Rest, BMI, EnergyValue, Tail).

% Determines the ideal caloric intake for an individual based on their BMI and a base EnergyValue. 
% If provided with a list of activities, it also considers the calories associated with those activities to adjust the total. 
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

% Computes the total effort in terms of calories for a given day's activities based on the BMI. 
% For each activity, the function fetches the standard calories burn rate for one hour and adjusts it 
% based on the individual's BMI before summing up the day's total.
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

% Generates a list of total caloric intake for each day in a week for a given person.
generate_list_calories_week(PersonID, TotalCaloriesList) :-
    find_bmi_energyeffort_dayon(PersonID, BMI, EnergyValue, NumberDayOn),
    get_activities(PersonID, ActivityList),
    length(ActivityList, Length),
    !,
    (Length =\= 0 -> 
        distribute_activities(NumberDayOn, ActivityList, DistributedList)
    ; 
        create_days_list(7, DistributedList)),
    set_calories_week(DistributedList, BMI, EnergyValue, TotalCaloriesList).

% Breaks down the total daily caloric intake into meal-specific calories counts.
get_daily_diet_calories(TotalDayCalories, DailyCalories) :-
    BreakfastCalories is TotalDayCalories * 0.20,
    MorningSnackCalories is TotalDayCalories * 0.08,
    LunchCalories is TotalDayCalories * 0.40,
    AfternoonSnackCalories is TotalDayCalories * 0.08,
    DinnerCalories is TotalDayCalories * 0.24,
    DailyCalories = [BreakfastCalories, MorningSnackCalories, LunchCalories, AfternoonSnackCalories, DinnerCalories].

% Computes the total caloric content of a dish based on its individual food items and their quantities.
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

% Calculate cumulative nutrient quantity for a specified macronutrient category
cumulative_macro_nutrient_quantity(FoodGramsList, MacroNutrient, CumulativeQuantity) :-
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    cumulative_macro_nutrient_quantity(FoodGramsList, Nutrients, 0, CumulativeQuantity).
cumulative_macro_nutrient_quantity(_, [], CumulativeQuantity, CumulativeQuantity).
cumulative_macro_nutrient_quantity(FoodGramsList, [Nutrient|Rest], PartialCumulativeQuantity, CumulativeQuantity) :-
    % Calculate the cumulative quantity for the first nutrient in the category.
    cumulative_nutrient_quantity(FoodGramsList, Nutrient, NutrientQuantity), 
    NewPartialCumulativeQuantity is PartialCumulativeQuantity + NutrientQuantity,
    cumulative_macro_nutrient_quantity(FoodGramsList, Rest, NewPartialCumulativeQuantity, CumulativeQuantity).

% Calculate the cumulative quantity of a specific nutrient in a list of food-grams pairs.
cumulative_nutrient_quantity(FoodGramsList, Nutrient, CumulativeQuantity) :-
    compute_nutrient_quantity(FoodGramsList, Nutrient, 0, CumulativeQuantity).
compute_nutrient_quantity([], _, CumulativeQuantity, CumulativeQuantity).
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
    compute_nutrient_quantity(Rest, Nutrient, NewPartialCumulativeQuantity, CumulativeQuantity).

% Helper predicate to accumulate micronutrient from a list
accumulate_micronutrient_content_from_list([], FinalContentFoodList, FinalContentFoodList).
accumulate_micronutrient_content_from_list([Content-Food-Grams|Rest], Acc, FinalContentFoodList) :-
    % Check if the micronutrient is already in the accumulated list
    (member(ExistingContent-Food-Grams, Acc) ->
        NewContent is ExistingContent + Content,
        select(ExistingContent-Food-Grams, Acc, TempAcc), % Remove the old entry
        append(TempAcc, [NewContent-Food-Grams], UpdatedAcc)
    ;
        append(Acc, [Content-Food-Grams], UpdatedAcc)
    ),
    accumulate_micronutrient_content_from_list(Rest, UpdatedAcc, FinalContentFoodList),
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
    create_days_list(7, EmptyList),  
    sort_activity_list(ActivityList, SortedActivityList),  % Sort the activity list w.r.t. their frequency
    !,
    distribute_activities_recursive(DaysPerWeek, SortedActivityList, EmptyList, DistributedList).
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    fail.

% Sort the activity list without removing duplicates
sort_activity_list(ActivityList, SortedActivityList) :-
    predsort(compare_activity_frequency, ActivityList, SortedActivityList).

% Compare two activity frequencies
compare_activity_frequency(Order, [_, Frequency1], [_, Frequency2]) :-
    compare(OrderFreq, Frequency2, Frequency1),
    (OrderFreq = (=) -> compare(OrderName, [_, Name1], [_, Name2]), Order = OrderName ; Order = OrderFreq).

% Distributes the given list of activities across the week based on their frequency,
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

% Retrieves the BMI value, energy demand, and number of active days for a given person's ID.
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

% Retrieves the list of ingredients for a specified dish from a list of ingredients and their corresponding dishes.
select_ingredients([], [], _, []).
select_ingredients([Head|Tail], [First|Rest], Dish, Ingredients) :-
    (
        First = Dish ->     % If the current dish matches the specified dish
            Ingredients = Head,  
            !               
        ;
        select_ingredients(Tail, Rest, Dish, Ingredients) 
    ).

% Get unique ingredients and cumulative quantities for a daily diet
unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients) :-
    get_list_relationships(DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, _, [], _, Dishes),
    remove_duplicates(Dishes, FinalDishes),
    accumulate_ingredients(ListRelationships, FinalDishes, [], UniqueIngredients).

% Helper predicate to accumulate ingredients from a list of dishes
accumulate_ingredients(_, [], Acc, Acc).
accumulate_ingredients(ListRelationships, [Dish|Rest], Acc, UniqueIngredients) :-
    get_ingredients_in_dish(ListRelationships, Dish, Ingredients),
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
    findall(FoodBeverage, made_of(Dish, FoodBeverage, _, _), FoodBeverageListWithDuplicates),
    remove_duplicates(FoodBeverageListWithDuplicates, FoodBeverageList).

% Define a predicate to get dishes whose ingredients do not contain a list of allergens
get_dishes_without_allergens(Allergens, DishType, DishesWithoutAllergens) :-
    findall(Dish, (
        dish_instance(dietplanner, dish, Dish),
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
get_daily_diet_dishes(_, _, [], DailyDietDishes, DailyDietDishes).
get_daily_diet_dishes(Person, DietTypes, [DishType | Rest], Acc, DailyDietDishes) :-
    get_dishes_without_allergens_for_person(Person, DishType, DishList),
    fix_dishes_with_dietary_restrictions(DietTypes, DishList, NewDishList),
    get_random_dish_in_list(NewDishList, Dish),
    append(Acc, [Dish], NewAcc),
    get_daily_diet_dishes(Person, DietTypes, Rest, NewAcc, DailyDietDishes).

% Retrieves all foods that are 'meats'.
get_meat_foods(MeatFoods) :-
    findall(Food, foodbeverage_instance(dietplanner, meats, Food), MeatFoods).

% Retrieves all foods that are 'fish_seafood'.
get_fish_seafood_foods(FishSeafoodFoods) :-
    findall(Food, foodbeverage_instance(dietplanner, fish_seafood, Food), FishSeafoodFoods).

% Adjusts the provided DishList based on dietary restrictions specified in DietTypes.
fix_dishes_with_dietary_restrictions(DietTypes, DishList, NewDishList) :-
    (
        member(no_meat_diet, DietTypes) 
        ->
            remove_meat(DishList, [], NewDishList)
        ;
        member(no_fish_seafood_diet, DietTypes) 
        ->
            remove_fish_seafood(DishList, [], NewDishList)
        ;
        member(vegetarian_diet, DietTypes) 
        ->
            remove_meat_and_fish_seafood(DishList, [], NewDishList)
        ;
        member(vegan_diet, DietTypes) 
        ->
            remove_animal_derived(DishList, [], NewDishList)
        ;
            NewDishList = DishList
    ).

% Given an initial dish list, return the list of dishes which do not contain meat
remove_meat([], NewDishList, NewDishList).
remove_meat([Dish | Rest], Acc, NewDishList) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    get_meat_foods(MeatFoods),
    has_food_category(MeatFoods, FoodBeverageList, [], MeatFood),
    length(MeatFood, Length),
    (
        Length > 0
        -> 
            NewAcc = Acc
        ;
            append(Acc, [Dish], NewAcc)
    ),
    remove_meat(Rest, NewAcc, NewDishList).

% Given an initial dish list, return the list of dishes which do not contain fish and seafood
remove_fish_seafood([], NewDishList, NewDishList).
remove_fish_seafood([Dish | Rest], Acc, NewDishList) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    get_fish_seafood_foods(FishSeafoodFoods),
    has_food_category(FishSeafoodFoods, FoodBeverageList, [], FishFood),
    length(FishFood, Length),
    (
        Length > 0
        -> 
            NewAcc = Acc
        ;
            append(Acc, [Dish], NewAcc)
    ),
    remove_fish_seafood(Rest, NewAcc, NewDishList).

% Given an initial dish list, return the list of dishes which do not contain meat, and fish and seafood
remove_meat_and_fish_seafood(DishList, [], NewDishList) :-
    remove_meat(DishList, [], TempDishList),
    remove_fish_seafood(TempDishList, [], NewDishList).

% Given an initial dish list, return the list of dishes which do not contain animale derived food
remove_animal_derived(DishList, [], NewDishList) :-
    remove_meat(DishList, [], DishListNoMeat),
    remove_fish_seafood(DishListNoMeat, [], TempDishList),
    remove_animal_derived_helper(TempDishList, [], NewDishList).

remove_animal_derived_helper([], NewDishList, NewDishList).
remove_animal_derived_helper([Dish | Rest], Acc, NewDishList) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    get_animal_derived_foods(AnimalDerivedFoods),
    has_food_category(AnimalDerivedFoods, FoodBeverageList, [], AnimalDerivedFood),
    length(AnimalDerivedFood, Length),
    (
        Length > 0
        -> 
            NewAcc = Acc
        ;
            append(Acc, [Dish], NewAcc)
    ),
    remove_animal_derived_helper(Rest, NewAcc, NewDishList).

% Retrieves a list of all foods that have nutrients derived from animals, including red meat, egg, and dairy proteins.
% The final list, AnimalDerivedFoods, will not have any duplicates.
get_animal_derived_foods(AnimalDerivedFoods) :-
    findall(
        Food, 
        (
            has_nutrient(Food, red_meat_protein, _)
            ;
            has_nutrient(Food, egg_protein, _)
            ;
            has_nutrient(Food, dairy_protein, _)
        ), 
        AnimalDerivedFoodsWithDuplicates
    ),
    remove_duplicates(AnimalDerivedFoodsWithDuplicates, AnimalDerivedFoods).

% Filters and returns foods from a list that belong to a specific category, defined by the FoodInCategory list.
has_food_category(_, [], List, List).
has_food_category(FoodInCategory, [Food | Rest], Acc, List) :-
    (
        member(Food, FoodInCategory)
        ->
            append(Acc, [Food], NewAcc)
        ;
            NewAcc = Acc
    ),
    has_food_category(FoodInCategory, Rest, NewAcc, List).

% TODO: controllare se la funzione serve
% Searches through a daily diet's dishes to identify and modify the quantity of ingredients based on their macro-nutrient content.
get_old_new_ingredient_list_by_nutrient(DailyDiet, [Head|Tail], Fix, MacroNutrient, OldRel, NewRel) :-
    has(DailyDiet, Head, IngredientsList),
    find_ingredients_sorted_by_nutrient(IngredientsList, MacroNutrient, OrderedList),
    is_not_empty(OrderedList),
    change_ingredient_grams(Head, OrderedList, Fix, [], TempIngredientList),
    IngredientsList \== TempIngredientList,
    OldRel = IngredientsList, 
    NewRel = TempIngredientList,
    !.
get_old_new_ingredient_list_by_nutrient(DailyDiet, [_|Tail], Fix, MacroNutrient, OldIngredientList, NewIngredientList) :-
    get_old_new_ingredient_list_by_nutrient(DailyDiet, Tail, Fix, MacroNutrient, OldIngredientList, NewIngredientList).
get_old_new_ingredient_list_by_nutrient(_, [], _, _, _, []) :- !.

% This function iterates through each dish in the daily diet and updates the grams of ingredients based on their macronutrient content.
fix_macronutrients_grams(DailyDiet, [], MacroNutrient, Fix). % Ends the recursion when there are no dishes left to process.
fix_macronutrients_grams(DailyDiet, [Dish | Rest], MacroNutrient, Fix) :- 
    has(DailyDiet, Dish, IngredientsList),
    % Modifies the quantity of ingredients based on the given fix and the macro-nutrient.
    change_ingredient_grams_macronutrient(Dish, IngredientsList, Fix, [], NewIngredientList), 
    % Removes the original relation of the dish and its ingredients from the knowledg base.
    retract(has(DailyDiet, Dish, IngredientsList)),
    % Adds the new relation of the dish and its modified ingredients list to the knowledg base.
    assertz(has(DailyDiet, Dish, NewIngredientList)), 
    fix_macronutrients_grams(DailyDiet, Rest, MacroNutrient, Fix),
    !. 

% This function computes the micronutrient content of a given food item and its quantity in grams, 
% and returns a list of the micronutrient contents for each specified micronutrient.
get_micronutrient_content_list(_, [], Contents, Contents).
get_micronutrient_content_list(Food-Gram, [Nutrient | Rest], Acc, Contents) :-
    findall(Content-Food-Gram, (has_nutrient(Food, Nutrient, Content)), TempContents),
    append(Acc, TempContents, NewAcc),
    get_micronutrient_content_list(Food-Gram, Rest, NewAcc, Contents),
    !.

% This function aggregates the nutrient content for a list of foods and their respective quantities in grams. 
% For each food in the list, it collects the content of specified nutrients and accumulates these results in a list of pairs.
collect_nutrient_content([], _, NutrientContentPairs, NutrientContentPairs).
collect_nutrient_content([Food-Gram | Rest], Nutrients, Acc, NutrientContentPairs) :-
    get_micronutrient_content_list(Food-Gram, Nutrients, [], Contents),
    (
        % If the retrieved content list is empty (i.e., no nutrient content was found for the food),
        % it appends a default value of '0' for that food and nutrient combination.
        length(Contents, 0) 
        ->
            append(Acc, [0-Food-Gram], NewAcc)
        ;
        % If the content list is not empty, appends the retrieved contents to the accumulator list.
            append(Acc, Contents, NewAcc)
    ),
    !, % The cut ensures that once the rule succeeds for a given food, Prolog will not backtrack to explore other possible paths.
    collect_nutrient_content(Rest, Nutrients, NewAcc, NutrientContentPairs).

% This function retrieves a list of ingredients sorted based on their content of a specified macronutrient.
% It starts by collecting all nutrients that belong to a given macronutrient category, computes the content 
% of these nutrients for each ingredient in the input list, and then sorts the ingredients based on this content.
find_ingredients_sorted_by_nutrient(Aliments, MacroNutrient, SortedFood) :- 
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    collect_nutrient_content(Aliments, Nutrients, [], NutrientContentPairs),
    keysort(NutrientContentPairs, SortedPairs),
    accumulate_micronutrient_content_from_list(SortedPairs, [], FinalSortedPairs),
    reverse(FinalSortedPairs, DescSortedPairs),
    extract_pairs_values(DescSortedPairs, SortedFood).

% It extracts the food names and their grams from pairs that are prefixed with nutrient content
% and produces a new list containing just the values.
extract_pairs_values([], []).
extract_pairs_values([_-Food-Gram | T1], [Food-Gram | T2]) :-
    extract_pairs_values(T1, T2).

% This function retrieves the ingredients list of dishes from a given daily diet and sorts it based on calories content.
% Then, it adjusts the amount (grams) of the ingredients to meet a certain caloric target (defined by the 'Fix' parameter).
% Finally, it provides the old and new ingredient lists for the dishes that required adjustments.
get_old_new_ingredient_list_by_calories(DailyDiet, ListDish, Fix, OldRel, NewRel) :-
    has(DailyDiet, Head, IngredientsList),
    sort_ingredients_by_calories(IngredientsList, OrderedList),
    is_not_empty(OrderedList),
    change_ingredient_grams(Head, OrderedList, Fix, [], TempIngredientList),
    IngredientsList \== TempIngredientList,
    OldRel = IngredientsList, 
    NewRel = TempIngredientList,
    !.
get_old_new_ingredient_list_by_calories(DailyDiet, [_|Tail], Fix, MacroNutrient, OldIngredientList, NewIngredientList) :-
    get_old_new_ingredient_list_by_calories(DailyDiet, Tail, Fix, MacroNutrient, OldIngredientList, NewIngredientList).
get_old_new_ingredient_list_by_calories(_, [], _, _, _, 0).

% This function sorts a list of ingredients based on their calories in ascending way.
sort_ingredients_by_calories([], []).
sort_ingredients_by_calories([Head|Tail], SortedList) :-
    sort_ingredients_by_calories(Tail, SortedTail),
    insert_ingredient(Head, SortedTail, SortedList).

% Insert a new element into a sorted list, resulting in a new sorted list.
% The function uses the 'attribute_value' predicate to fetch the calories of the ingredients. 
% Based on the calories comparison, the function determines the correct position to insert the ingredient into the list.
insert_ingredient(FoodBeverage-Grams, [], [FoodBeverage-Grams]).
insert_ingredient(FoodBeverage1-Grams1, [FoodBeverage2-Grams2 | Tail], [FoodBeverage1-Grams1, FoodBeverage2-Grams2 | Tail]) :-
    attribute_value(dietplanner, FoodBeverage1, calories, Calories1),
    attribute_value(dietplanner, FoodBeverage2, calories, Calories2),
    Calories1 =< Calories2.
insert_ingredient(FoodBeverage1-Grams1, [FoodBeverage2-Grams2 | Tail], [FoodBeverage2-Grams2 | NewTail]) :-
    attribute_value(dietplanner, FoodBeverage1, calories, Calories1),
    attribute_value(dietplanner, FoodBeverage2, calories, Calories2),
    Calories1 > Calories2,
    insert_ingredient(FoodBeverage1-Grams1, Tail, NewTail).

% This function modifies the grams of a specific ingredient in a list based on a given Fix value.
%  If the ingredient is not found or the Fix value does not match the conditions, the grams remain unchanged.
default_case_fix(_, _, [], NewIngredientList, NewIngredientList).
default_case_fix(Food, Fix, [FoodBeverage-Grams | Rest], Acc, NewIngredientList) :-
    (
        FoodBeverage = Food,
        (
            % If Fix = 1, Decrease by 5%
            Fix = 1,
            NewGrams is floor((Grams * 90) / 100)
        ;
            % If Fix = -1, Increase by 5%
            Fix = -1,
            NewGrams is ceiling((Grams * 110) / 100)
        )
        ;
        NewGrams = Grams
    ),
    !,
    append(Acc, [FoodBeverage-NewGrams], NewAcc),
    default_case_fix(Food, Fix, Rest, NewAcc, NewIngredientList).


% This function is responsible for fixing the calories in the grams of ingredients for a given dish in a user's diet.
%
% The function operates as follows:
% 1. For a given dish, it tries to get the old and new ingredient list where the calories are adjusted.
% 2. If the adjustment leads to an empty new ingredient list, it adjusts the default dish the ingredient with the highest calories.
% 3. If the new ingredient list is not empty, it updates the user's diet with the adjusted ingredients.
fix_calories_grams(NewId, ListDish, DefaultDish, Fix) :-
    get_old_new_ingredient_list_by_calories(NewId, ListDish, Fix, OldRel, NewRel),
    has(NewId, Dish, OldIngredientList),
    (
        length(NewIngredientList, 0) ->
        (            
            has(NewId, DefaultDish, IngredientList),
            sort_ingredients_by_calories(IngredientList, OrderedList),
            nth0(0, OrderedList, FoodWithMoreCalories),
            default_case_fix(FoodWithMoreCalories, Fix, IngredientList, [], DefaultIngredientList),
            !,
            retract(has(NewId, DefaultDish, IngredientList)),
            assertz(has(NewId, DefaultDish, DefaultIngredientList))
        )
        ;
        (
            retract(has(NewId, Dish, OldIngredientList)),
            assertz(has(NewId, Dish, NewIngredientList))
        )
    ).

% This function adjusts the grams of each ingredient in a dish based on the given Fix value, while ensuring 
% the adjusted grams lie within predefined minimum and maximum bounds for that dish and ingredient.
% And if the quantity cannot be adjusted within these bounds, it remains unchanged.
change_ingredient_grams(_, [], _, NewIngredientList, NewIngredientList).
change_ingredient_grams(Dish, [FoodBeverage-Grams | Rest], Fix, Acc, NewIngredientList) :-
    made_of(Dish, FoodBeverage, Min, Max),
    (
        % If Fix = 1, Decrease by 10%
        Fix = 1,
        NewGrams is floor((Grams * 90) / 100),
        NewGrams >= Min, NewGrams =< Max
        ;
        % If Fix = -1, Increase by 10%
        Fix = -1,
        NewGrams is ceiling((Grams * 110) / 100),
        NewGrams >= Min, NewGrams =< Max
    ),
    !,
    append(Acc, [FoodBeverage-NewGrams | Rest], NewIngredientList).
change_ingredient_grams(Dish, [FoodBeverage-Grams | Rest], Fix, Acc, NewIngredientList) :-
    % This clause handles the case where no change is made
    append(Acc, [FoodBeverage-Grams], NewAcc),
    change_ingredient_grams(Dish, Rest, Fix, NewAcc, NewIngredientList).

% This function adjusts the grams of each ingredient in a dish based on the given Fix value and considering the macronutrient content. 
% It ensures the adjusted grams lie within predefined minimum and maximum bounds for that dish and ingredient.
% And if the quantity cannot be adjusted within these bounds, it remains unchanged.
change_ingredient_grams_macronutrient(_, [], _, NewIngredientList, NewIngredientList).
change_ingredient_grams_macronutrient(Dish, [FoodBeverage-Grams | Rest], Fix, Acc, NewIngredientList) :-
    made_of(Dish, FoodBeverage, Min, Max),
    (
        % If Fix = 1, Decrease by 10%
        (
            Fix = 1,
            NewGrams is floor((Grams * 90) / 100),
            NewGrams >= Min, NewGrams =< Max
        )
        ;
        % If Fix = -1, Increase by 10%
        (
            Fix = -1,
            NewGrams is ceiling((Grams * 110) / 100),
            NewGrams >= Min, NewGrams =< Max
        )
        ; 
            NewGrams is Grams
    ),
    !,
    append(Acc, [FoodBeverage-NewGrams], NewAcc),
    change_ingredient_grams_macronutrient(Dish, Rest, Fix, NewAcc, NewIngredientList).


% Returns the the list of calories, where each element corresponds to the calories of a dish (represented by its ingredients)
get_dish_calories_lists([], CaloriesList, CaloriesList).
get_dish_calories_lists([Ingredients | Rest], Acc, CaloriesList) :-
    compute_actual_dish_calories(Ingredients, 0, ActualCalories),
    IntegerCalories is round(ActualCalories),
    append(Acc, [IntegerCalories], NewAcc),
    get_dish_calories_lists(Rest, NewAcc, CaloriesList).

% This function generates an ordered list of dishes based on their total calories.
get_ordered_list_dish_by_calories(ListRelationships, FinalListDish) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, DishList),
    get_dish_calories_lists(IngredientLists, MacroNutrient, [], CaloriesList),
    order_list_by_values(CaloriesList, DishList, FinalListDish).
    
% This function generates an ordered list of dishes based on the quantity of a specified macronutrient in the dishes.
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
    !,
    get_dish_macronutrient_amount_lists(Rest, MacroNutrient, NewAcc, CaloriesList).

% Generate ingredients' grams for all dishes in a daily diet
set_grams_for_dish(_, []).
set_grams_for_dish(NewId, [Dish | RestDish]) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    actual_foodbeverage_grams(FoodBeverageList, Dish, [], IngredientLists), 
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
    flatten_list(Ingredients, IngredientLists),
    get_only_foodbeverages(IngredientLists, [], FoodBeverageList).

% Extract a list of FoodBeverages from a list of ingredients.
get_only_foodbeverages([], Acc, Acc). 
get_only_foodbeverages([FoodBeverage-_Grams | Rest], Acc, FoodBeverageList) :-
    append(Acc, [FoodBeverage], UpdatedAcc),
    get_only_foodbeverages(Rest, UpdatedAcc, FoodBeverageList).

% Count how many instances of a class of FoodBeverage there are in a daily diet
count_foodbeverage_in_daily_diet(DailyDiet, ItemToCount, Total) :-
    get_foodbeverages_in_daily_diet(DailyDiet, FoodBeverageList),
    count_foodbeverage_in_list(ItemToCount, FoodBeverageList, 0, Total).

% Count occurrences of a specific FoodBeverage item in a list of FoodBeverages.
count_foodbeverage_in_list(_, [], Count, Count).
count_foodbeverage_in_list(ItemToCount, [FoodBeverage | Rest], PartialCount, Total) :-
    (foodbeverage_instance(dietplanner, ItemToCount, FoodBeverage) ->
        NewPartialCount is PartialCount + 1
        ;
        NewPartialCount is PartialCount
    ),
    count_foodbeverage_in_list(ItemToCount, Rest, NewPartialCount, Total).

% The function prepares a daily diet for the given person based on the diet type and ensures that the generated daily diet 
% adheres to specific nutritional limits and constraints.
generate_daily_diet(Person, DietType, NewId, TotalDayCalories) :-
    prepare_daily_diet(Person, DietType, NewId, TotalDayCalories, MacronutrientLimits, DailyCalories),
    check_and_fix_daily_diet(NewId, MacronutrientLimits, DailyCalories, 15).

% The function creates a daily diet plan for the specified person and diet type.
% It gets the dish types, macronutrient limits for the given diet, and sets the total daily calories. 
% It then retrieves the dishes for the daily diet and calculates the calories for the daily diet. 
% Finally, it determines the amount (in grams) of each dish in the diet.
prepare_daily_diet(Person, DietTypes, NewId, TotalDayCalories, MacronutrientLimits, DailyCalories) :-
    dish_types(DishTypes),
    get_macronutrient_limits(DietTypes, MacronutrientLimits),
    set_total_daily_calories(DietTypes, TotalDayCalories, NewTotalDayCalories),
    get_daily_diet_dishes(Person, DietTypes, DishTypes, [], DailyDietDishes),
    get_daily_diet_calories(NewTotalDayCalories, DailyCalories),
    set_grams_for_dish(NewId, DailyDietDishes),
    !.

% The function fetches the macronutrient limits based on the specified diet type. 
% It first gets the initial macronutrient limits based on the diet goal and then adjusts those limits 
% based on any health or disease conditions associated with the diet type.
get_macronutrient_limits(DietTypes, MacronutrientLimits) :-
    get_macronutrient_limits_diet_goal(DietTypes, TempMacronutrientLimits),
    adjust_macronutrient_limits_health_disease(DietTypes, TempMacronutrientLimits, MacronutrientLimits).

% The function takes as input the diet type and returns the macronutrient limits associated with that specific diet goal. 
% It evaluates the diet type and accordingly calls the relevant function % to get the macronutrient percentage limits for 
% a healthy weight diet, a hyperproteic diet, or a hypocaloric diet.
% If none of the specified diet types are matched, it defaults to a healthy (standard) weight diet.
get_macronutrient_limits_diet_goal(DietTypes, MacronutrientLimits) :-
    (
        member(healthy_weight_diet, DietTypes)
        ->
            healthy_weight_nutrient_percentages(MacronutrientLimits)
        ;
        member(hyperproteic_diet, DietTypes)
        ->
            hyperproteic_nutrient_percentages(MacronutrientLimits)
        ;
        member(hypocaloric_diet, DietTypes)
        ->
            healthy_weight_nutrient_percentages(MacronutrientLimits)
        ;
            % In any other case (or if not specified), it's assumed an healthy (standard) diet
            healthy_weight_nutrient_percentages(MacronutrientLimits)
    ).

% The function recursively adjusts the macronutrient limits based on health or disease conditions associated with the diet type.
% For each diet type (e.g., diabetic, high cholesterol), the macronutrient limits are adjusted based on the diet's requirements. 
% If the diet type is not one of the specified types, the macronutrient limits remain the same.
adjust_macronutrient_limits_health_disease([], MacronutrientLimits, MacronutrientLimits).
adjust_macronutrient_limits_health_disease([DietType | Rest], TempMacronutrientLimits, MacronutrientLimits) :-
    (
        DietType = diabetic_diet
        ->
            change_macronutrient_limit(carbs, -5, TempMacronutrientLimits, [], NewTempMacronutrientLimits)
        ;
        DietType = high_cholesterol_diet
        ->
            change_macronutrient_limit(lipids, -9, TempMacronutrientLimits, [], NewTempMacronutrientLimits)
        ;
        DietType = kidney_problem_diet
        ->
            change_macronutrient_limit(lipids, -5, TempMacronutrientLimits, [], TempMacronutrientLimits2),
            change_macronutrient_limit(carbs, 5, TempMacronutrientLimits2, [], TempMacronutrientLimits3),
            change_macronutrient_limit(dietary_fiber, 2, TempMacronutrientLimits3, [], NewTempMacronutrientLimits)
        ;
        DietType = gastrointestinal_disorder_diet
        ->
            change_macronutrient_limit(carbs, -5, TempMacronutrientLimits, [], TempMacronutrientLimits2),
            change_macronutrient_limit(dietary_fiber, -2, TempMacronutrientLimits2, [], NewTempMacronutrientLimits)
        ;
            % In any other case (or if not specified), the limits remain as are
            NewTempMacronutrientLimits = TempMacronutrientLimits
    ), 
    !,
    adjust_macronutrient_limits_health_disease(Rest, NewTempMacronutrientLimits, MacronutrientLimits).

% The function modifies the macronutrient limits for a given macronutrient (MacroNutrient).
% For each element in the macronutrient limits list:
% 1. If the macronutrient being adjusted matches the current element, the Min and Max values are adjusted by the given Quantity.
% 2. If the adjustments make either Min or Max fall below zero, those values are set to their original values (ensuring they don't go negative).
% 3. The adjusted values are appended to the accumulated list, and the function recurs on the remaining list.
change_macronutrient_limit(_, _, [], MacronutrientLimits, MacronutrientLimits).
change_macronutrient_limit(MacroNutrient, Quantity, [Element-Min-Max | Rest], Acc, MacronutrientLimits) :-
    (
        MacroNutrient = Element 
        ->
            TempMin is (Min + Quantity),
            TempMax is (Max + Quantity)
        ;
            TempMin is Min,
            TempMax is Max
    ),
    (
        (TempMin < 0, TempMax < 0)
        ->
            NewMin is Min,
            NewMax is Max
        ;
        TempMin < 0 
        ->
            NewMin is Min,
            NewMax is TempMax
        ;
        TempMax < 0 
        ->
            NewMin is TempMin,
            NewMax is Max
        ;
            NewMin is TempMin, 
            NewMax is TempMax
    ),
    append(Acc, [Element-NewMin-NewMax], NewAcc),
    !, 
    change_macronutrient_limit(MacroNutrient, Quantity, Rest, NewAcc, MacronutrientLimits).

% The function adjusts the total daily caloric intake based on the specified diet type.
% If the diet type is 'hypocaloric_diet', the function reduces the total daily calories by 20%.
% In all other cases, the total daily calories remain unchanged.
set_total_daily_calories(DietTypes, TotalDayCalories, NewTotalDayCalories) :-
    (
        member(hypocaloric_diet, DietTypes)
        -> 
            % Reduce the total calories by 20%
            NewTotalDayCalories is (TotalDayCalories * 80) / 100 
        ;
            NewTotalDayCalories is TotalDayCalories
    ).

% The function is responsible for validating and adjusting the daily diet based on given macronutrient limits and caloric intake. 
% The function performs checks and fixes iteratively up to a maximum number of iterations defined by 'MaxIterations'.
% 1. It checks whether the daily diet respects the macronutrient limits and the total caloric intake.
% 2. If the macronutrient or calorie checks fail, the function will attempt to fix the diet.
% 3. If after all iterations the diet still doesn't meet the criteria, the function will terminate.
check_and_fix_daily_diet(NewId, MacronutrientLimits, DailyCalories, MaxIterations) :-
    between(0, MaxIterations, Iteration),
    (
        check_daily_macronutrient(NewId, DailyCalories, MacronutrientLimits, MacronutrientResult, FailedMacroNutrient),
        check_daily_calories(NewId, DailyCalories, CaloryResult),
        (
            MacronutrientResult = 0, CaloryResult = 0 ->
                !,
                writeln('Daily diet generated successfully')
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
    ).

% The function corrects the grams of a particular macronutrient in the daily diet.
% 1. It fetches the list of dishes associated with a specific macronutrient.
% 2. It then adjusts the macronutrient's grams in those dishes based on whether the current 
%    macronutrient quantity is over or under the desired limit (as determined by 'MacronutrientResult').
% After making adjustments, the function intentionally fails (via 'fail') to allow for backtracking 
% and re-evaluation of the corrected diet in the main checking loop.
fix_macronutient(NewId, MacroNutrient, MacronutrientResult) :-
    get_list_dish_by_nutrient(NewId, MacroNutrient, ListDish),
    fix_macronutrients_grams(NewId, ListDish, MacroNutrient, MacronutrientResult),
    !,
    fail.

% The function addresses the total calorie count discrepancies in the diet.
% 1. It retrieves a list of dishes based on their calorie content.
% 2. From this list, it selects a default dish to serve as the primary reference for adjustments.
% 3. It then modifies the grams of the dishes in the diet to match the target caloric intake, as determined by 'CaloriesResult'.
% Similar to the 'fix_macronutient' function, after making the necessary adjustments, 
% the function intentionally fails (via 'fail') to allow backtracking and further validation of the corrected diet.
fix_calories(NewId, CaloriesResult) :-
    get_list_dish_by_calories(NewId, ListDish),
    nth0(0, ListDish, DefaultDish),
    fix_calories_grams(NewId, ListDish, DefaultDish, CaloryResult),
    !,
    fail.

% The function first fetches relationships associated with the daily diet. 
% Then, using these relationships, it then retrieves an ordered list of dishes based on their calorie content.
get_list_dish_by_calories(DailyDiet, ListDish) :-
    get_list_relationships(DailyDiet, ListRelationships),
    get_ordered_list_dish_by_calories(ListRelationships, ListDish).

% The function fetches a list of dishes based on a specific macronutrient's content.
get_list_dish_by_nutrient(DailyDiet, MacroNutrient, ListDish) :-
    get_list_relationships(DailyDiet, ListRelationships),
    get_ordered_list_dish_by_nutrient(ListRelationships, MacroNutrient, ListDish).

% Given a list of terms, gets the list of relative ingredients and a list of dishes
extract_ingredients_and_dishes([], AllIngredients, AllDishes, AllIngredients, AllDishes).
extract_ingredients_and_dishes([Term | Rest], AccIngredients, AccDishes, AllIngredients, AllDishes) :-
    Term = has(_, Dish, Ingredients),
    append(AccIngredients, [Ingredients], NewIngredient),
    append(AccDishes, [Dish], NewDish),
    extract_ingredients_and_dishes(Rest, NewIngredient, NewDish, AllIngredients, AllDishes).

% The function converts the quantity of a given macronutrient (in grams) into its caloric equivalent.
convert_grams_in_calories(MacroNutrient, TotalNutrientQuantity, TotalCalories) :-
    (   MacroNutrient = lipids ->
            TotalCalories is (TotalNutrientQuantity * 8)
        ;   
        MacroNutrient = dietary_fiber ->    
            TotalCalories is TotalNutrientQuantity 
        ;  
        MacroNutrient = protein ->    
            TotalCalories is (TotalNutrientQuantity * 6) 
        ; 
            TotalCalories is (TotalNutrientQuantity * 5)
    ).

% The function evaluates whether the caloric intake from a specific macronutrient 
% within the daily diet falls within a given percentage range (UpperBound and LowerBound).
% 1. It extracts unique ingredients from the daily diet.
% 2. Calculates the total caloric intake for the day.
% 3. Computes the total quantity of the specified macronutrient.
% 4. Converts the total quantity of the macronutrient into its caloric equivalent.
% 5. Determines the minimum and maximum allowed calories for the given percentage range.
% 6. Compares the actual caloric intake from the macronutrient against the allowed range and sets the Result accordingly:
%    -1 if below the range, 1 if above the range, 0 if within the range.
check_macronutrient_helper(DailyDiet, DailyCalories, MacroNutrient, LowerBound, UpperBound, Result) :-
    unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients), 
    sum_list(DailyCalories, DayCalories),
    !,
    cumulative_macro_nutrient_quantity(UniqueIngredients, MacroNutrient, TotalNutrientQuantity),
    convert_grams_in_calories(MacroNutrient, TotalNutrientQuantity, TotalCalories),
    Min is floor((DayCalories * LowerBound) / 100) - 5,
    Max is ceiling((DayCalories * UpperBound) / 100) + 5,
    ActualCalories is ceiling(TotalCalories),
    (
        ActualCalories < Min ->
        TempResult is -1
        ;
        ActualCalories > Max ->
        TempResult is 1
        ;
        ActualCalories >= Min, ActualCalories =< Max ->
        TempResult is 0 
    ),
    Result = TempResult.

% The function recursively evaluates the list of macronutrients to ensure that the caloric intake 
% from each macronutrient falls within the specified bounds (LowerBound and UpperBound).
% 1. It stops immediately when it detects a macronutrient whose intake is out of bounds, returning the offending macronutrient in 'FailedMacroNutrient'.
% 2. If all macronutrients are within bounds, it returns a Result of 0 indicating success.
check_daily_macronutrient(_, _, [], 0, _) :-
    !.
check_daily_macronutrient(DailyDiet, DailyCalories, [MacroNutrient-LowerBound-UpperBound | Rest], Result, FailedMacroNutrient) :-
    check_macronutrient_helper(DailyDiet, DailyCalories, MacroNutrient, LowerBound, UpperBound, InnerResult),
    (
        InnerResult \= 0 
        ->
            Result = InnerResult,
            FailedMacroNutrient = MacroNutrient,
            !
        ;
            check_daily_macronutrient(DailyDiet, DailyCalories, Rest, Result, FailedMacroNutrient)
    ).


% Checks that the calories in a daily diet is between a specified range
check_daily_calories(DailyDiet, DailyCalories, Result) :-
    get_list_relationships(DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, [], _, IngredientLists, _),
    check_dish_calories(IngredientsList, DailyCalories, Result),
    !.

% The function iterates over each dish's ingredients to compute and verify its caloric value.
% It compares the computed caloric value of each dish against the expected 'DishCalories'.
% The function will return:
% -1 if the dish's actual caloric value is less than the expected minus 60,
%  1 if it's more than the expected plus 1,
%  0 otherwise (within the acceptable range).
check_dish_calories([], _, 0).
check_dish_calories([Ingredients | RestIngredients], [DishCalories | RestCalories], Result) :-
    compute_actual_dish_calories(Ingredients, 0, ActualCalories),
    (
        ActualCalories =< DishCalories - 60   ->
        InnerResult is -1
    ;
        ActualCalories >= DishCalories + 1    ->
        InnerResult is 1
    ;
        ActualCalories >= DishCalories - 60, ActualCalories =< DishCalories + 1 ->
        InnerResult is 0
    ),
    (InnerResult = 0 ->
        check_dish_calories(RestIngredients, RestCalories, Result) % If the caloric value is within the acceptable range, move to the next dish.
        ;
        Result = InnerResult % If not, the function will terminate, setting 'Result' to the 'InnerResult'.
    ).
% This clause is for any remaining unmatched cases, setting 'Result' to a non-zero value.
% This would be invoked if there's a mismatch in length between the ingredients list and the calories list.
check_dish_calories(_, _, Result) :- 
    Result \= 0, 
    !.

% ---------
% Diet
% ---------
% Gathers initial data, including weekly caloric needs and daily diet names, for a specified person to generate a diet.
get_init_info(Person, TotalWeekCaloriesList, DailyDietNames) :-
    generate_list_calories_week(Person, TotalWeekCaloriesList),
    daily_diet_names(DailyDietNames).

% Given the id of the daily diet and the desidered dish type, returns the dish name and its ingredients list
read_diet(DailyDietId, DishType, DailyDietList) :-
    findall(
        Dish-IngredientsList, 
        (
            !,
            attribute_value(dietplanner, Dish, type, DishType),
            has(DailyDietId, Dish, IngredientsList)
        ), 
        DailyDietList
    ).