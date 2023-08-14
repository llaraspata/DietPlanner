:- dynamic(fact/3).
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


%------------------------------------------------------------------------------------------------------------------
% TODO

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
%------------------------------------------------------------------------------------------------------------------



% ---------
% Instances
% ---------

% ---------
% Class: food_beverage

% Subclass: food
% Subclass: cereal
cereal_istance(dietplanner, cereal, oatmeal).
attribute_value(dietplanner, oatmeal, name, "Oatmeal").
attribute_value(dietplanner, oatmeal, description, "Whole grain oatmeal, a nutritious breakfast option.").
attribute_value(dietplanner, oatmeal, calories, 71).

cereal_istance(dietplanner, cereal, corn_flakes).
attribute_value(dietplanner, corn_flakes, name, "Corn Flakes").
attribute_value(dietplanner, corn_flakes, description, "Crispy and light cereal made from corn.").
attribute_value(dietplanner, corn_flakes, calories, 101).

cereal_instance(dietplanner, cereal, rice_krispies).
attribute_value(dietplanner, rice_krispies, name, "Rice Krispies").
attribute_value(dietplanner, rice_krispies, description, "Crispy rice cereal that is often used in treats.").
attribute_value(dietplanner, rice_krispies, calories, 130).

cereal_instance(dietplanner, cereal, whole_wheat_cereal).
attribute_value(dietplanner, whole_wheat_cereal, name, "Whole Wheat Cereal").
attribute_value(dietplanner, whole_wheat_cereal, description, "Cereal made from whole wheat grains.").
attribute_value(dietplanner, whole_wheat_cereal, calories, 120).

cereal_instance(dietplanner, cereal, granola).
attribute_value(dietplanner, granola, name, "Granola").
attribute_value(dietplanner, granola, description, "Cereal made from rolled oats, nuts, and sweeteners.").
attribute_value(dietplanner, granola, calories, 400).


% Subclass: eggs
eggs_instance(dietplanner, eggs, scrambled_eggs).
attribute_value(dietplanner, scrambled_eggs, name, "Scrambled Eggs").
attribute_value(dietplanner, scrambled_eggs, description, "Fluffy scrambled eggs cooked to perfection.").
attribute_value(dietplanner, scrambled_eggs, calories, 154).

eggs_instance(dietplanner, eggs, chicken_eggs).
attribute_value(dietplanner, chicken_eggs, name, "Chicken Eggs").
attribute_value(dietplanner, chicken_eggs, description, "Fresh eggs from chickens, a versatile source of protein.").
attribute_value(dietplanner, chicken_eggs, calories, 68).

eggs_instance(dietplanner, eggs, quail_eggs).
attribute_value(dietplanner, quail_eggs, name, "Quail Eggs").
attribute_value(dietplanner, quail_eggs, description, "Small eggs from quail, often used in culinary dishes.").
attribute_value(dietplanner, quail_eggs, calories, 14).

eggs_instance(dietplanner, eggs, duck_eggs).
attribute_value(dietplanner, duck_eggs, name, "Duck Eggs").
attribute_value(dietplanner, duck_eggs, description, "Larger eggs from ducks, similar to chicken eggs.").
attribute_value(dietplanner, duck_eggs, calories, 130).

eggs_instance(dietplanner, eggs, goose_eggs).
attribute_value(dietplanner, goose_eggs, name, "Goose Eggs").
attribute_value(dietplanner, goose_eggs, description, "Even larger eggs from geese, less commonly consumed.").
attribute_value(dietplanner, goose_eggs, calories, 185).

eggs_instance(dietplanner, eggs, egg_whites).
attribute_value(dietplanner, egg_whites, name, "Egg Whites").
attribute_value(dietplanner, egg_whites, description, "The protein-rich portion of the egg, often used separately.").
attribute_value(dietplanner, egg_whites, calories, 16).

% Subclass: oils
oils_instance(dietplanner, oils, olive_oil).
attribute_value(dietplanner, olive_oil, name, "Olive Oil").
attribute_value(dietplanner, olive_oil, description, "Extra virgin olive oil for cooking and dressing.").
attribute_value(dietplanner, olive_oil, calories, 884).

oils_instance(dietplanner, oils, coconut_oil).
attribute_value(dietplanner, coconut_oil, name, "Coconut Oil").
attribute_value(dietplanner, coconut_oil, description, "Oil derived from coconuts, used in cooking and skincare.").
attribute_value(dietplanner, coconut_oil, calories, 862).

oils_instance(dietplanner, oils, avocado_oil).
attribute_value(dietplanner, avocado_oil, name, "Avocado Oil").
attribute_value(dietplanner, avocado_oil, description, "Oil made from avocados, known for its rich, buttery flavor.").
attribute_value(dietplanner, avocado_oil, calories, 124).

oils_instance(dietplanner, oils, canola_oil).
attribute_value(dietplanner, canola_oil, name, "Canola Oil").
attribute_value(dietplanner, canola_oil, description, "Neutral-flavored oil often used for cooking and frying.").
attribute_value(dietplanner, canola_oil, calories, 884).

oils_instance(dietplanner, oils, sesame_oil).
attribute_value(dietplanner, sesame_oil, name, "Sesame Oil").
attribute_value(dietplanner, sesame_oil, description, "Flavorful oil made from sesame seeds, common in Asian cuisines.").
attribute_value(dietplanner, sesame_oil, calories, 884).

% Subclass: fish_seafood
fish_seafood_instance(dietplanner, fish_seafood, grilled_salmon).
attribute_value(dietplanner, grilled_salmon, name, "Grilled Salmon").
attribute_value(dietplanner, grilled_salmon, description, "Healthy grilled salmon rich in omega-3 fatty acids.").
attribute_value(dietplanner, grilled_salmon, calories, 206).

fish_seafood_instance(dietplanner, fish_seafood, shrimp).
attribute_value(dietplanner, shrimp, name, "Shrimp").
attribute_value(dietplanner, shrimp, description, "Popular shellfish with a delicate taste, often used in various dishes.").
attribute_value(dietplanner, shrimp, calories, 85).

fish_seafood_instance(dietplanner, fish_seafood, tuna).
attribute_value(dietplanner, tuna, name, "Tuna").
attribute_value(dietplanner, tuna, description, "Versatile fish often used in salads, sandwiches, and sushi.").
attribute_value(dietplanner, tuna, calories, 144).

fish_seafood_instance(dietplanner, fish_seafood, cod).
attribute_value(dietplanner, cod, name, "Cod").
attribute_value(dietplanner, cod, description, "Mild-flavored fish commonly used in dishes like fish and chips.").
attribute_value(dietplanner, cod, calories, 82).

fish_seafood_instance(dietplanner, fish_seafood, crab).
attribute_value(dietplanner, crab, name, "Crab").
attribute_value(dietplanner, crab, description, "Delicate-flavored shellfish enjoyed in various culinary styles.").
attribute_value(dietplanner, crab, calories, 83).

% Subclass: fruits_olives
fruits_olives_instance(dietplanner, fruits_olives, apple).
attribute_value(dietplanner, apple, name, "Apple").
attribute_value(dietplanner, apple, description, "Fresh and crisp apple for a refreshing snack.").
attribute_value(dietplanner, apple, calories, 52).

fruits_olives_instance(dietplanner, fruits_olives, banana).
attribute_value(dietplanner, banana, name, "Banana").
attribute_value(dietplanner, banana, description, "Tropical fruit with a sweet taste and rich in potassium.").
attribute_value(dietplanner, banana, calories, 96).

fruits_olives_instance(dietplanner, fruits_olives, grapes).
attribute_value(dietplanner, grapes, name, "Grapes").
attribute_value(dietplanner, grapes, description, "Small and sweet berries often eaten fresh or used in products like wine.").
attribute_value(dietplanner, grapes, calories, 69).

fruits_olives_instance(dietplanner, fruits_olives, olive).
attribute_value(dietplanner, olive, name, "Olive").
attribute_value(dietplanner, olive, description, "Small fruit rich in healthy fats, often used to make olive oil.").
attribute_value(dietplanner, olive, calories, 115).

fruits_olives_instance(dietplanner, fruits_olives, orange).
attribute_value(dietplanner, orange, name, "Orange").
attribute_value(dietplanner, orange, description, "Citrus fruit known for its vitamin C content and refreshing flavor.").
attribute_value(dietplanner, orange, calories, 43).

% Subclass: meats
meats_instance(dietplanner, meats, grilled_chicken_breast).
attribute_value(dietplanner, grilled_chicken_breast, name, "Grilled Chicken Breast").
attribute_value(dietplanner, grilled_chicken_breast, description, "Lean grilled chicken breast for protein intake.").
attribute_value(dietplanner, grilled_chicken_breast, calories, 165).

meats_instance(dietplanner, meats, beef_steak).
attribute_value(dietplanner, beef_steak, name, "Beef Steak").
attribute_value(dietplanner, beef_steak, description, "Tender cut of beef, often grilled or pan-seared.").
attribute_value(dietplanner, beef_steak, calories, 250).

meats_instance(dietplanner, meats, pork_chop).
attribute_value(dietplanner, pork_chop, name, "Pork Chop").
attribute_value(dietplanner, pork_chop, description, "Succulent cut of pork, cooked in various ways.").
attribute_value(dietplanner, pork_chop, calories, 180).

meats_instance(dietplanner, meats, lamb_shank).
attribute_value(dietplanner, lamb_shank, name, "Lamb Shank").
attribute_value(dietplanner, lamb_shank, description, "Flavorful cut of lamb, often slow-cooked for tenderness.").
attribute_value(dietplanner, lamb_shank, calories, 260).

meats_instance(dietplanner, meats, turkey_breast).
attribute_value(dietplanner, turkey_breast, name, "Turkey Breast").
attribute_value(dietplanner, turkey_breast, description, "Lean meat from turkey, a popular option for sandwiches.").
attribute_value(dietplanner, turkey_breast, calories, 135).

% Subclass: milk
milk_instance(dietplanner, milk, skim_milk).
attribute_value(dietplanner, skim_milk, name, "Skim Milk").
attribute_value(dietplanner, skim_milk, description, "Low-fat skim milk for a calcium boost.").
attribute_value(dietplanner, skim_milk, calories, 34).

milk_instance(dietplanner, milk, whole_milk).
attribute_value(dietplanner, whole_milk, name, "Whole Milk").
attribute_value(dietplanner, whole_milk, description, "Dairy milk with full-fat content, often used for drinking and cooking.").
attribute_value(dietplanner, whole_milk, calories, 61).

milk_instance(dietplanner, milk, reduced_fat_milk).
attribute_value(dietplanner, reduced_fat_milk, name, "Reduced-Fat Milk").
attribute_value(dietplanner, reduced_fat_milk, description, "Dairy milk with reduced fat content, commonly used as a lighter option.").
attribute_value(dietplanner, reduced_fat_milk, calories, 34).

milk_instance(dietplanner, milk, soy_milk).
attribute_value(dietplanner, soy_milk, name, "Soy Milk").
attribute_value(dietplanner, soy_milk, description, "Plant-based milk made from soybeans, suitable for vegans and lactose-intolerant individuals.").
attribute_value(dietplanner, soy_milk, calories, 33).

milk_instance(dietplanner, milk, almond_milk).
attribute_value(dietplanner, almond_milk, name, "Almond Milk").
attribute_value(dietplanner, almond_milk, description, "Nut milk made from almonds, often used as a dairy-free alternative.").
attribute_value(dietplanner, almond_milk, calories, 13).

milk_instance(dietplanner, milk, coconut_milk).
attribute_value(dietplanner, coconut_milk, name, "Coconut Milk").
attribute_value(dietplanner, coconut_milk, description, "Creamy milk derived from coconuts, used in cooking and beverages.").
attribute_value(dietplanner, coconut_milk, calories, 230).

% Subclass: mushrooms
mushrooms_instance(dietplanner, mushrooms, button_mushroom).
attribute_value(dietplanner, button_mushroom, name, "Button Mushroom").
attribute_value(dietplanner, button_mushroom, description, "Common edible mushroom with a mild flavor, versatile in cooking.").
attribute_value(dietplanner, button_mushroom, calories, 22).

mushrooms_instance(dietplanner, mushrooms, portobello_mushroom).
attribute_value(dietplanner, portobello_mushroom, name, "Portobello Mushroom").
attribute_value(dietplanner, portobello_mushroom, description, "Large and meaty mushroom, often used as a meat substitute.").
attribute_value(dietplanner, portobello_mushroom, calories, 22).

mushrooms_instance(dietplanner, mushrooms, shiitake_mushroom).
attribute_value(dietplanner, shiitake_mushroom, name, "Shiitake Mushroom").
attribute_value(dietplanner, shiitake_mushroom, description, "Flavorful and aromatic mushroom commonly used in Asian cuisine.").
attribute_value(dietplanner, shiitake_mushroom, calories, 34).

mushrooms_instance(dietplanner, mushrooms, oyster_mushroom).
attribute_value(dietplanner, oyster_mushroom, name, "Oyster Mushroom").
attribute_value(dietplanner, oyster_mushroom, description, "Delicate and tender mushroom with a mild flavor and oyster-like appearance.").
attribute_value(dietplanner, oyster_mushroom, calories, 33).

mushrooms_instance(dietplanner, mushrooms, chanterelle_mushroom).
attribute_value(dietplanner, chanterelle_mushroom, name, "Chanterelle Mushroom").
attribute_value(dietplanner, chanterelle_mushroom, description, "Wild mushroom with a fruity aroma and delicate taste.").
attribute_value(dietplanner, chanterelle_mushroom, calories, 38).

% Subclass: nuts
nuts_instance(dietplanner, nuts, almonds).
attribute_value(dietplanner, almonds, name, "Almonds").
attribute_value(dietplanner, almonds, description, "Crunchy almonds packed with healthy fats.").
attribute_value(dietplanner, almonds, calories, 579).

nuts_instance(dietplanner, nuts, walnuts).
attribute_value(dietplanner, walnuts, name, "Walnuts").
attribute_value(dietplanner, walnuts, description, "Heart-healthy nuts with a distinctive shape and earthy flavor.").
attribute_value(dietplanner, walnuts, calories, 654).

nuts_instance(dietplanner, nuts, cashews).
attribute_value(dietplanner, cashews, name, "Cashews").
attribute_value(dietplanner, cashews, description, "Creamy and mildly sweet nuts often used in both sweet and savory dishes.").
attribute_value(dietplanner, cashews, calories, 553).

nuts_instance(dietplanner, nuts, pistachios).
attribute_value(dietplanner, pistachios, name, "Pistachios").
attribute_value(dietplanner, pistachios, description, "Small and colorful nuts with a unique flavor and natural shell.").
attribute_value(dietplanner, pistachios, calories, 562).

nuts_instance(dietplanner, nuts, pecans).
attribute_value(dietplanner, pecans, name, "Pecans").
attribute_value(dietplanner, pecans, description, "Buttery and rich nuts often used in pies and baked goods.").
attribute_value(dietplanner, pecans, calories, 691).

% Subclass: seeds
seeds_instance(dietplanner, seeds, chia_seeds).
attribute_value(dietplanner, chia_seeds, name, "Chia Seeds").
attribute_value(dietplanner, chia_seeds, description, "Nutrient-rich chia seeds for added health benefits.").
attribute_value(dietplanner, chia_seeds, calories, 486).

seeds_instance(dietplanner, seeds, flaxseeds).
attribute_value(dietplanner, flaxseeds, name, "Flaxseeds").
attribute_value(dietplanner, flaxseeds, description, "Nutrient-packed seeds known for their high fiber and omega-3 content.").
attribute_value(dietplanner, flaxseeds, calories, 534).

seeds_instance(dietplanner, seeds, sunflower_seeds).
attribute_value(dietplanner, sunflower_seeds, name, "Sunflower Seeds").
attribute_value(dietplanner, sunflower_seeds, description, "Edible seeds from sunflower plants, often enjoyed as a snack.").
attribute_value(dietplanner, sunflower_seeds, calories, 584).

seeds_instance(dietplanner, seeds, pumpkin_seeds).
attribute_value(dietplanner, pumpkin_seeds, name, "Pumpkin Seeds").
attribute_value(dietplanner, pumpkin_seeds, description, "Nutrient-rich seeds harvested from pumpkins, commonly roasted and consumed.").
attribute_value(dietplanner, pumpkin_seeds, calories, 559).

seeds_instance(dietplanner, seeds, sesame_seeds).
attribute_value(dietplanner, sesame_seeds, name, "Sesame Seeds").
attribute_value(dietplanner, sesame_seeds, description, "Tiny seeds with a nutty flavor, used as a topping and ingredient in various cuisines.").
attribute_value(dietplanner, sesame_seeds, calories, 573).

% Subclass: salts
salts_instance(dietplanner, salts, sea_salt).
attribute_value(dietplanner, sea_salt, name, "Sea Salt").
attribute_value(dietplanner, sea_salt, description, "Natural sea salt to enhance the flavor of dishes.").
attribute_value(dietplanner, sea_salt, calories, 0).

salts_instance(dietplanner, salts, himalayan_pink_salt).
attribute_value(dietplanner, himalayan_pink_salt, name, "Himalayan Pink Salt").
attribute_value(dietplanner, himalayan_pink_salt, description, "Pink-colored salt mined from the Himalayan mountains, known for its trace minerals.").
attribute_value(dietplanner, himalayan_pink_salt, calories, 0).

salts_instance(dietplanner, salts, kosher_salt).
attribute_value(dietplanner, kosher_salt, name, "Kosher Salt").
attribute_value(dietplanner, kosher_salt, description, "Coarse-grained salt used in koshering meat and general cooking.").
attribute_value(dietplanner, kosher_salt, calories, 0).

salts_instance(dietplanner, salts, table_salt).
attribute_value(dietplanner, table_salt, name, "Table Salt").
attribute_value(dietplanner, table_salt, description, "Commonly used fine-grained salt, often fortified with iodine.").
attribute_value(dietplanner, table_salt, calories, 0).

salts_instance(dietplanner, salts, black_salt).
attribute_value(dietplanner, black_salt, name, "Black Salt").
attribute_value(dietplanner, black_salt, description, "Condiment salt with a distinctive sulfurous flavor, used in Indian cuisine.").
attribute_value(dietplanner, black_salt, calories, 0).

% Subclass: spices
spices_instance(dietplanner, spices, cinnamon).
attribute_value(dietplanner, cinnamon, name, "Cinnamon").
attribute_value(dietplanner, cinnamon, description, "Warm and aromatic cinnamon spice.").
attribute_value(dietplanner, cinnamon, calories, 247).

spices_instance(dietplanner, spices, turmeric).
attribute_value(dietplanner, turmeric, name, "Turmeric").
attribute_value(dietplanner, turmeric, description, "Bright yellow spice with anti-inflammatory properties, commonly used in curries.").
attribute_value(dietplanner, turmeric, calories, 354).

spices_instance(dietplanner, spices, paprika).
attribute_value(dietplanner, paprika, name, "Paprika").
attribute_value(dietplanner, paprika, description, "Ground red pepper spice with varying levels of heat and sweetness.").
attribute_value(dietplanner, paprika, calories, 282).

spices_instance(dietplanner, spices, cumin).
attribute_value(dietplanner, cumin, name, "Cumin").
attribute_value(dietplanner, cumin, description, "Aromatic spice with earthy and nutty flavor, commonly used in Middle Eastern and Indian cuisines.").
attribute_value(dietplanner, cumin, calories, 375).

spices_instance(dietplanner, spices, black_pepper).
attribute_value(dietplanner, black_pepper, name, "Black Pepper").
attribute_value(dietplanner, black_pepper, description, "Commonly used spice with a pungent and peppery flavor.").
attribute_value(dietplanner, black_pepper, calories, 251).

% Subclass: sweets
sweets_instance(dietplanner, sweets, dark_chocolate).
attribute_value(dietplanner, dark_chocolate, name, "Dark Chocolate").
attribute_value(dietplanner, dark_chocolate, description, "Rich and indulgent dark chocolate.").
attribute_value(dietplanner, dark_chocolate, calories, 546).

sweets_instance(dietplanner, sweets, gummy_bears).
attribute_value(dietplanner, gummy_bears, name, "Gummy Bears").
attribute_value(dietplanner, gummy_bears, description, "Chewy and colorful gelatin-based candy in the shape of bears.").
attribute_value(dietplanner, gummy_bears, calories, 325).

sweets_instance(dietplanner, sweets, cotton_candy).
attribute_value(dietplanner, cotton_candy, name, "Cotton Candy").
attribute_value(dietplanner, cotton_candy, description, "Light and fluffy spun sugar treat, often found at fairs and events.").
attribute_value(dietplanner, cotton_candy, calories, 398).

sweets_instance(dietplanner, sweets, ice_cream).
attribute_value(dietplanner, ice_cream, name, "Ice Cream").
attribute_value(dietplanner, ice_cream, description, "Frozen dessert made from dairy or non-dairy ingredients, available in numerous flavors.").
attribute_value(dietplanner, ice_cream, calories, 207).

sweets_instance(dietplanner, sweets, donut).
attribute_value(dietplanner, donut, name, "Donut").
attribute_value(dietplanner, donut, description, "Deep-fried sweet pastry often coated with icing or powdered sugar.").
attribute_value(dietplanner, donut, calories, 452).

% Subclass: beverage
% Subclass: alcoholic_beverages
instance(dietplanner, alcoholic_beverages).
attribute_value(dietplanner, alcoholic_beverages, name, "Red Wine").
attribute_value(dietplanner, alcoholic_beverages, description, "Classic red wine for a delightful evening.").
attribute_value(dietplanner, alcoholic_beverages, calories, 85).

instance(dietplanner, alcoholic_beverages).
attribute_value(dietplanner, alcoholic_beverages, name, "Beer").
attribute_value(dietplanner, alcoholic_beverages, description, "Classic beer for a casual drink.").
attribute_value(dietplanner, alcoholic_beverages, calories, 43).

instance(dietplanner, alcoholic_beverages).
attribute_value(dietplanner, alcoholic_beverages, name, "Vodka").
attribute_value(dietplanner, alcoholic_beverages, description, "Clear and versatile vodka for mixing or sipping.").
attribute_value(dietplanner, alcoholic_beverages, calories, 96).

instance(dietplanner, alcoholic_beverages).
attribute_value(dietplanner, alcoholic_beverages, name, "Rum").
attribute_value(dietplanner, alcoholic_beverages, description, "Smooth and flavorful rum for cocktails.").
attribute_value(dietplanner, alcoholic_beverages, calories, 231).

instance(dietplanner, alcoholic_beverages).
attribute_value(dietplanner, alcoholic_beverages, name, "Gin").
attribute_value(dietplanner, alcoholic_beverages, description, "Juniper-infused gin for classic cocktails.").
attribute_value(dietplanner, alcoholic_beverages, calories, 263).

instance(dietplanner, alcoholic_beverages).
attribute_value(dietplanner, alcoholic_beverages, name, "Tequila").
attribute_value(dietplanner, alcoholic_beverages, description, "Agave-based tequila for margaritas and more.").
attribute_value(dietplanner, alcoholic_beverages, calories, 96).

% Subclass: coffee_energydrinks
instance(dietplanner, coffee_energydrinks).
attribute_value(dietplanner, coffee_energydrinks, name, "Espresso").
attribute_value(dietplanner, coffee_energydrinks, description, "Strong and invigorating espresso shot.").
attribute_value(dietplanner, coffee_energydrinks, calories, 2).

instance(dietplanner, coffee_energydrinks).
attribute_value(dietplanner, coffee_energydrinks, name, "Cold Brew Coffee").
attribute_value(dietplanner, coffee_energydrinks, description, "Smooth and cold brewed coffee for a refreshing kick.").
attribute_value(dietplanner, coffee_energydrinks, calories, 3).

instance(dietplanner, coffee_energydrinks).
attribute_value(dietplanner, coffee_energydrinks, name, "Energy Drink").
attribute_value(dietplanner, coffee_energydrinks, description, "High-energy drink with caffeine for an energy boost.").
attribute_value(dietplanner, coffee_energydrinks, calories, 45).

instance(dietplanner, coffee_energydrinks).
attribute_value(dietplanner, coffee_energydrinks, name, "Iced Latte").
attribute_value(dietplanner, coffee_energydrinks, description, "Chilled latte with espresso and milk for a creamy taste.").
attribute_value(dietplanner, coffee_energydrinks, calories, 29).

instance(dietplanner, coffee_energydrinks).
attribute_value(dietplanner, coffee_energydrinks, name, "Black Coffee").
attribute_value(dietplanner, coffee_energydrinks, description, "Strong and bold black coffee for a wake-up call.").
attribute_value(dietplanner, coffee_energydrinks, calories, 2).

instance(dietplanner, coffee_energydrinks).
attribute_value(dietplanner, coffee_energydrinks, name, "Mocha Frappuccino").
attribute_value(dietplanner, coffee_energydrinks, description, "Creamy and chocolaty mocha frappuccino for a delightful treat.").
attribute_value(dietplanner, coffee_energydrinks, calories, 54).

% Subclass: soda
instance(dietplanner, soda).
attribute_value(dietplanner, soda, name, "Cola").
attribute_value(dietplanner, soda, description, "Classic cola soda for a refreshing taste.").
attribute_value(dietplanner, soda, calories, 42).

instance(dietplanner, soda).
attribute_value(dietplanner, soda, name, "Lemon Lime Soda").
attribute_value(dietplanner, soda, description, "Citrusy lemon-lime soda for a zesty flavor.").
attribute_value(dietplanner, soda, calories, 41).

instance(dietplanner, soda).
attribute_value(dietplanner, soda, name, "Cola Light").
attribute_value(dietplanner, soda, description, "Light version of classic cola for reduced calories.").
attribute_value(dietplanner, soda, calories, 0).

instance(dietplanner, soda).
attribute_value(dietplanner, soda, name, "Ginger Ale").
attribute_value(dietplanner, soda, description, "Bubbly ginger ale with a hint of spice.").
attribute_value(dietplanner, soda, calories, 37).

instance(dietplanner, soda).
attribute_value(dietplanner, soda, name, "Orange Soda").
attribute_value(dietplanner, soda, description, "Fizzy orange soda for a burst of citrus.").
attribute_value(dietplanner, soda, calories, 42).

instance(dietplanner, soda).
attribute_value(dietplanner, soda, name, "Root Beer").
attribute_value(dietplanner, soda, description, "Classic root beer with a rich and creamy taste.").
attribute_value(dietplanner, soda, calories, 46).

% Subclass: juice
instance(dietplanner, juice).
attribute_value(dietplanner, juice, name, "Orange Juice").
attribute_value(dietplanner, juice, description, "Freshly squeezed orange juice for a vitamin C boost.").
attribute_value(dietplanner, juice, calories, 45).

instance(dietplanner, juice).
attribute_value(dietplanner, juice, name, "Grapefruit Juice").
attribute_value(dietplanner, juice, description, "Tangy and invigorating grapefruit juice.").
attribute_value(dietplanner, juice, calories, 39).

instance(dietplanner, juice).
attribute_value(dietplanner, juice, name, "Pineapple Juice").
attribute_value(dietplanner, juice, description, "Sweet and tropical pineapple juice.").
attribute_value(dietplanner, juice, calories, 50).

instance(dietplanner, juice).
attribute_value(dietplanner, juice, name, "Cranberry Juice").
attribute_value(dietplanner, juice, description, "Tart and antioxidant-rich cranberry juice.").
attribute_value(dietplanner, juice, calories, 46).

instance(dietplanner, juice).
attribute_value(dietplanner, juice, name, "Mango Juice").
attribute_value(dietplanner, juice, description, "Smooth and luscious mango juice.").
attribute_value(dietplanner, juice, calories, 54).

instance(dietplanner, juice).
attribute_value(dietplanner, juice, name, "Watermelon Juice").
attribute_value(dietplanner, juice, description, "Refreshing watermelon juice for hydration.").
attribute_value(dietplanner, juice, calories, 30).

% Subclass: water
instance(dietplanner, water).
attribute_value(dietplanner, water, name, "Mineral Water").
attribute_value(dietplanner, water, description, "Refreshing mineral water for hydration.").
attribute_value(dietplanner, water, calories, 0).

instance(dietplanner, water).
attribute_value(dietplanner, water, name, "Sparkling Water").
attribute_value(dietplanner, water, description, "Bubbly sparkling water for a refreshing effervescence.").
attribute_value(dietplanner, water, calories, 0).

instance(dietplanner, water).
attribute_value(dietplanner, water, name, "Spring Water").
attribute_value(dietplanner, water, description, "Fresh and pure spring water sourced from natural springs.").
attribute_value(dietplanner, water, calories, 0).

instance(dietplanner, water).
attribute_value(dietplanner, water, name, "Mineral Water with Lemon").
attribute_value(dietplanner, water, description, "Mineral water infused with zesty lemon flavor.").
attribute_value(dietplanner, water, calories, 2).

instance(dietplanner, water).
attribute_value(dietplanner, water, name, "Coconut Water").
attribute_value(dietplanner, water, description, "Natural and hydrating coconut water.").
attribute_value(dietplanner, water, calories, 19).

instance(dietplanner, water).
attribute_value(dietplanner, water, name, "Infused Water with Cucumber and Mint").
attribute_value(dietplanner, water, description, "Refreshing infused water with cool cucumber and fresh mint.").
attribute_value(dietplanner, water, calories, 0).



% ---------
% Class: nutrient

% Subclass: alcoholic
instance(dietplanner, alcoholic).
attribute_value(dietplanner, alcoholic, name, "Ethanol").
attribute_value(dietplanner, alcoholic, description, "The psychoactive ingredient in alcoholic beverages.").

% Subclass: amino_acidic
instance(dietplanner, amino_acidic).
attribute_value(dietplanner, amino_acidic, name, "Tryptophan").
attribute_value(dietplanner, amino_acidic, description, "Essential amino acid important for mood regulation and serotonin production.").

instance(dietplanner, amino_acidic).
attribute_value(dietplanner, amino_acidic, name, "Leucine").
attribute_value(dietplanner, amino_acidic, description, "Essential amino acid vital for muscle growth and repair.").

instance(dietplanner, amino_acidic).
attribute_value(dietplanner, amino_acidic, name, "Valine").
attribute_value(dietplanner, amino_acidic, description, "Essential amino acid involved in energy production and tissue repair.").

instance(dietplanner, amino_acidic).
attribute_value(dietplanner, amino_acidic, name, "Methionine").
attribute_value(dietplanner, amino_acidic, description, "Essential amino acid important for metabolism and detoxification.").

instance(dietplanner, amino_acidic).
attribute_value(dietplanner, amino_acidic, name, "Phenylalanine").
attribute_value(dietplanner, amino_acidic, description, "Essential amino acid precursor to various neurotransmitters and hormones.").

% Subclass: dietary_fiber
instance(dietplanner, dietary_fiber).
attribute_value(dietplanner, dietary_fiber, name, "Soluble Fiber").
attribute_value(dietplanner, dietary_fiber, description, "Fiber that dissolves in water and forms a gel-like substance.").

instance(dietplanner, dietary_fiber).
attribute_value(dietplanner, dietary_fiber, name, "Insoluble Fiber").
attribute_value(dietplanner, dietary_fiber, description, "Fiber that does not dissolve in water and promotes regular bowel movements.").

instance(dietplanner, dietary_fiber).
attribute_value(dietplanner, dietary_fiber, name, "Pectin").
attribute_value(dietplanner, dietary_fiber, description, "Soluble fiber found in fruits and used for making jams and jellies.").

instance(dietplanner, dietary_fiber).
attribute_value(dietplanner, dietary_fiber, name, "Cellulose").
attribute_value(dietplanner, dietary_fiber, description, "Plant-based fiber that provides structure to plant cell walls.").

instance(dietplanner, dietary_fiber).
attribute_value(dietplanner, dietary_fiber, name, "Oligosaccharides").
attribute_value(dietplanner, dietary_fiber, description, "Short-chain carbohydrates with potential prebiotic effects.").

instance(dietplanner, dietary_fiber).
attribute_value(dietplanner, dietary_fiber, name, "Resistant Starch").
attribute_value(dietplanner, dietary_fiber, description, "Starch that escapes digestion in the small intestine and provides benefits to the large intestine.").

% Subclass: carbs
instance(dietplanner, carbs).
attribute_value(dietplanner, carbs, name, "Complex Carbohydrates").
attribute_value(dietplanner, carbs, description, "Carbohydrates with longer chains of sugar molecules.").

instance(dietplanner, carbs).
attribute_value(dietplanner, carbs, name, "Glucose").
attribute_value(dietplanner, carbs, description, "Simple sugar and primary source of energy for the body.").

instance(dietplanner, carbs).
attribute_value(dietplanner, carbs, name, "Fructose").
attribute_value(dietplanner, carbs, description, "Naturally occurring sugar found in fruits and honey.").

instance(dietplanner, carbs).
attribute_value(dietplanner, carbs, name, "Starch").
attribute_value(dietplanner, carbs, description, "Complex carbohydrate providing sustained energy.").

instance(dietplanner, carbs).
attribute_value(dietplanner, carbs, name, "Lactose").
attribute_value(dietplanner, carbs, description, "Sugar found in milk and dairy products.").

instance(dietplanner, carbs).
attribute_value(dietplanner, carbs, name, "Galactose").
attribute_value(dietplanner, carbs, description, "Simple sugar found in milk and as part of lactose.").

% Subclass: lipids
instance(dietplanner, lipids).
attribute_value(dietplanner, lipids, name, "Saturated Fats").
attribute_value(dietplanner, lipids, description, "Fats with no double bonds between carbon molecules.").

instance(dietplanner, lipids).
attribute_value(dietplanner, lipids, name, "Monounsaturated Fat").
attribute_value(dietplanner, lipids, description, "Healthy fat with one double bond in its structure.").

instance(dietplanner, lipids).
attribute_value(dietplanner, lipids, name, "Polyunsaturated Fat").
attribute_value(dietplanner, lipids, description, "Healthy fat with multiple double bonds in its structure.").

instance(dietplanner, lipids).
attribute_value(dietplanner, lipids, name, "Trans Fat").
attribute_value(dietplanner, lipids, description, "Unhealthy fat created through hydrogenation, found in some processed foods.").

instance(dietplanner, lipids).
attribute_value(dietplanner, lipids, name, "Omega-3 Fatty Acids").
attribute_value(dietplanner, lipids, description, "Essential fatty acids with anti-inflammatory benefits.").

% Subclass: minerals
instance(dietplanner, minerals).
attribute_value(dietplanner, minerals, name, "Calcium").
attribute_value(dietplanner, minerals, description, "Mineral important for bone health and muscle function.").

instance(dietplanner, minerals).
attribute_value(dietplanner, minerals, name, "Iron").
attribute_value(dietplanner, minerals, description, "Critical mineral for oxygen transport and energy production.").

instance(dietplanner, minerals).
attribute_value(dietplanner, minerals, name, "Potassium").
attribute_value(dietplanner, minerals, description, "Electrolyte crucial for fluid balance and nerve function.").

instance(dietplanner, minerals).
attribute_value(dietplanner, minerals, name, "Magnesium").
attribute_value(dietplanner, minerals, description, "Involved in hundreds of biochemical reactions in the body.").

instance(dietplanner, minerals).
attribute_value(dietplanner, minerals, name, "Zinc").
attribute_value(dietplanner, minerals, description, "Essential trace mineral supporting immune function and more.").

% Subclass: protein
instance(dietplanner, protein).
attribute_value(dietplanner, protein, name, "Whey Protein").
attribute_value(dietplanner, protein, description, "High-quality protein derived from milk.").

instance(dietplanner, protein).
attribute_value(dietplanner, protein, name, "Casein Protein").
attribute_value(dietplanner, protein, description, "Slow-digesting protein found in milk products and supplements.").

instance(dietplanner, protein).
attribute_value(dietplanner, protein, name, "Soy Protein").
attribute_value(dietplanner, protein, description, "Plant-based protein derived from soybeans, suitable for vegetarians and vegans.").

instance(dietplanner, protein).
attribute_value(dietplanner, protein, name, "Egg White Protein").
attribute_value(dietplanner, protein, description, "Protein sourced from egg whites, low in fat and carbohydrates.").

instance(dietplanner, protein).
attribute_value(dietplanner, protein, name, "Pea Protein").
attribute_value(dietplanner, protein, description, "Plant-based protein extracted from yellow peas, suitable for various diets.").

% Subclass: vitamin
instance(dietplanner, vitamin).
attribute_value(dietplanner, vitamin, name, "Vitamin C").
attribute_value(dietplanner, vitamin, description, "An antioxidant vitamin that supports immune health.").

instance(dietplanner, vitamin).
attribute_value(dietplanner, vitamin, name, "Vitamin D").
attribute_value(dietplanner, vitamin, description, "Crucial vitamin for bone health and calcium absorption.").

instance(dietplanner, vitamin).
attribute_value(dietplanner, vitamin, name, "Vitamin A").
attribute_value(dietplanner, vitamin, description, "Essential for vision, immune function, and cell growth.").

instance(dietplanner, vitamin).
attribute_value(dietplanner, vitamin, name, "Vitamin K").
attribute_value(dietplanner, vitamin, description, "Vitamin necessary for blood clotting and bone health.").

instance(dietplanner, vitamin).
attribute_value(dietplanner, vitamin, name, "Vitamin E").
attribute_value(dietplanner, vitamin, description, "Antioxidant vitamin protecting cells from damage.").


% ---------
% Class: allergen
instance(dietplanner, allergen).
attribute_value(dietplanner, allergen, name, "Gluten").
attribute_value(dietplanner, allergen, description, "A protein found in wheat, barley, and rye.").

instance(dietplanner, allergen).
attribute_value(dietplanner, allergen, name, "Dairy").
attribute_value(dietplanner, allergen, description, "Products containing milk or milk-derived ingredients.").

instance(dietplanner, allergen).
attribute_value(dietplanner, allergen, name, "Peanuts").
attribute_value(dietplanner, allergen, description, "Tree nuts that can cause severe allergies.").

instance(dietplanner, allergen).
attribute_value(dietplanner, allergen, name, "Soy").
attribute_value(dietplanner, allergen, description, "Products made from soybeans.").

instance(dietplanner, allergen).
attribute_value(dietplanner, allergen, name, "Shellfish").
attribute_value(dietplanner, allergen, description, "Seafood like shrimp, crab, and lobster.").


% ---------
% Class: person
instance(dietplanner, person).
attribute_value(dietplanner, person, name, "Alice").
attribute_value(dietplanner, person, surname, "Johnson").
attribute_value(dietplanner, person, age, 30).
attribute_value(dietplanner, person, gender, "Female").
attribute_value(dietplanner, person, height, 165).
attribute_value(dietplanner, person, weight, 60.5).

instance(dietplanner, person).
attribute_value(dietplanner, person, name, "Bob").
attribute_value(dietplanner, person, surname, "Smith").
attribute_value(dietplanner, person, age, 28).
attribute_value(dietplanner, person, gender, "Male").
attribute_value(dietplanner, person, height, 180).
attribute_value(dietplanner, person, weight, 75.2).

instance(dietplanner, person).
attribute_value(dietplanner, person, name, "Emma").
attribute_value(dietplanner, person, surname, "Davis").
attribute_value(dietplanner, person, age, 22).
attribute_value(dietplanner, person, gender, "Female").
attribute_value(dietplanner, person, height, 158).
attribute_value(dietplanner, person, weight, 55.0).

instance(dietplanner, person).
attribute_value(dietplanner, person, name, "Michael").
attribute_value(dietplanner, person, surname, "Brown").
attribute_value(dietplanner, person, age, 35).
attribute_value(dietplanner, person, gender, "Male").
attribute_value(dietplanner, person, height, 175).
attribute_value(dietplanner, person, weight, 80.7).

instance(dietplanner, person).
attribute_value(dietplanner, person, name, "Sophia").
attribute_value(dietplanner, person, surname, "Miller").
attribute_value(dietplanner, person, age, 29).
attribute_value(dietplanner, person, gender, "Female").
attribute_value(dietplanner, person, height, 170).
attribute_value(dietplanner, person, weight, 63.8).

% ---------
% Class: activity
instance(dietplanner, activity).
attribute_value(dietplanner, activity, name, "Running").
attribute_value(dietplanner, activity, description, "Go for a run to boost your cardiovascular health.").
attribute_value(dietplanner, activity, calory_effort, 600).

instance(dietplanner, activity).
attribute_value(dietplanner, activity, name, "Swimming").
attribute_value(dietplanner, activity, description, "Hit the pool for a full-body workout.").
attribute_value(dietplanner, activity, calory_effort, 700).

instance(dietplanner, activity).
attribute_value(dietplanner, activity, name, "Yoga").
attribute_value(dietplanner, activity, description, "Relax and stretch with a calming yoga session.").
attribute_value(dietplanner, activity, calory_effort, 300).

instance(dietplanner, activity).
attribute_value(dietplanner, activity, name, "Weightlifting").
attribute_value(dietplanner, activity, description, "Build strength and muscle with weightlifting.").
attribute_value(dietplanner, activity, calory_effort, 400).

instance(dietplanner, activity).
attribute_value(dietplanner, activity, name, "Cycling").
attribute_value(dietplanner, activity, description, "Take a bike ride for a fun and effective workout.").
attribute_value(dietplanner, activity, calory_effort, 500).

% Subclass: sports
instance(dietplanner, sports).
attribute_value(dietplanner, sports, name, "Soccer").
attribute_value(dietplanner, sports, description, "Play soccer for a team-based cardio workout.").
attribute_value(dietplanner, sports, calory_effort, 800).

instance(dietplanner, sports).
attribute_value(dietplanner, sports, name, "Basketball").
attribute_value(dietplanner, sports, description, "Shoot hoops and run on the court for fitness.").
attribute_value(dietplanner, sports, calory_effort, 700).

instance(dietplanner, sports).
attribute_value(dietplanner, sports, name, "Tennis").
attribute_value(dietplanner, sports, description, "Enjoy a game of tennis to improve agility.").
attribute_value(dietplanner, sports, calory_effort, 600).

instance(dietplanner, sports).
attribute_value(dietplanner, sports, name, "Volleyball").
attribute_value(dietplanner, sports, description, "Bump, set, and spike in a game of volleyball.").
attribute_value(dietplanner, sports, calory_effort, 500).

instance(dietplanner, sports).
attribute_value(dietplanner, sports, name, "Cycling Race").
attribute_value(dietplanner, sports, description, "Participate in a cycling race for a challenging workout.").
attribute_value(dietplanner, sports, calory_effort, 1000).

% Subclass: inactivity
instance(dietplanner, inactivity).
attribute_value(dietplanner, inactivity, name, "Sitting").
attribute_value(dietplanner, inactivity, description, "Sitting for extended periods can be detrimental to health.").
attribute_value(dietplanner, inactivity, calory_effort, 100).

instance(dietplanner, inactivity).
attribute_value(dietplanner, inactivity, name, "TV Watching").
attribute_value(dietplanner, inactivity, description, "Watching TV for hours can lead to a sedentary lifestyle.").
attribute_value(dietplanner, inactivity, calory_effort, 50).

instance(dietplanner, inactivity).
attribute_value(dietplanner, inactivity, name, "Desk Work").
attribute_value(dietplanner, inactivity, description, "Sitting at a desk for work without breaks can impact well-being.").
attribute_value(dietplanner, inactivity, calory_effort, 70).

instance(dietplanner, inactivity).
attribute_value(dietplanner, inactivity, name, "Reading").
attribute_value(dietplanner, inactivity, description, "Reading for long periods can lead to reduced physical activity.").
attribute_value(dietplanner, inactivity, calory_effort, 60).

instance(dietplanner, inactivity).
attribute_value(dietplanner, inactivity, name, "Computer Use").
attribute_value(dietplanner, inactivity, description, "Using a computer for extended periods can contribute to inactivity.").
attribute_value(dietplanner, inactivity, calory_effort, 80).

% Subclass: walking
instance(dietplanner, walking).
attribute_value(dietplanner, walking, name, "Brisk Walking").
attribute_value(dietplanner, walking, description, "Take a brisk walk to improve cardiovascular health.").
attribute_value(dietplanner, walking, calory_effort, 300).

instance(dietplanner, walking).
attribute_value(dietplanner, walking, name, "Nature Walk").
attribute_value(dietplanner, walking, description, "Enjoy a leisurely walk in nature for mental and physical well-being.").
attribute_value(dietplanner, walking, calory_effort, 200).

instance(dietplanner, walking).
attribute_value(dietplanner, walking, name, "Power Walking").
attribute_value(dietplanner, walking, description, "Engage in power walking for an effective workout.").
attribute_value(dietplanner, walking, calory_effort, 400).

instance(dietplanner, walking).
attribute_value(dietplanner, walking, name, "Evening Stroll").
attribute_value(dietplanner, walking, description, "Take a relaxing evening stroll to unwind.").
attribute_value(dietplanner, walking, calory_effort, 150).

instance(dietplanner, walking).
attribute_value(dietplanner, walking, name, "Urban Walking").
attribute_value(dietplanner, walking, description, "Explore the city on foot with urban walking.").
attribute_value(dietplanner, walking, calory_effort, 250).

% ---------
% Class: meal
instance(dietplanner, meal).
attribute_value(dietplanner, meal, name, "Breakfast").
attribute_value(dietplanner, meal, description, "Start your day with a healthy breakfast.").

instance(dietplanner, meal).
attribute_value(dietplanner, meal, name, "Lunch").
attribute_value(dietplanner, meal, description, "A balanced lunch to keep you energized.").

instance(dietplanner, meal).
attribute_value(dietplanner, meal, name, "Dinner").
attribute_value(dietplanner, meal, description, "A light and nutritious dinner option.").

instance(dietplanner, meal).
attribute_value(dietplanner, meal, name, "Snack 1").
attribute_value(dietplanner, meal, description, "A quick and healthy snack.").

instance(dietplanner, meal).
attribute_value(dietplanner, meal, name, "Snack 2").
attribute_value(dietplanner, meal, description, "Another tasty snack to curb your hunger.").

% Subclass: main_meals
instance(dietplanner, main_meals).
attribute_value(dietplanner, main_meals, name, "Chicken Stir-Fry").
attribute_value(dietplanner, main_meals, description, "A flavorful stir-fry with lean chicken and vegetables.").

instance(dietplanner, main_meals).
attribute_value(dietplanner, main_meals, name, "Vegetable Curry").
attribute_value(dietplanner, main_meals, description, "A hearty curry loaded with assorted vegetables.").

instance(dietplanner, main_meals).
attribute_value(dietplanner, main_meals, name, "Grilled Salmon").
attribute_value(dietplanner, main_meals, description, "Freshly grilled salmon fillet with a citrus glaze.").

instance(dietplanner, main_meals).
attribute_value(dietplanner, main_meals, name, "Pasta Primavera").
attribute_value(dietplanner, main_meals, description, "Pasta tossed with seasonal vegetables in a light sauce.").

instance(dietplanner, main_meals).
attribute_value(dietplanner, main_meals, name, "Quinoa Bowl").
attribute_value(dietplanner, main_meals, description, "A nutritious bowl featuring quinoa, greens, and assorted toppings.").

% Subclass: snacks
instance(dietplanner, snacks).
attribute_value(dietplanner, snacks, name, "Greek Yogurt Parfait").
attribute_value(dietplanner, snacks, description, "Layers of Greek yogurt, granola, and fresh berries.").

instance(dietplanner, snacks).
attribute_value(dietplanner, snacks, name, "Hummus and Veggies").
attribute_value(dietplanner, snacks, description, "Crunchy vegetables paired with creamy hummus.").

instance(dietplanner, snacks).
attribute_value(dietplanner, snacks, name, "Trail Mix").
attribute_value(dietplanner, snacks, description, "A mix of nuts, dried fruits, and chocolate chips for a quick snack.").

instance(dietplanner, snacks).
attribute_value(dietplanner, snacks, name, "Rice Cakes with Peanut Butter").
attribute_value(dietplanner, snacks, description, "Light rice cakes spread with peanut butter.").

instance(dietplanner, snacks).
attribute_value(dietplanner, snacks, name, "Apple Slices with Almond Butter").
attribute_value(dietplanner, snacks, description, "Fresh apple slices served with almond butter.").

% Function to compute the total calories about a list of foods 
compute_calories_amount([], 0).
compute_calories_amount([Food|Rest], TotalCalories) :-
    fact(_, attribute_value(dietplanner, Food, calories, CaloriesFood), _),
    compute_calories_amount(Rest, RestCalories),
    TotalCalories is RestCalories + CaloriesFood.