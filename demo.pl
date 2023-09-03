:- use_module(library(lists)).


nutrient_instance(dietplanner, minerals, potassium).
nutrient_instance(dietplanner, vitamin, vitamin_c).
nutrient_instance(dietplanner, protein, whey_protein).
nutrient_instance(dietplanner, lipids, omega_3_fatty_acids).

% [turkey-200,lettuce-200,banana-20,quinoa-70,salmon-150,tomato-100,egg-20,bread-120]

% Define has_nutrient relationship
has_nutrient(apple, vitamin_c, 0.5).
has_nutrient(banana, potassium, 0.4).
has_nutrient(chicken_breast, whey_protein, 30).
has_nutrient(salmon, omega_3_fatty_acids, 2).
has_nutrient(salmon, whey_protein, 20).
has_nutrient(turkey, whey_protein, 50).
has_nutrient(egg, whey_protein, 35).

% Define composed_of relationship
composed_of(diet1, daily_diet1).

% Define has relationship
has(daily_diet1, english_breakfast, [egg-20, bread-50]).
has(daily_diet1, poke, [quinoa-70, salmon-150, tomato-100]).
has(daily_diet1, yogurt_banana, [banana-10]).
has(daily_diet1, yogurt_banana, [banana-10]).
has(daily_diet1, turkey_sandwich, [turkey-200, bread-70, lettuce-200]).

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
made_of(turkey_sandwich, lettuce).
made_of(turkey_sandwich, tomato).



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

% Get the list of ingredients in a dish of a daily diet
get_ingredients_in_daily_diet(DailyDiet, Ingredients) :-
    findall(Ingredient, has(DailyDiet, _, Ingredient), Ingredients).

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
 