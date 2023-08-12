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
class(nutrient).
class(alcoholic).
class(amino_acidic).
class(carbs).
class(dietary_fiber).
class(lipids).
class(minerals).
class(protein).
class(vitamin).
class(allergen).
class(person).
class(activity).
class(sports).
class(inactivity).
class(walking).
class(meal).
class(main_meals).
class(snacks).

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
subclass(nutrient, alcoholic).
subclass(nutrient, amino_acidic).
subclass(nutrient, carbs).
subclass(nutrient, dietary_fiber).
subclass(nutrient, lipids).
subclass(nutrient, minerals).
subclass(nutrient, protein).
subclass(nutrient, vitamin).
subclass(activity, sports).
subclass(activity, inactivity).
subclass(activity, walking).
subclass(meal, main_meals).
subclass(meal, snacks).

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
