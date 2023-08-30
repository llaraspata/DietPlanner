:- dynamic(fact/3).

% ---------
% Domain
% ---------
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
fact(8, parent(dietplanner, food, fat_oils), 1).
fact(9, entity(dietplanner, fat_oils), 1).
fact(10, parent(dietplanner, food, fish_seafood), 1).
fact(11, entity(dietplanner, fish_seafood), 1).
fact(12, parent(dietplanner, food, fruits_olives), 1).
fact(13, entity(dietplanner, fruits_olives), 1).
fact(14, parent(dietplanner, food, meats), 1).
fact(15, entity(dietplanner, meats), 1).
fact(16, parent(dietplanner, food, milk_cheese), 1).
fact(17, entity(dietplanner, milk_cheese), 1).
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
fact(38, parent(dietplanner, beverage, coffee_energydrinks), 1).
fact(39, entity(dietplanner, coffee_energydrinks), 1).
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
fact(53, entity(dietplanner, amino_acidic), 1).
fact(54, entity(dietplanner, carbs), 1).
fact(55, entity(dietplanner, dietary_fiber), 1).
fact(56, entity(dietplanner, lipids), 1).
fact(57, entity(dietplanner, minerals), 1).
fact(58, entity(dietplanner, protein), 1).
fact(59, entity(dietplanner, vitamin), 1).

% Subclasses
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
fact(90, attribute(dietplanner, person, bmi, real), 1).
fact(91, mandatory(dietplanner, person, bmi), 1).
fact(92, attribute(dietplanner, person, energy_demand, integer), 1).
fact(93, mandatory(dietplanner, person, energy_demand), 1).
fact(94, attribute(dietplanner, person, number_day_on, integer), 1).
fact(95, mandatory(dietplanner, person, number_day_on), 1).
fact(96, attribute(dietplanner, person, number_day_off, integer), 1).
fact(97, mandatory(dietplanner, person, number_day_off), 1).

% ---------
% Activity
% ---------
% Classes
fact(98, entity(dietplanner, activity), 1).
fact(99, entity(dietplanner, sports), 1).
fact(100, entity(dietplanner, walking), 1).

% Subclasses
fact(101, parent(dietplanner, activity, sports), 1).
fact(102, parent(dietplanner, activity, walking), 1).

% Attributes 
fact(103, attribute(dietplanner, activity, name, string), 1).
fact(104, mandatory(dietplanner, activity, name), 1).
fact(105, attribute(dietplanner, activity, description, string), 1).
fact(106, mandatory(dietplanner, activity, description), 1).
fact(107, attribute(dietplanner, activity, calory_effort, integer), 1).
fact(108, mandatory(dietplanner, activity, calory_effort), 1).

% ---------
% Dish
% ---------
% Classes
fact(109, entity(dietplanner, dish), 1).

% Attributes 
fact(110, attribute(dietplanner, dish, name, string), 1).
fact(111, mandatory(dietplanner, dish, name), 1).
fact(112, attribute(dietplanner, dish, description, string), 1).
fact(113, mandatory(dietplanner, dish, description), 1).
fact(114, attribute(dietplanner, dish, type, select), 1).
fact(115, values(dietplanner, dish, type, [breakfast, lunch, dinner, snack]), 1).
fact(116, mandatory(dietplanner, dish, type), 1).
fact(117, attribute(dietplanner, dish, healthy_degree, select), 1).
fact(118, values(dietplanner, dish, healthy_degree, [high, medium, low]), 1).
fact(119, mandatory(dietplanner, dish, healthy_degree), 1).

% ---------
% Diet
% ---------
% Classes
fact(120, entity(dietplanner, diet), 1).

% Attributes 
fact(121, attribute(dietplanner, diet, name, string), 1).
fact(122, mandatory(dietplanner, diet, name), 1).
fact(123, attribute(dietplanner, diet, type, select), 1).
fact(124, values(dietplanner, diet, type, [healthy_weight]), 1).    % Add more diet types in future enhancements

% TODO: find the proper way to specify that an attribute is a list and what is its structure
% For example breakfasts -> list of pairs Dish-grams, where each Dish's type is equal to breakfast
% This could be done using rules (so is done here) -> Anyway check this.

% ---------
% DailyDiet
% ---------
fact(125, entity(dietplanner, daily_diet), 1).
fact(126, parent(dietplanner, diet, daily_diet), 1).

fact(127, attribute(dietplanner, daily_diet, name, string), 1).
fact(128, mandatory(dietplanner, daily_diet, name), 1).
fact(129, attribute(dietplanner, daily_diet, day_type, select), 1).
fact(130, values(dietplanner, daily_diet, day_type, [on, off]), 1).
fact(131, mandatory(dietplanner, daily_diet, day), 1).


% ---------
% Relationships
% ---------
% TODO: find (or ask) a way to define relationships 
% in other KB they seem to be defined through rules (sinceramente non mi convince granché, ma lo faccio lo stesso)
relationships(1, has_nutrient(foodbeverage, nutrient), 1, 100).
relationships(2, part_of(nutrient, foodbeverage), 1, 100000).
relationships(3, carry_out(person, activity-hours, frequencyweek), 0, 100).
relationships(4, is_allergic(person, allergen), 0, 100).
relationships(5, is_contained(allergen, foodbeverage), 0, 100).
relationships(6, made_for(diet, person), 1, 1).
relationships(7, suggested_diet(person, diet), 0, 100).
relationships(8, composed_of(diet, daily_diet), 7, 7).
relationships(9, has(daily_diet, dish), 5, 5).
relationships(10, made_of(dish, foodbeverage), 1, 100).


