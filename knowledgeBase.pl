%Domain
fact(0, domain(dietplanner), 1).
% ---------
% Food and Beverage
% ---------

fact(1, entity(dietplanner, food_beverage), 1).

% SubClasses
fact(2, parent(dietplanner, food_beverage, food), 1).
fact(3, entity(dietplanner, food), 1).
fact(4, parent(dietplanner, food, cereal), 1).
fact(5, entity(dietplanner, cereal), 1).
fact(6, parent(dietplanner, food, eggs), 1).
fact(7, entity(dietplanner, eggs), 1).
fact(8, parent(dietplanner, food, oils), 1).
fact(9, entity(dietplanner, oils), 1).
fact(10, parent(dietplanner, food, fish_seafood), 1).
fact(11, entity(dietplanner, fish_seafood), 1).
fact(12, parent(dietplanner, food, fruits_olives), 1).
fact(13, entity(dietplanner, fruits_olives), 1).
fact(14, parent(dietplanner, food, meats), 1).
fact(15, entity(dietplanner, meats), 1).
fact(16, parent(dietplanner, food, milk), 1).
fact(17, entity(dietplanner, milk), 1).
fact(18, parent(dietplanner, food, mushrooms), 1).
fact(19, entity(dietplanner, mushrooms), 1).
fact(20, parent(dietplanner, food, nuts), 1).
fact(21, entity(dietplanner, nuts), 1).
fact(22, parent(dietplanner, food, seeds), 1).
fact(23, entity(dietplanner, seeds), 1).
fact(24, parent(dietplanner, food, salts), 1).
fact(25, entity(dietplanner, salts), 1).
fact(26, parent(dietplanner, food, spices), 1).
fact(27, entity(dietplanner, spices), 1).
fact(28, parent(dietplanner, food, sweets), 1).
fact(29, entity(dietplanner, sweets), 1).
fact(30, parent(dietplanner, food, vegetables), 1).
fact(31, entity(dietplanner, vegetables), 1).
fact(32, parent(dietplanner, food, legumes), 1).
fact(33, entity(dietplanner, legumes), 1).

fact(34, parent(dietplanner, food_beverage, beverage), 1).
fact(35, entity(dietplanner, beverage), 1).
fact(36, parent(dietplanner, beverage, alcoholic_beverages), 1).
fact(37, entity(dietplanner, alcoholic_beverages), 1).
fact(38, parent(dietplanner, beverage, coffee_energydrinks), 1).
fact(39, entity(dietplanner, coffee_energydrinks), 1).
fact(40, parent(dietplanner, beverage, soda), 1).
fact(41, entity(dietplanner, soda), 1).
fact(42, parent(dietplanner, beverage, juice), 1).
fact(43, entity(dietplanner, juice), 1).
fact(44, parent(dietplanner, beverage, water), 1).
fact(45, entity(dietplanner, water), 1).

% Attributes Food and Beverage
fact(46, attribute(dietplanner, food_beverage, name, string), 1).
fact(47, mandatory(dietplanner, food_beverage, name), 1).
fact(48, attribute(dietplanner, food_beverage, description, string), 1).
fact(49, attribute(dietplanner, food_beverage, calories, string), 1).
fact(50, mandatory(dietplanner, food_beverage, calories), 1).

% ---------
% Nutrient
% ---------
% Classes
fact(51, entity(dietplanner, nutrient), 1).
fact(52, entity(dietplanner, alcoholic), 1).
fact(53, entity(dietplanner, amino_acidic), 1).
fact(54, entity(dietplanner, carbs), 1).
fact(55, entity(dietplanner, dietary_fiber), 1).
fact(56, entity(dietplanner, lipids), 1).
fact(57, entity(dietplanner, minerals), 1).
fact(58, entity(dietplanner, protein), 1).
fact(59, entity(dietplanner, vitamin), 1).

% Subclasses
fact(60, parent(dietplanner, nutrient, alcoholic), 1).
fact(61, parent(dietplanner, nutrient, amino_acidic), 1).
fact(62, parent(dietplanner, nutrient, dietary_fiber), 1).
fact(63, parent(dietplanner, nutrient, carbs), 1).
fact(64, parent(dietplanner, nutrient, lipids), 1).
fact(65, parent(dietplanner, nutrient, minerals), 1).
fact(66, parent(dietplanner, nutrient, protein), 1).
fact(67, parent(dietplanner, nutrient, vitamin), 1).

% Attributes
fact(68, attribute(dietplanner, nutrient, name, string), 1).
fact(69, mandatory(dietplanner, nutrient, name), 1).
fact(70, attribute(dietplanner, nutrient, description, string), 1).
fact(71, mandatory(dietplanner, nutrient, description), 1).


% ---------
% Allergen
% ---------
fact(72, entity(dietplanner, allergen), 1).

% Attributes 
fact(73, attribute(dietplanner, allergen, name, string), 1).
fact(74, mandatory(dietplanner, allergen, name), 1).
fact(75, attribute(dietplanner, allergen, description, string), 1).
fact(76, mandatory(dietplanner, allergen, description), 1).


% ---------
% Person
% ---------
% Classes
fact(77, entity(dietplanner, person), 1).

% Attributes 
fact(78, attribute(dietplanner, person, name, string), 1).
fact(79, mandatory(dietplanner, person, name), 1).
fact(80, attribute(dietplanner, person, surname, string), 1).
fact(81, mandatory(dietplanner, person, surname), 1).
fact(82, attribute(dietplanner, person, age, integer), 1).
fact(83, mandatory(dietplanner, person, age), 1).
fact(84, attribute(dietplanner, person, gender, string), 1).
fact(85, mandatory(dietplanner, person, gender), 1).
fact(86, attribute(dietplanner, person, height, integer), 1).
fact(87, mandatory(dietplanner, person, height), 1).
fact(88, attribute(dietplanner, person, weight, real), 1).
fact(89, mandatory(dietplanner, person, weight), 1).



% ---------
% Activity
% ---------
% Classes
fact(90, entity(dietplanner, activity), 1).
fact(91, entity(dietplanner, sports), 1).
fact(92, entity(dietplanner, inactivity), 1).
fact(93, entity(dietplanner, walking), 1).

% Subclasses
fact(94, parent(dietplanner, activity, sports), 1).
fact(95, parent(dietplanner, activity, inactivity), 1).
fact(96, parent(dietplanner, activity, walking), 1).

% Attributes 
fact(97, attribute(dietplanner, activity, name, string), 1).
fact(98, mandatory(dietplanner, activity, name), 1).
fact(99, attribute(dietplanner, activity, description, string), 1).
fact(100, mandatory(dietplanner, activity, description), 1).
fact(101, attribute(dietplanner, activity, calory_effort, integer), 1).
fact(102, mandatory(dietplanner, activity, calory_effort), 1).

% ---------
% Meal
% ---------
% Classes
fact(103, entity(dietplanner, meal), 1).
fact(104, entity(dietplanner, main_meals), 1).
fact(105, entity(dietplanner, snacks), 1).

% Subclasses
fact(106, parent(dietplanner, meal, main_meals), 1).
fact(107, parent(dietplanner, meal, snacks), 1).

% Attributes 
fact(108, attribute(dietplanner, meal, name, string), 1).
fact(109, mandatory(dietplanner, meal, name), 1).
fact(110, attribute(dietplanner, meal, description, string), 1).
fact(111, mandatory(dietplanner, meal, description), 1).


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