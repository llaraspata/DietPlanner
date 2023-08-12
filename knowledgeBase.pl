% Classes
class(food_beverage).
class(food).
class(beverage).
class(cereal).
class(eggs).
class(fats_and_oils).
class(fish_and_seafood).
class(fruits).
class(meats).
class(milk).
class(mushrooms).
class(nuts).
class(seeds_and_olives).
class(salts).
class(spices).
class(sugar_and_sweets).
class(vegetables_and_legumes).
class(alcoholic_beverages).
class(coffee_and_substitutes).
class(non_alcoholic_beverages).
class(water).

% ---------
% Nutrient
% ---------
% Classes
class(nutrient).
class(alcoholic).
class(amino_acidic).
class(carbs).
class(dietary_fiber).
class(lipids).
class(minerals).
class(protein).
class(vitamin).

% Subclasses
subclass(nutrient, alcoholic).
subclass(nutrient, amino_acidic).
subclass(nutrient, carbs).
subclass(nutrient, dietary_fiber).
subclass(nutrient, lipids).
subclass(nutrient, minerals).
subclass(nutrient, protein).
subclass(nutrient, vitamin).


% ---------
% Allergen
% ---------
class(allergen).



% ---------
% Person
% ---------
class(person).



% ---------
% Activity
% ---------
% Classes
class(activity).
class(sports).
class(inactivity).
class(walking).

% Subclasses
subclass(activity, sports).
subclass(activity, inactivity).
subclass(activity, walking).


% ---------
% Meal
% ---------
% Classes
class(meal).
class(main_meals).
class(snacks).

% Subclasses
subclass(meal, main_meals).
subclass(meal, snacks).



% Subclasses
subclass(food_beverage, food).
subclass(food_beverage, beverage).
subclass(food, cereal).
subclass(food, eggs).
subclass(food, fats_and_oils).
subclass(food, fish_and_seafood).
subclass(food, fruits).
subclass(food, meats).
subclass(food, milk).
subclass(food, mushrooms).
subclass(food, nuts).
subclass(food, seeds_and_olives).
subclass(food, salts).
subclass(food, spices).
subclass(food, sugar_and_sweets).
subclass(food, vegetables_and_legumes).
subclass(beverage, alcoholic_beverages).
subclass(beverage, coffee_and_substitutes).
subclass(beverage, non_alcoholic_beverages).
subclass(beverage, water).



% Relationships
has(food_beverage, nutrient).
part_of(nutrient, food_beverage).
carry_out(person, activity).
is_allergic(person, allergen).
is_a(food_beverage, meal).

% Predicates
compute_needed_calories(Person, Calories) :- ... % Placeholder for the actual computation.
compute_calory_effort(Activity, Time, Calories) :- ... % Placeholder for the actual computation.
compute_calories_amount(FoodBeverage, Portion, Calories) :- ... % Placeholder for the actual computation.



% Add attribute predicate
has_attribute(food_beverage, color).

% Attribute values
attribute_value(apple, color, red).
attribute_value(banana, color, yellow).
attribute_value(carrot, color, orange).
% ... and so on for other entities

% Predicate to check attribute value
has_color(Entity, Color) :- attribute_value(Entity, color, Color).