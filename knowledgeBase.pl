:- dynamic(fact/3).

% ---------------------------------------------------------------------------------------------------------------------------------------
% FACTS
% ---------------------------------------------------------------------------------------------------------------------------------------

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
% Dish
% ---------
% Classes
fact(103, entity(dietplanner, dish), 1).

% Attributes 
fact(104, attribute(dietplanner, dish, name, string), 1).
fact(105, mandatory(dietplanner, dish, name), 1).
fact(116, attribute(dietplanner, dish, description, string), 1).
fact(107, mandatory(dietplanner, dish, description), 1).
fact(108, attribute(dietplanner, dish, type, select), 1).
fact(109, values(dietplanner, dish, type, [breakfast, lunch, dinner, snack]), 1).
fact(110, mandatory(dietplanner, dish, type), 1).

% ---------
% Diet
% ---------
% Classes
fact(111, entity(dietplanner, diet), 1).

% Attributes 
fact(112, attribute(dietplanner, diet, type, select), 1).
fact(113, values(dietplanner, diet, type, [normocaloric]), 1).      % Add more diet types in future enhancements

% TODO: find the proper way to specify that an attribute is a list and what is its structure
% For example breakfasts -> list of pairs Dish-grams, where each Dish's type is equal to breakfast
% This could be done using rules (so is done here) -> Anyway check this.
fact(114, entity(dietplanner, daily_diet), 1).
fact(115, parent(dietplanner, diet, daily_diet), 1).
fact(116, attribute(dietplanner, daily_diet, day, select), 1).
fact(117, values(dietplanner, daily_diet, day, [monday, tuesday, wednesday, thurday, friday, saturday, sunday]), 1).
fact(118, mandatory(dietplanner, daily_diet, day), 1).
fact(129, distinguishing(dietplanner, daily_diet, day), 1).

% ---------
% Relationships
% ---------
% TODO: find (or ask) a way to define relationships 
% in other KB they seem to be defined through rules (sinceramente non mi convince granché, ma lo faccio lo stesso)
relationships(1, has_nutrient(foodbeverage, nutrient), 1, 100).
relationships(2, part_of(nutrient, foodbeverage), 1, 100000).
relationships(3, carry_out(person, activity-hours), 0, 100).
relationships(4, is_allergic(person, allergen), 0, 100).
relationships(5, is_contained(allergen, foodbeverage), 0, 100).
relationships(6, made_for(diet, person), 1, 1).
relationships(7, suggested_diet(person, diet), 0, 100).
relationships(8, composed_of(diet, daily_diet), 7, 7).
relationships(9, has(daily_diet, dish), 5, 5).
relationships(10, made_of(dish, foodbeverage), 1, 100).

% ---------------------------------------------------------------------------------------------------------------------------------------
% INSTANCES
% ---------------------------------------------------------------------------------------------------------------------------------------

% ---------
% Class: food_beverage
% ---------
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
alcoholic_beverages_instance(dietplanner, alcoholic_beverages, red_wine).
attribute_value(dietplanner, red_wine, name, "Red Wine").
attribute_value(dietplanner, red_wine, description, "Classic red wine for a delightful evening.").
attribute_value(dietplanner, red_wine, calories, 85).

alcoholic_beverages_instance(dietplanner, alcoholic_beverages, beer).
attribute_value(dietplanner, beer, name, "Beer").
attribute_value(dietplanner, beer, description, "Classic beer for a casual drink.").
attribute_value(dietplanner, beer, calories, 43).

alcoholic_beverages_instance(dietplanner, alcoholic_beverages, vodka).
attribute_value(dietplanner, vodka, name, "Vodka").
attribute_value(dietplanner, vodka, description, "Clear and versatile vodka for mixing or sipping.").
attribute_value(dietplanner, vodka, calories, 96).

alcoholic_beverages_instance(dietplanner, alcoholic_beverages, rum).
attribute_value(dietplanner, rum, name, "Rum").
attribute_value(dietplanner, rum, description, "Smooth and flavorful rum for cocktails.").
attribute_value(dietplanner, rum, calories, 231).

alcoholic_beverages_instance(dietplanner, alcoholic_beverages, gin).
attribute_value(dietplanner, gin, name, "Gin").
attribute_value(dietplanner, gin, description, "Juniper-infused gin for classic cocktails.").
attribute_value(dietplanner, gin, calories, 263).

alcoholic_beverages_instance(dietplanner, alcoholic_beverages, tequila).
attribute_value(dietplanner, tequila, name, "Tequila").
attribute_value(dietplanner, tequila, description, "Agave-based tequila for margaritas and more.").
attribute_value(dietplanner, tequila, calories, 96).

% Subclass: coffee_energydrinks
coffee_energydrinks_instance(dietplanner, coffee_energydrinks, espresso).
attribute_value(dietplanner, espresso, name, "Espresso").
attribute_value(dietplanner, espresso, description, "Strong and invigorating espresso shot.").
attribute_value(dietplanner, espresso, calories, 2).

coffee_energydrinks_instance(dietplanner, coffee_energydrinks, cold_brew_coffee).
attribute_value(dietplanner, cold_brew_coffee, name, "Cold Brew Coffee").
attribute_value(dietplanner, cold_brew_coffee, description, "Smooth and cold brewed coffee for a refreshing kick.").
attribute_value(dietplanner, cold_brew_coffee, calories, 3).

coffee_energydrinks_instance(dietplanner, coffee_energydrinks, energy_drink).
attribute_value(dietplanner, energy_drink, name, "Energy Drink").
attribute_value(dietplanner, energy_drink, description, "High-energy drink with caffeine for an energy boost.").
attribute_value(dietplanner, energy_drink, calories, 45).

coffee_energydrinks_instance(dietplanner, coffee_energydrinks, iced_latte).
attribute_value(dietplanner, iced_latte, name, "Iced Latte").
attribute_value(dietplanner, iced_latte, description, "Chilled latte with espresso and milk for a creamy taste.").
attribute_value(dietplanner, iced_latte, calories, 29).

coffee_energydrinks_instance(dietplanner, coffee_energydrinks, black_coffee).
attribute_value(dietplanner, black_coffee, name, "Black Coffee").
attribute_value(dietplanner, black_coffee, description, "Strong and bold black coffee for a wake-up call.").
attribute_value(dietplanner, black_coffee, calories, 2).

coffee_energydrinks_instance(dietplanner, coffee_energydrinks, mocha_frappuccino).
attribute_value(dietplanner, mocha_frappuccino, name, "Mocha Frappuccino").
attribute_value(dietplanner, mocha_frappuccino, description, "Creamy and chocolaty mocha frappuccino for a delightful treat.").
attribute_value(dietplanner, mocha_frappuccino, calories, 54).

% Subclass: soda
soda_instance(dietplanner, soda, cola).
attribute_value(dietplanner, cola, name, "Cola").
attribute_value(dietplanner, cola, description, "Classic cola soda for a refreshing taste.").
attribute_value(dietplanner, cola, calories, 42).

soda_instance(dietplanner, soda, lemon_lime).
attribute_value(dietplanner, lemon_lime, name, "Lemon Lime Soda").
attribute_value(dietplanner, lemon_lime, description, "Citrusy lemon-lime soda for a zesty flavor.").
attribute_value(dietplanner, lemon_lime, calories, 41).

soda_instance(dietplanner, soda, cola_light).
attribute_value(dietplanner, cola_light, name, "Cola Light").
attribute_value(dietplanner, cola_light, description, "Light version of classic cola for reduced calories.").
attribute_value(dietplanner, cola_light, calories, 0).

soda_instance(dietplanner, soda, ginger_ale).
attribute_value(dietplanner, ginger_ale, name, "Ginger Ale").
attribute_value(dietplanner, ginger_ale, description, "Bubbly ginger ale with a hint of spice.").
attribute_value(dietplanner, ginger_ale, calories, 37).

soda_instance(dietplanner, soda, orange_soda).
attribute_value(dietplanner, orange_soda, name, "Orange Soda").
attribute_value(dietplanner, orange_soda, description, "Fizzy orange soda for a burst of citrus.").
attribute_value(dietplanner, orange_soda, calories, 42).

soda_instance(dietplanner, soda, root_beer).
attribute_value(dietplanner, root_beer, name, "Root Beer").
attribute_value(dietplanner, root_beer, description, "Classic root beer with a rich and creamy taste.").
attribute_value(dietplanner, root_beer, calories, 46).

% Subclass: juice
juice_instance(dietplanner, juice, orange_juice).
attribute_value(dietplanner, orange_juice, name, "Orange Juice").
attribute_value(dietplanner, orange_juice, description, "Freshly squeezed orange juice for a vitamin C boost.").
attribute_value(dietplanner, orange_juice, calories, 45).

juice_instance(dietplanner, juice, grapefruit_juice).
attribute_value(dietplanner, grapefruit_juice, name, "Grapefruit Juice").
attribute_value(dietplanner, grapefruit_juice, description, "Tangy and invigorating grapefruit juice.").
attribute_value(dietplanner, grapefruit_juice, calories, 39).

juice_instance(dietplanner, juice, pineapple_juice).
attribute_value(dietplanner, pineapple_juice, name, "Pineapple Juice").
attribute_value(dietplanner, pineapple_juice, description, "Sweet and tropical pineapple juice.").
attribute_value(dietplanner, pineapple_juice, calories, 50).

juice_instance(dietplanner, juice, cranberry_juice).
attribute_value(dietplanner, cranberry_juice, name, "Cranberry Juice").
attribute_value(dietplanner, cranberry_juice, description, "Tart and antioxidant-rich cranberry juice.").
attribute_value(dietplanner, cranberry_juice, calories, 46).

juice_instance(dietplanner, juice, mango_juice).
attribute_value(dietplanner, mango_juice, name, "Mango Juice").
attribute_value(dietplanner, mango_juice, description, "Smooth and luscious mango juice.").
attribute_value(dietplanner, mango_juice, calories, 54).

juice_instance(dietplanner, juice, watermelon_juice).
attribute_value(dietplanner, watermelon_juice, name, "Watermelon Juice").
attribute_value(dietplanner, watermelon_juice, description, "Refreshing watermelon juice for hydration.").
attribute_value(dietplanner, watermelon_juice, calories, 30).

% Subclass: water
water_instance(dietplanner, water, mineral_water).
attribute_value(dietplanner, mineral_water, name, "Mineral Water").
attribute_value(dietplanner, mineral_water, description, "Refreshing mineral water for hydration.").
attribute_value(dietplanner, mineral_water, calories, 0).

water_instance(dietplanner, water, sparkling_water).
attribute_value(dietplanner, sparkling_water, name, "Sparkling Water").
attribute_value(dietplanner, sparkling_water, description, "Bubbly sparkling water for a refreshing effervescence.").
attribute_value(dietplanner, sparkling_water, calories, 0).

water_instance(dietplanner, water, spring_water).
attribute_value(dietplanner, spring_water, name, "Spring Water").
attribute_value(dietplanner, spring_water, description, "Fresh and pure spring water sourced from natural springs.").
attribute_value(dietplanner, spring_water, calories, 0).

water_instance(dietplanner, water, lemon_mineral_water).
attribute_value(dietplanner, lemon_mineral_water, name, "Mineral Water with Lemon").
attribute_value(dietplanner, lemon_mineral_water, description, "Mineral water infused with zesty lemon flavor.").
attribute_value(dietplanner, lemon_mineral_water, calories, 2).

water_instance(dietplanner, water, coconut_water).
attribute_value(dietplanner, coconut_water, name, "Coconut Water").
attribute_value(dietplanner, coconut_water, description, "Natural and hydrating coconut water.").
attribute_value(dietplanner, coconut_water, calories, 19).

water_instance(dietplanner, water, cucumber_mint_infused_water).
attribute_value(dietplanner, cucumber_mint_infused_water, name, "Infused Water with Cucumber and Mint").
attribute_value(dietplanner, cucumber_mint_infused_water, description, "Refreshing infused water with cool cucumber and fresh mint.").
attribute_value(dietplanner, cucumber_mint_infused_water, calories, 0).

% ---------
% Class: nutrient
% ---------
% Subclass: alcoholic
alcoholic_instance(dietplanner, alcoholic, ethanol).
attribute_value(dietplanner, ethanol, name, "Ethanol").
attribute_value(dietplanner, ethanol, description, "The psychoactive ingredient in alcoholic beverages.").

% Subclass: amino_acidic
amino_acidic_instance(dietplanner, amino_acidic, tryptophan).
attribute_value(dietplanner, tryptophan, name, "Tryptophan").
attribute_value(dietplanner, tryptophan, description, "Essential amino acid important for mood regulation and serotonin production.").

amino_acidic_instance(dietplanner, amino_acidic, leucine).
attribute_value(dietplanner, leucine, name, "Leucine").
attribute_value(dietplanner, leucine, description, "Essential amino acid vital for muscle growth and repair.").

amino_acidic_instance(dietplanner, amino_acidic, valine).
attribute_value(dietplanner, valine, name, "Valine").
attribute_value(dietplanner, valine, description, "Essential amino acid involved in energy production and tissue repair.").

amino_acidic_instance(dietplanner, amino_acidic, methionine).
attribute_value(dietplanner, methionine, name, "Methionine").
attribute_value(dietplanner, methionine, description, "Essential amino acid important for metabolism and detoxification.").

amino_acidic_instance(dietplanner, amino_acidic, phenylalanine).
attribute_value(dietplanner, phenylalanine, name, "Phenylalanine").
attribute_value(dietplanner, phenylalanine, description, "Essential amino acid precursor to various neurotransmitters and hormones.").

% Subclass: dietary_fiber
dietary_fiber_instance(dietplanner, dietary_fiber, soluble_fiber).
attribute_value(dietplanner, soluble_fiber, name, "Soluble Fiber").
attribute_value(dietplanner, soluble_fiber, description, "Fiber that dissolves in water and forms a gel-like substance.").

dietary_fiber_instance(dietplanner, dietary_fiber, insoluble_fiber).
attribute_value(dietplanner, insoluble_fiber, name, "Insoluble Fiber").
attribute_value(dietplanner, insoluble_fiber, description, "Fiber that does not dissolve in water and promotes regular bowel movements.").

dietary_fiber_instance(dietplanner, dietary_fiber, pectin).
attribute_value(dietplanner, pectin, name, "Pectin").
attribute_value(dietplanner, pectin, description, "Soluble fiber found in fruits and used for making jams and jellies.").

dietary_fiber_instance(dietplanner, dietary_fiber, cellulose).
attribute_value(dietplanner, cellulose, name, "Cellulose").
attribute_value(dietplanner, cellulose, description, "Plant-based fiber that provides structure to plant cell walls.").

dietary_fiber_instance(dietplanner, dietary_fiber, oligosaccharides).
attribute_value(dietplanner, oligosaccharides, name, "Oligosaccharides").
attribute_value(dietplanner, oligosaccharides, description, "Short-chain carbohydrates with potential prebiotic effects.").

dietary_fiber_instance(dietplanner, dietary_fiber, resistant_starch).
attribute_value(dietplanner, resistant_starch, name, "Resistant Starch").
attribute_value(dietplanner, resistant_starch, description, "Starch that escapes digestion in the small intestine and provides benefits to the large intestine.").

% Subclass: carbs
carbs_instance(dietplanner, carbs, complex_carbohydrates).
attribute_value(dietplanner, complex_carbohydrates, name, "Complex Carbohydrates").
attribute_value(dietplanner, complex_carbohydrates, description, "Carbohydrates with longer chains of sugar molecules.").

carbs_instance(dietplanner, carbs, glucose).
attribute_value(dietplanner, glucose, name, "Glucose").
attribute_value(dietplanner, glucose, description, "Simple sugar and primary source of energy for the body.").

carbs_instance(dietplanner, carbs, fructose).
attribute_value(dietplanner, fructose, name, "Fructose").
attribute_value(dietplanner, fructose, description, "Naturally occurring sugar found in fruits and honey.").

carbs_instance(dietplanner, carbs, starch).
attribute_value(dietplanner, starch, name, "Starch").
attribute_value(dietplanner, starch, description, "Complex carbohydrate providing sustained energy.").

carbs_instance(dietplanner, carbs, lactose).
attribute_value(dietplanner, lactose, name, "Lactose").
attribute_value(dietplanner, lactose, description, "Sugar found in milk and dairy products.").

carbs_instance(dietplanner, carbs, galactose).
attribute_value(dietplanner, galactose, name, "Galactose").
attribute_value(dietplanner, galactose, description, "Simple sugar found in milk and as part of lactose.").

% Subclass: lipids
lipids_instance(dietplanner, lipids, saturated_fats).
attribute_value(dietplanner, saturated_fats, name, "Saturated Fats").
attribute_value(dietplanner, saturated_fats, description, "Fats with no double bonds between carbon molecules.").

lipids_instance(dietplanner, lipids, monounsaturated_fat).
attribute_value(dietplanner, monounsaturated_fat, name, "Monounsaturated Fat").
attribute_value(dietplanner, monounsaturated_fat, description, "Healthy fat with one double bond in its structure.").

lipids_instance(dietplanner, lipids, polyunsaturated_fat).
attribute_value(dietplanner, polyunsaturated_fat, name, "Polyunsaturated Fat").
attribute_value(dietplanner, polyunsaturated_fat, description, "Healthy fat with multiple double bonds in its structure.").

lipids_instance(dietplanner, lipids, trans_fat).
attribute_value(dietplanner, trans_fat, name, "Trans Fat").
attribute_value(dietplanner, trans_fat, description, "Unhealthy fat created through hydrogenation, found in some processed foods.").

lipids_instance(dietplanner, lipids, omega_3_fatty_acids).
attribute_value(dietplanner, omega_3_fatty_acids, name, "Omega-3 Fatty Acids").
attribute_value(dietplanner, omega_3_fatty_acids, description, "Essential fatty acids with anti-inflammatory benefits.").

% Subclass: minerals
minerals_instance(dietplanner, minerals, calcium).
attribute_value(dietplanner, calcium, name, "Calcium").
attribute_value(dietplanner, calcium, description, "Mineral important for bone health and muscle function.").

minerals_instance(dietplanner, minerals, iron).
attribute_value(dietplanner, iron, name, "Iron").
attribute_value(dietplanner, iron, description, "Critical mineral for oxygen transport and energy production.").

minerals_instance(dietplanner, minerals, potassium).
attribute_value(dietplanner, potassium, name, "Potassium").
attribute_value(dietplanner, potassium, description, "Electrolyte crucial for fluid balance and nerve function.").

minerals_instance(dietplanner, minerals, magnesium).
attribute_value(dietplanner, magnesium, name, "Magnesium").
attribute_value(dietplanner, magnesium, description, "Involved in hundreds of biochemical reactions in the body.").

minerals_instance(dietplanner, minerals, zinc).
attribute_value(dietplanner, zinc, name, "Zinc").
attribute_value(dietplanner, zinc, description, "Essential trace mineral supporting immune function and more.").

% Subclass: protein
protein_instance(dietplanner, protein, whey_protein).
attribute_value(dietplanner, whey_protein, name, "Whey Protein").
attribute_value(dietplanner, whey_protein, description, "High-quality protein derived from milk.").

protein_instance(dietplanner, protein, casein_protein).
attribute_value(dietplanner, casein_protein, name, "Casein Protein").
attribute_value(dietplanner, casein_protein, description, "Slow-digesting protein found in milk products and supplements.").

protein_instance(dietplanner, protein, soy_protein).
attribute_value(dietplanner, soy_protein, name, "Soy Protein").
attribute_value(dietplanner, soy_protein, description, "Plant-based protein derived from soybeans, suitable for vegetarians and vegans.").

protein_instance(dietplanner, protein, egg_white_protein).
attribute_value(dietplanner, egg_white_protein, name, "Egg White Protein").
attribute_value(dietplanner, egg_white_protein, description, "Protein sourced from egg whites, low in fat and carbohydrates.").

protein_instance(dietplanner, protein, pea_protein).
attribute_value(dietplanner, pea_protein, name, "Pea Protein").
attribute_value(dietplanner, pea_protein, description, "Plant-based protein extracted from yellow peas, suitable for various diets.").

% Subclass: vitamin
vitamin_instance(dietplanner, vitamin, vitamin_c).
attribute_value(dietplanner, vitamin_c, name, "Vitamin C").
attribute_value(dietplanner, vitamin_c, description, "An antioxidant vitamin that supports immune health.").

vitamin_instance(dietplanner, vitamin, vitamin_d).
attribute_value(dietplanner, vitamin_d, name, "Vitamin D").
attribute_value(dietplanner, vitamin_d, description, "Crucial vitamin for bone health and calcium absorption.").

vitamin_instance(dietplanner, vitamin, vitamin_a).
attribute_value(dietplanner, vitamin_a, name, "Vitamin A").
attribute_value(dietplanner, vitamin_a, description, "Essential for vision, immune function, and cell growth.").

vitamin_instance(dietplanner, vitamin, vitamin_k).
attribute_value(dietplanner, vitamin_k, name, "Vitamin K").
attribute_value(dietplanner, vitamin_k, description, "Vitamin necessary for blood clotting and bone health.").

vitamin_instance(dietplanner, vitamin, vitamin_e).
attribute_value(dietplanner, vitamin_e, name, "Vitamin E").
attribute_value(dietplanner, vitamin_e, description, "Antioxidant vitamin protecting cells from damage.").


% ---------
% Class: allergen
% ---------
allergen_instance(dietplanner, allergen, gluten).
attribute_value(dietplanner, gluten, name, "Gluten").
attribute_value(dietplanner, gluten, description, "A protein found in wheat, barley, and rye.").

allergen_instance(dietplanner, allergen, dairy).
attribute_value(dietplanner, dairy, name, "Dairy").
attribute_value(dietplanner, dairy, description, "Products containing milk or milk-derived ingredients.").

allergen_instance(dietplanner, allergen, peanuts).
attribute_value(dietplanner, peanuts, name, "Peanuts").
attribute_value(dietplanner, peanuts, description, "Tree nuts that can cause severe allergies.").

allergen_instance(dietplanner, allergen, soy).
attribute_value(dietplanner, soy, name, "Soy").
attribute_value(dietplanner, soy, description, "Products made from soybeans.").

allergen_instance(dietplanner, allergen, shellfish).
attribute_value(dietplanner, shellfish, name, "Shellfish").
attribute_value(dietplanner, shellfish, description, "Seafood like shrimp, crab, and lobster.").



% ---------
% Class: person
% ---------
person_instance(dietplanner, person, alice_johnson).
attribute_value(dietplanner, alice_johnson, name, "Alice").
attribute_value(dietplanner, alice_johnson, surname, "Johnson").
attribute_value(dietplanner, alice_johnson, age, 30).
attribute_value(dietplanner, alice_johnson, gender, "Female").
attribute_value(dietplanner, alice_johnson, height, 165).
attribute_value(dietplanner, alice_johnson, weight, 60.5).

person_instance(dietplanner, person, bob_smith).
attribute_value(dietplanner, bob_smith, name, "Bob").
attribute_value(dietplanner, bob_smith, surname, "Smith").
attribute_value(dietplanner, bob_smith, age, 28).
attribute_value(dietplanner, bob_smith, gender, "Male").
attribute_value(dietplanner, bob_smith, height, 180).
attribute_value(dietplanner, bob_smith, weight, 75.2).

person_instance(dietplanner, person, emma_davis).
attribute_value(dietplanner, emma_davis, name, "Emma").
attribute_value(dietplanner, emma_davis, surname, "Davis").
attribute_value(dietplanner, emma_davis, age, 22).
attribute_value(dietplanner, emma_davis, gender, "Female").
attribute_value(dietplanner, emma_davis, height, 158).
attribute_value(dietplanner, emma_davis, weight, 55.0).

person_instance(dietplanner, person, michael_brown).
attribute_value(dietplanner, michael_brown, name, "Michael").
attribute_value(dietplanner, michael_brown, surname, "Brown").
attribute_value(dietplanner, michael_brown, age, 35).
attribute_value(dietplanner, michael_brown, gender, "Male").
attribute_value(dietplanner, michael_brown, height, 175).
attribute_value(dietplanner, michael_brown, weight, 80.7).

person_instance(dietplanner, person, sophia_miller).
attribute_value(dietplanner, sophia_miller, name, "Sophia").
attribute_value(dietplanner, sophia_miller, surname, "Miller").
attribute_value(dietplanner, sophia_miller, age, 29).
attribute_value(dietplanner, sophia_miller, gender, "Female").
attribute_value(dietplanner, sophia_miller, height, 170).
attribute_value(dietplanner, sophia_miller, weight, 63.8).

% ---------
% Class: activity
% ---------
activity_instance(dietplanner, activity, running).
attribute_value(dietplanner, running, name, "Running").
attribute_value(dietplanner, running, description, "Go for a run to boost your cardiovascular health.").
attribute_value(dietplanner, running, calory_effort, 600).

activity_instance(dietplanner, activity, swimming).
attribute_value(dietplanner, swimming, name, "Swimming").
attribute_value(dietplanner, swimming, description, "Hit the pool for a full-body workout.").
attribute_value(dietplanner, swimming, calory_effort, 700).

activity_instance(dietplanner, activity, yoga).
attribute_value(dietplanner, yoga, name, "Yoga").
attribute_value(dietplanner, yoga, description, "Relax and stretch with a calming yoga session.").
attribute_value(dietplanner, yoga, calory_effort, 300).

activity_instance(dietplanner, activity, weightlifting).
attribute_value(dietplanner, weightlifting, name, "Weightlifting").
attribute_value(dietplanner, weightlifting, description, "Build strength and muscle with weightlifting.").
attribute_value(dietplanner, weightlifting, calory_effort, 400).

activity_instance(dietplanner, activity, cycling).
attribute_value(dietplanner, cycling, name, "Cycling").
attribute_value(dietplanner, cycling, description, "Take a bike ride for a fun and effective workout.").
attribute_value(dietplanner, cycling, calory_effort, 500).

% Subclass: sports
sports_instance(dietplanner, sports, soccer).
attribute_value(dietplanner, soccer, name, "Soccer").
attribute_value(dietplanner, soccer, description, "Play soccer for a team-based cardio workout.").
attribute_value(dietplanner, soccer, calory_effort, 800).

sports_instance(dietplanner, sports, basketball).
attribute_value(dietplanner, basketball, name, "Basketball").
attribute_value(dietplanner, basketball, description, "Shoot hoops and run on the court for fitness.").
attribute_value(dietplanner, basketball, calory_effort, 700).

sports_instance(dietplanner, sports, tennis).
attribute_value(dietplanner, tennis, name, "Tennis").
attribute_value(dietplanner, tennis, description, "Enjoy a game of tennis to improve agility.").
attribute_value(dietplanner, tennis, calory_effort, 600).

sports_instance(dietplanner, sports, volleyball).
attribute_value(dietplanner, volleyball, name, "Volleyball").
attribute_value(dietplanner, volleyball, description, "Bump, set, and spike in a game of volleyball.").
attribute_value(dietplanner, volleyball, calory_effort, 500).

sports_instance(dietplanner, sports, cycling_race).
attribute_value(dietplanner, cycling_race, name, "Cycling Race").
attribute_value(dietplanner, cycling_race, description, "Participate in a cycling race for a challenging workout.").
attribute_value(dietplanner, cycling_race, calory_effort, 1000).

% Subclass: inactivity
inactivity_instance(dietplanner, inactivity, sitting).
attribute_value(dietplanner, sitting, name, "Sitting").
attribute_value(dietplanner, sitting, description, "Sitting for extended periods can be detrimental to health.").
attribute_value(dietplanner, sitting, calory_effort, 100).

inactivity_instance(dietplanner, inactivity, tv_watching).
attribute_value(dietplanner, tv_watching, name, "TV Watching").
attribute_value(dietplanner, tv_watching, description, "Watching TV for hours can lead to a sedentary lifestyle.").
attribute_value(dietplanner, tv_watching, calory_effort, 50).

inactivity_instance(dietplanner, inactivity, desk_work).
attribute_value(dietplanner, desk_work, name, "Desk Work").
attribute_value(dietplanner, desk_work, description, "Sitting at a desk for work without breaks can impact well-being.").
attribute_value(dietplanner, desk_work, calory_effort, 70).

inactivity_instance(dietplanner, inactivity, reading).
attribute_value(dietplanner, reading, name, "Reading").
attribute_value(dietplanner, reading, description, "Reading for long periods can lead to reduced physical activity.").
attribute_value(dietplanner, reading, calory_effort, 60).

inactivity_instance(dietplanner, inactivity, computer_use).
attribute_value(dietplanner, computer_use, name, "Computer Use").
attribute_value(dietplanner, computer_use, description, "Using a computer for extended periods can contribute to inactivity.").
attribute_value(dietplanner, computer_use, calory_effort, 80).

% Subclass: walking
walking_instance(dietplanner, walking, brisk_walking).
attribute_value(dietplanner, brisk_walking, name, "Brisk Walking").
attribute_value(dietplanner, brisk_walking, description, "Take a brisk walk to improve cardiovascular health.").
attribute_value(dietplanner, brisk_walking, calory_effort, 300).

walking_instance(dietplanner, walking, nature_walk).
attribute_value(dietplanner, nature_walk, name, "Nature Walk").
attribute_value(dietplanner, nature_walk, description, "Enjoy a leisurely walk in nature for mental and physical well-being.").
attribute_value(dietplanner, nature_walk, calory_effort, 200).

walking_instance(dietplanner, walking, power_walking).
attribute_value(dietplanner, power_walking, name, "Power Walking").
attribute_value(dietplanner, power_walking, description, "Engage in power walking for an effective workout.").
attribute_value(dietplanner, power_walking, calory_effort, 400).

walking_instance(dietplanner, walking, evening_stroll).
attribute_value(dietplanner, evening_stroll, name, "Evening Stroll").
attribute_value(dietplanner, evening_stroll, description, "Take a relaxing evening stroll to unwind.").
attribute_value(dietplanner, evening_stroll, calory_effort, 150).

walking_instance(dietplanner, walking, urban_walking).
attribute_value(dietplanner, urban_walking, name, "Urban Walking").
attribute_value(dietplanner, urban_walking, description, "Explore the city on foot with urban walking.").
attribute_value(dietplanner, urban_walking, calory_effort, 250).

% ---------
% Class: meal
% ---------
% Instances of Dish
dish_instance(dietplanner, dish, grilled_chicken_salad).
attribute_value(dietplanner, grilled_chicken_salad, name, "Grilled Chicken Salad").
attribute_value(dietplanner, grilled_chicken_salad, description, "Healthy salad with grilled chicken, mixed greens, and veggies.").
attribute_value(dietplanner, grilled_chicken_salad, type, main_meal).

dish_instance(dietplanner, dish, hummus_and_veggie_platter).
attribute_value(dietplanner, hummus_and_veggie_platter, name, "Hummus and Veggie Platter").
attribute_value(dietplanner, hummus_and_veggie_platter, description, "Appetizer platter with hummus, carrot sticks, cucumber slices, and pita bread.").
attribute_value(dietplanner, hummus_and_veggie_platter, type, snak).

dish_instance(dietplanner, dish, spaghetti_bolognese).
attribute_value(dietplanner, spaghetti_bolognese, name, "Spaghetti Bolognese").
attribute_value(dietplanner, spaghetti_bolognese, description, "Classic Italian dish with spaghetti pasta and savory Bolognese sauce.").
attribute_value(dietplanner, spaghetti_bolognese, type, main_meal).

dish_instance(dietplanner, dish, fruit_salad).
attribute_value(dietplanner, fruit_salad, name, "Fruit Salad").
attribute_value(dietplanner, fruit_salad, description, "Refreshing salad with a mix of fresh seasonal fruits.").
attribute_value(dietplanner, fruit_salad, type, snak).

dish_instance(dietplanner, dish, grilled_salmon_with_quinoa).
attribute_value(dietplanner, grilled_salmon_with_quinoa, name, "Grilled Salmon with Quinoa").
attribute_value(dietplanner, grilled_salmon_with_quinoa, description, "Grilled salmon fillet served with quinoa and steamed vegetables.").
attribute_value(dietplanner, grilled_salmon_with_quinoa, type, main_meal).

dish_instance(dietplanner, dish, greek_yogurt_parfait).
attribute_value(dietplanner, greek_yogurt_parfait, name, "Greek Yogurt Parfait").
attribute_value(dietplanner, greek_yogurt_parfait, description, "Healthy dessert parfait with Greek yogurt, berries, and granola.").
attribute_value(dietplanner, greek_yogurt_parfait, type, snak).

dish_instance(dietplanner, dish, vegan_lentil_curry).
attribute_value(dietplanner, vegan_lentil_curry, name, "Vegan Lentil Curry").
attribute_value(dietplanner, vegan_lentil_curry, description, "Flavorful curry made with lentils, vegetables, and aromatic spices.").
attribute_value(dietplanner, vegan_lentil_curry, type, main_meal).

dish_instance(dietplanner, dish, trail_mix).
attribute_value(dietplanner, trail_mix, name, "Trail Mix").
attribute_value(dietplanner, trail_mix, description, "Energy-boosting snack mix with nuts, dried fruits, and seeds.").
attribute_value(dietplanner, trail_mix, type, snak).

dish_instance(dietplanner, dish, caesar_salad).
attribute_value(dietplanner, caesar_salad, name, "Caesar Salad").
attribute_value(dietplanner, caesar_salad, description, "Classic salad with Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.").
attribute_value(dietplanner, caesar_salad, type, main_meal).

dish_instance(dietplanner, dish, veggie_spring_rolls).
attribute_value(dietplanner, veggie_spring_rolls, name, "Veggie Spring Rolls").
attribute_value(dietplanner, veggie_spring_rolls, description, "Light and crunchy spring rolls filled with fresh vegetables.").
attribute_value(dietplanner, veggie_spring_rolls, type, snak).

dish_instance(dietplanner, dish, grilled_steak_with_roasted_potatoes).
attribute_value(dietplanner, grilled_steak_with_roasted_potatoes, name, "Grilled Steak with Roasted Potatoes").
attribute_value(dietplanner, grilled_steak_with_roasted_potatoes, description, "Juicy grilled steak served with roasted potatoes and a side salad.").
attribute_value(dietplanner, grilled_steak_with_roasted_potatoes, type, main_meal).

dish_instance(dietplanner, dish, smoothie_bowl).
attribute_value(dietplanner, smoothie_bowl, name, "Smoothie Bowl").
attribute_value(dietplanner, smoothie_bowl, description, "Thick and creamy smoothie bowl topped with fresh fruits, nuts, and seeds.").
attribute_value(dietplanner, smoothie_bowl, type, snak).

dish_instance(dietplanner, dish, mushroom_risotto).
attribute_value(dietplanner, mushroom_risotto, name, "Mushroom Risotto").
attribute_value(dietplanner, mushroom_risotto, description, "Creamy risotto made with Arborio rice and sautéed mushrooms.").
attribute_value(dietplanner, mushroom_risotto, type, main_meal).

dish_instance(dietplanner, dish, popcorn).
attribute_value(dietplanner, popcorn, name, "Popcorn").
attribute_value(dietplanner, popcorn, description, "Light and crunchy popcorn, a great movie-time snack.").
attribute_value(dietplanner, popcorn, type, snak).

dish_instance(dietplanner, dish, chicken_stir_fry).
attribute_value(dietplanner, chicken_stir_fry, name, "Chicken Stir-Fry").
attribute_value(dietplanner, chicken_stir_fry, description, "Quick and healthy chicken stir-fry with colorful vegetables.").
attribute_value(dietplanner, chicken_stir_fry, type, main_meal).


% ---------
% Relationships
% ---------
has_nutrient(dietplanner, red_wine, ethanol).
has_nutrient(dietplanner, red_wine, resveratrol).
has_nutrient(dietplanner, red_wine, antioxidants).
has_nutrient(dietplanner, chicken_breast, protein).
has_nutrient(dietplanner, chicken_breast, vitamin_b6).
has_nutrient(dietplanner, chicken_breast, phosphorus).
has_nutrient(dietplanner, spinach, iron).
has_nutrient(dietplanner, spinach, vitamin_k).
has_nutrient(dietplanner, spinach, vitamin_a).
has_nutrient(dietplanner, oatmeal, complex_carbohydrates).
has_nutrient(dietplanner, oatmeal, dietary_fiber).
has_nutrient(dietplanner, oatmeal, manganese).
has_nutrient(dietplanner, salmon, omega_3_fatty_acids).
has_nutrient(dietplanner, salmon, vitamin_d).
has_nutrient(dietplanner, salmon, vitamin_b12).
has_nutrient(dietplanner, almonds, monounsaturated_fat).
has_nutrient(dietplanner, almonds, vitamin_e).
has_nutrient(dietplanner, almonds, magnesium).
has_nutrient(dietplanner, greek_yogurt, protein).
has_nutrient(dietplanner, greek_yogurt, calcium).
has_nutrient(dietplanner, greek_yogurt, probiotics).
has_nutrient(dietplanner, blueberries, antioxidants).
has_nutrient(dietplanner, blueberries, vitamin_c).
has_nutrient(dietplanner, blueberries, dietary_fiber).

part_of(dietplanner, ethanol, red_wine).
part_of(dietplanner, resveratrol, red_wine).
part_of(dietplanner, antioxidants, red_wine).
part_of(dietplanner, protein, chicken_breast).
part_of(dietplanner, vitamin_b6, chicken_breast).
part_of(dietplanner, phosphorus, chicken_breast).
part_of(dietplanner, iron, spinach).
part_of(dietplanner, vitamin_k, spinach).
part_of(dietplanner, vitamin_a, spinach).
part_of(dietplanner, complex_carbohydrates, oatmeal).
part_of(dietplanner, dietary_fiber, oatmeal).
part_of(dietplanner, manganese, oatmeal).
part_of(dietplanner, omega_3_fatty_acids, salmon).
part_of(dietplanner, vitamin_d, salmon).
part_of(dietplanner, vitamin_b12, salmon).
part_of(dietplanner, monounsaturated_fat, almonds).
part_of(dietplanner, vitamin_e, almonds).
part_of(dietplanner, magnesium, almonds).
part_of(dietplanner, protein, greek_yogurt).
part_of(dietplanner, calcium, greek_yogurt).
part_of(dietplanner, probiotics, greek_yogurt).
part_of(dietplanner, antioxidants, blueberries).
part_of(dietplanner, vitamin_c, blueberries).
part_of(dietplanner, dietary_fiber, blueberries).

carry_out(alice_johnson, running-1).
carry_out(bob_smith, swimming-2).
carry_out(emma_davis, yoga-1.5).
carry_out(michael_brown, weightlifting-1.5).
carry_out(sophia_miller, cycling-2.5).
carry_out(alice_johnson, yoga-1).
carry_out(alice_johnson, swimming-1.5).
carry_out(bob_smith, running-1).
carry_out(bob_smith, weightlifting-2).
carry_out(emma_davis, brisk_walking-1).
carry_out(emma_davis, swimming-1).
carry_out(michael_brown, soccer-2).
carry_out(michael_brown, basketball-1.5).
carry_out(sophia_miller, cycling_race-3).
carry_out(sophia_miller, nature_walk-1).

is_allergic(alice_johnson, dairy).
is_allergic(bob_smith, peanuts).
is_allergic(emma_davis, soy).
is_allergic(michael_brown, shellfish).
is_allergic(sophia_miller, gluten).
is_allergic(alice_johnson, shellfish).
is_allergic(bob_smith, dairy).
is_allergic(emma_davis, gluten).
is_allergic(michael_brown, peanuts).
is_allergic(sophia_miller, soy).

is_contained(dietplanner, nuts, almond_milk_latte).
is_contained(dietplanner, nuts, peanut_butter).
is_contained(dietplanner, shellfish, shrimp_salad).
is_contained(dietplanner, shellfish, crab_cakes).
is_contained(dietplanner, gluten, wheat_bread).
is_contained(dietplanner, gluten, pasta).
is_contained(dietplanner, eggs, egg_salad).
is_contained(dietplanner, eggs, omelette).
is_contained(dietplanner, dairy, milkshake).
is_contained(dietplanner, dairy, cheese_pizza).
is_contained(dietplanner, soy, soy_sauce).
is_contained(dietplanner, soy, tofu_stir_fry).
is_contained(dietplanner, dairy, strawberry_yogurt).
is_contained(dietplanner, nuts, walnut_salad).
is_contained(dietplanner, shellfish, lobster_bisque).

made_of(dietplanner, spaghetti_bolognese, pasta).
made_of(dietplanner, pasta_primavera, pasta).
made_of(dietplanner, caprese_salad, tomatoes).
made_of(dietplanner, tomato_soup, tomatoes).
made_of(dietplanner, chicken_caesar_salad, chicken).
made_of(dietplanner, grilled_chicken_burger, chicken).
made_of(dietplanner, fruit_salad, fruits).
made_of(dietplanner, mixed_berry_smoothie, fruits).
made_of(dietplanner, chocolate_mousse, chocolate).
made_of(dietplanner, chocolate_chip_cookies, chocolate).
made_of(dietplanner, veggie_pizza, vegetables).
made_of(dietplanner, garden_salad, vegetables).
made_of(dietplanner, tuna_sandwich, tuna).
made_of(dietplanner, sushi_roll, tuna).
made_of(dietplanner, beef_stew, beef).
made_of(dietplanner, beef_tacos, beef).

%Bisogna aggiungere le istanze per le nuove relazioni

% ---------------------------------------------------------------------------------------------------------------------------------------
% FUNCTIONS
% ---------------------------------------------------------------------------------------------------------------------------------------
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
