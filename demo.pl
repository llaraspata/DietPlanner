:- use_module(library(lists)).

% Define has_nutrient relationship
has_nutrient(apple, vitamin_c, 0.5).
has_nutrient(banana, potassium, 0.4).
has_nutrient(chicken_breast, protein, 30).
has_nutrient(salmon, omega_3, 2).

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
 