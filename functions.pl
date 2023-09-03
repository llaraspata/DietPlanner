:- reconsult('instances').

:- use_module(library(lists)).

% Compute the total calories about a list of foods 
compute_calories_amount([], 0).
compute_calories_amount([Food|Rest], TotalCalories) :-
    attribute_value(dietplanner, Food, calories, CaloriesFood),
    compute_calories_amount(Rest, RestCalories),
    TotalCalories is RestCalories + CaloriesFood.

% Compute the total calories effort in doing activities 
compute_activity_effort([], 0).
compute_activity_effort([Activity-Duration|Rest], TotalEffort) :-
    attribute_value(dietplanner, Activity, calory_effort, EffortOneHour),
    ActivityEffort is EffortOneHour * Duration,
    compute_activity_effort(Rest, RestEffort),
    TotalEffort is ActivityEffort + RestEffort.

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
    attribute_value(dietplanner, X, name, Name).

find_person_id(Name, Surname, PersonID) :-
    person_instance(dietplanner, person, PersonID),
    attribute_value(dietplanner, PersonID, name, Name),
    attribute_value(dietplanner, PersonID, surname, Surname),
    !.

find_person_id(_, _, null).

find_bmi_energy_effort(PersonID, BMI, EnergyValue) :-
    attribute_value(dietplanner, PersonID, bmi, BMIValue),
    attribute_value(dietplanner, PersonID, energy_effort, EnergyValue).

set_right_number_calories(BMI, EnergyValue, TotalCalories) :-
    (BMI < 18.49 ->
        TotalCalories is EnergyValue + 400;
    (BMI >= 18.50, BMI =< 24.99) ->
        TotalCalories is EnergyValue;
    BMI > 25.00 ->
        TotalCalories is EnergyValue - 300).

get_activities(PersonID, ActivityList) :-
    setof([Activity-Hours, Frequency],
            carry_out(PersonID, Activity-Hours, Frequency),
            ActivityList).

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
 