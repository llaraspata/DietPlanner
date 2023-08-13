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
fact(1000, instance(dietplanner, cereal), 1).
fact(1001, has(dietplanner, cereal, name, "Oatmeal"), 1).
fact(1002, has(dietplanner, cereal, description, "Whole grain oatmeal, a nutritious breakfast option."), 1).
fact(1003, has(dietplanner, cereal, calories, "71"), 1).

fact(1004, instance(dietplanner, cereal), 1).
fact(1005, has(dietplanner, cereal, name, "Corn Flakes"), 1).
fact(1006, has(dietplanner, cereal, description, "Crispy and light cereal made from corn."), 1).
fact(1007, has(dietplanner, cereal, calories, "101"), 1).

fact(1008, instance(dietplanner, cereal), 1).
fact(1009, has(dietplanner, cereal, name, "Rice Krispies"), 1).
fact(1010, has(dietplanner, cereal, description, "Crispy rice cereal that is often used in treats."), 1).
fact(1011, has(dietplanner, cereal, calories, "130"), 1).

fact(1012, instance(dietplanner, cereal), 1).
fact(1013, has(dietplanner, cereal, name, "Whole Wheat Cereal"), 1).
fact(1014, has(dietplanner, cereal, description, "Cereal made from whole wheat grains."), 1).
fact(1015, has(dietplanner, cereal, calories, "120"), 1).

fact(1016, instance(dietplanner, cereal), 1).
fact(1017, has(dietplanner, cereal, name, "Granola"), 1).
fact(1018, has(dietplanner, cereal, description, "Cereal made from rolled oats, nuts, and sweeteners."), 1).
fact(1019, has(dietplanner, cereal, calories, "400"), 1).

% Subclass: eggs
fact(570, instance(dietplanner, eggs), 1).
fact(571, has(dietplanner, eggs, name, "Scrambled Eggs"), 1).
fact(572, has(dietplanner, eggs, description, "Fluffy scrambled eggs cooked to perfection."), 1).
fact(573, has(dietplanner, eggs, calories, 154), 1).

fact(1020, instance(dietplanner, eggs), 1).
fact(1021, has(dietplanner, eggs, name, "Chicken Eggs"), 1).
fact(1022, has(dietplanner, eggs, description, "Fresh eggs from chickens, a versatile source of protein."), 1).
fact(1023, has(dietplanner, eggs, calories, "68"), 1).

fact(1024, instance(dietplanner, eggs), 1).
fact(1025, has(dietplanner, eggs, name, "Quail Eggs"), 1).
fact(1026, has(dietplanner, eggs, description, "Small eggs from quail, often used in culinary dishes."), 1).
fact(1027, has(dietplanner, eggs, calories, "14"), 1).

fact(1028, instance(dietplanner, eggs), 1).
fact(1029, has(dietplanner, eggs, name, "Duck Eggs"), 1).
fact(1030, has(dietplanner, eggs, description, "Larger eggs from ducks, similar to chicken eggs."), 1).
fact(1031, has(dietplanner, eggs, calories, "130"), 1).

fact(1032, instance(dietplanner, eggs), 1).
fact(1033, has(dietplanner, eggs, name, "Goose Eggs"), 1).
fact(1034, has(dietplanner, eggs, description, "Even larger eggs from geese, less commonly consumed."), 1).
fact(1035, has(dietplanner, eggs, calories, "185"), 1).

fact(1036, instance(dietplanner, eggs), 1).
fact(1037, has(dietplanner, eggs, name, "Egg Whites"), 1).
fact(1038, has(dietplanner, eggs, description, "The protein-rich portion of the egg, often used separately."), 1).
fact(1039, has(dietplanner, eggs, calories, "16"), 1).

% Subclass: oils
fact(574, instance(dietplanner, oils), 1).
fact(575, has(dietplanner, oils, name, "Olive Oil"), 1).
fact(576, has(dietplanner, oils, description, "Extra virgin olive oil for cooking and dressing."), 1).
fact(577, has(dietplanner, oils, calories, 884), 1).

fact(1054, instance(dietplanner, oils), 1).
fact(1055, has(dietplanner, oils, name, "Coconut Oil"), 1).
fact(1056, has(dietplanner, oils, description, "Oil derived from coconuts, used in cooking and skincare."), 1).
fact(1057, has(dietplanner, oils, calories, "862"), 1).

fact(1058, instance(dietplanner, oils), 1).
fact(1059, has(dietplanner, oils, name, "Avocado Oil"), 1).
fact(1060, has(dietplanner, oils, description, "Oil made from avocados, known for its rich, buttery flavor."), 1).
fact(1061, has(dietplanner, oils, calories, "124"), 1).

fact(1062, instance(dietplanner, oils), 1).
fact(1063, has(dietplanner, oils, name, "Canola Oil"), 1).
fact(1064, has(dietplanner, oils, description, "Neutral-flavored oil often used for cooking and frying."), 1).
fact(1065, has(dietplanner, oils, calories, "884"), 1).

fact(1066, instance(dietplanner, oils), 1).
fact(1067, has(dietplanner, oils, name, "Sesame Oil"), 1).
fact(1068, has(dietplanner, oils, description, "Flavorful oil made from sesame seeds, common in Asian cuisines."), 1).
fact(1069, has(dietplanner, oils, calories, "884"), 1).

% Subclass: fish_seafood
fact(578, instance(dietplanner, fish_seafood), 1).
fact(579, has(dietplanner, fish_seafood, name, "Grilled Salmon"), 1).
fact(580, has(dietplanner, fish_seafood, description, "Healthy grilled salmon rich in omega-3 fatty acids."), 1).
fact(581, has(dietplanner, fish_seafood, calories, 206), 1).

fact(1104, instance(dietplanner, fish_seafood), 1).
fact(1105, has(dietplanner, fish_seafood, name, "Shrimp"), 1).
fact(1106, has(dietplanner, fish_seafood, description, "Popular shellfish with a delicate taste, often used in various dishes."), 1).
fact(1107, has(dietplanner, fish_seafood, calories, "85"), 1).

fact(1108, instance(dietplanner, fish_seafood), 1).
fact(1109, has(dietplanner, fish_seafood, name, "Tuna"), 1).
fact(1110, has(dietplanner, fish_seafood, description, "Versatile fish often used in salads, sandwiches, and sushi."), 1).
fact(1111, has(dietplanner, fish_seafood, calories, "144"), 1).

fact(1112, instance(dietplanner, fish_seafood), 1).
fact(1113, has(dietplanner, fish_seafood, name, "Cod"), 1).
fact(1114, has(dietplanner, fish_seafood, description, "Mild-flavored fish commonly used in dishes like fish and chips."), 1).
fact(1115, has(dietplanner, fish_seafood, calories, "82"), 1).

fact(1116, instance(dietplanner, fish_seafood), 1).
fact(1117, has(dietplanner, fish_seafood, name, "Crab"), 1).
fact(1118, has(dietplanner, fish_seafood, description, "Delicate-flavored shellfish enjoyed in various culinary styles."), 1).
fact(1119, has(dietplanner, fish_seafood, calories, "83"), 1).

% Subclass: fruits_olives
fact(582, instance(dietplanner, fruits_olives), 1).
fact(583, has(dietplanner, fruits_olives, name, "Apple"), 1).
fact(584, has(dietplanner, fruits_olives, description, "Fresh and crisp apple for a refreshing snack."), 1).
fact(585, has(dietplanner, fruits_olives, calories, 52), 1).

fact(1154, instance(dietplanner, fruits_olives), 1).
fact(1155, has(dietplanner, fruits_olives, name, "Banana"), 1).
fact(1156, has(dietplanner, fruits_olives, description, "Tropical fruit with a sweet taste and rich in potassium."), 1).
fact(1157, has(dietplanner, fruits_olives, calories, "96"), 1).

fact(1158, instance(dietplanner, fruits_olives), 1).
fact(1159, has(dietplanner, fruits_olives, name, "Grapes"), 1).
fact(1160, has(dietplanner, fruits_olives, description, "Small and sweet berries often eaten fresh or used in products like wine."), 1).
fact(1161, has(dietplanner, fruits_olives, calories, "69"), 1).

fact(1162, instance(dietplanner, fruits_olives), 1).
fact(1163, has(dietplanner, fruits_olives, name, "Olive"), 1).
fact(1164, has(dietplanner, fruits_olives, description, "Small fruit rich in healthy fats, often used to make olive oil."), 1).
fact(1165, has(dietplanner, fruits_olives, calories, "115"), 1).

fact(1166, instance(dietplanner, fruits_olives), 1).
fact(1167, has(dietplanner, fruits_olives, name, "Orange"), 1).
fact(1168, has(dietplanner, fruits_olives, description, "Citrus fruit known for its vitamin C content and refreshing flavor."), 1).
fact(1169, has(dietplanner, fruits_olives, calories, "43"), 1).

% Subclass: meats
fact(586, instance(dietplanner, meats), 1).
fact(587, has(dietplanner, meats, name, "Grilled Chicken Breast"), 1).
fact(588, has(dietplanner, meats, description, "Lean grilled chicken breast for protein intake."), 1).
fact(589, has(dietplanner, meats, calories, 165), 1).

fact(1204, instance(dietplanner, meats), 1).
fact(1205, has(dietplanner, meats, name, "Beef Steak"), 1).
fact(1206, has(dietplanner, meats, description, "Tender cut of beef, often grilled or pan-seared."), 1).
fact(1207, has(dietplanner, meats, calories, "250"), 1).

fact(1208, instance(dietplanner, meats), 1).
fact(1209, has(dietplanner, meats, name, "Pork Chop"), 1).
fact(1210, has(dietplanner, meats, description, "Succulent cut of pork, cooked in various ways."), 1).
fact(1211, has(dietplanner, meats, calories, "180"), 1).

fact(1212, instance(dietplanner, meats), 1).
fact(1213, has(dietplanner, meats, name, "Lamb Shank"), 1).
fact(1214, has(dietplanner, meats, description, "Flavorful cut of lamb, often slow-cooked for tenderness."), 1).
fact(1215, has(dietplanner, meats, calories, "260"), 1).

fact(1216, instance(dietplanner, meats), 1).
fact(1217, has(dietplanner, meats, name, "Turkey Breast"), 1).
fact(1218, has(dietplanner, meats, description, "Lean meat from turkey, a popular option for sandwiches."), 1).
fact(1219, has(dietplanner, meats, calories, "135"), 1).

% Subclass: milk
fact(590, instance(dietplanner, milk), 1).
fact(591, has(dietplanner, milk, name, "Skim Milk"), 1).
fact(592, has(dietplanner, milk, description, "Low-fat skim milk for a calcium boost."), 1).
fact(593, has(dietplanner, milk, calories, 34), 1).

fact(1250, instance(dietplanner, milk), 1).
fact(1251, has(dietplanner, milk, name, "Whole Milk"), 1).
fact(1252, has(dietplanner, milk, description, "Dairy milk with full-fat content, often used for drinking and cooking."), 1).
fact(1253, has(dietplanner, milk, calories, "61"), 1).

fact(1254, instance(dietplanner, milk), 1).
fact(1255, has(dietplanner, milk, name, "Skim Milk"), 1).
fact(1256, has(dietplanner, milk, description, "Dairy milk with reduced fat content, commonly used as a lighter option."), 1).
fact(1257, has(dietplanner, milk, calories, "34"), 1).

fact(1258, instance(dietplanner, milk), 1).
fact(1259, has(dietplanner, milk, name, "Soy Milk"), 1).
fact(1260, has(dietplanner, milk, description, "Plant-based milk made from soybeans, suitable for vegans and lactose-intolerant individuals."), 1).
fact(1261, has(dietplanner, milk, calories, "33"), 1).

fact(1262, instance(dietplanner, milk), 1).
fact(1263, has(dietplanner, milk, name, "Almond Milk"), 1).
fact(1264, has(dietplanner, milk, description, "Nut milk made from almonds, often used as a dairy-free alternative."), 1).
fact(1265, has(dietplanner, milk, calories, "13"), 1).

fact(1266, instance(dietplanner, milk), 1).
fact(1267, has(dietplanner, milk, name, "Coconut Milk"), 1).
fact(1268, has(dietplanner, milk, description, "Creamy milk derived from coconuts, used in cooking and beverages."), 1).
fact(1269, has(dietplanner, milk, calories, "230"), 1).

% Subclass: mushrooms
fact(1300, instance(dietplanner, mushrooms), 1).
fact(1301, has(dietplanner, mushrooms, name, "Button Mushroom"), 1).
fact(1302, has(dietplanner, mushrooms, description, "Common edible mushroom with a mild flavor, versatile in cooking."), 1).
fact(1303, has(dietplanner, mushrooms, calories, "22"), 1).

fact(1304, instance(dietplanner, mushrooms), 1).
fact(1305, has(dietplanner, mushrooms, name, "Portobello Mushroom"), 1).
fact(1306, has(dietplanner, mushrooms, description, "Large and meaty mushroom, often used as a meat substitute."), 1).
fact(1307, has(dietplanner, mushrooms, calories, "22"), 1).

fact(1308, instance(dietplanner, mushrooms), 1).
fact(1309, has(dietplanner, mushrooms, name, "Shiitake Mushroom"), 1).
fact(1310, has(dietplanner, mushrooms, description, "Flavorful and aromatic mushroom commonly used in Asian cuisine."), 1).
fact(1311, has(dietplanner, mushrooms, calories, "34"), 1).

fact(1312, instance(dietplanner, mushrooms), 1).
fact(1313, has(dietplanner, mushrooms, name, "Oyster Mushroom"), 1).
fact(1314, has(dietplanner, mushrooms, description, "Delicate and tender mushroom with a mild flavor and oyster-like appearance."), 1).
fact(1315, has(dietplanner, mushrooms, calories, "33"), 1).

fact(1316, instance(dietplanner, mushrooms), 1).
fact(1317, has(dietplanner, mushrooms, name, "Chanterelle Mushroom"), 1).
fact(1318, has(dietplanner, mushrooms, description, "Wild mushroom with a fruity aroma and delicate taste."), 1).
fact(1319, has(dietplanner, mushrooms, calories, "38"), 1).

% Subclass: nuts
fact(598, instance(dietplanner, nuts), 1).
fact(599, has(dietplanner, nuts, name, "Almonds"), 1).
fact(600, has(dietplanner, nuts, description, "Crunchy almonds packed with healthy fats."), 1).
fact(601, has(dietplanner, nuts, calories, 579), 1).

fact(1354, instance(dietplanner, nuts), 1).
fact(1355, has(dietplanner, nuts, name, "Walnuts"), 1).
fact(1356, has(dietplanner, nuts, description, "Heart-healthy nuts with a distinctive shape and earthy flavor."), 1).
fact(1357, has(dietplanner, nuts, calories, "654"), 1).

fact(1358, instance(dietplanner, nuts), 1).
fact(1359, has(dietplanner, nuts, name, "Cashews"), 1).
fact(1360, has(dietplanner, nuts, description, "Creamy and mildly sweet nuts often used in both sweet and savory dishes."), 1).
fact(1361, has(dietplanner, nuts, calories, "553"), 1).

fact(1362, instance(dietplanner, nuts), 1).
fact(1363, has(dietplanner, nuts, name, "Pistachios"), 1).
fact(1364, has(dietplanner, nuts, description, "Small and colorful nuts with a unique flavor and natural shell."), 1).
fact(1365, has(dietplanner, nuts, calories, "562"), 1).

fact(1366, instance(dietplanner, nuts), 1).
fact(1367, has(dietplanner, nuts, name, "Pecans"), 1).
fact(1368, has(dietplanner, nuts, description, "Buttery and rich nuts often used in pies and baked goods."), 1).
fact(1369, has(dietplanner, nuts, calories, "691"), 1).

% Subclass: seeds
fact(602, instance(dietplanner, seeds), 1).
fact(603, has(dietplanner, seeds, name, "Chia Seeds"), 1).
fact(604, has(dietplanner, seeds, description, "Nutrient-rich chia seeds for added health benefits."), 1).
fact(605, has(dietplanner, seeds, calories, 486), 1).

fact(1404, instance(dietplanner, seeds), 1).
fact(1405, has(dietplanner, seeds, name, "Flaxseeds"), 1).
fact(1406, has(dietplanner, seeds, description, "Nutrient-packed seeds known for their high fiber and omega-3 content."), 1).
fact(1407, has(dietplanner, seeds, calories, "534"), 1).

fact(1408, instance(dietplanner, seeds), 1).
fact(1409, has(dietplanner, seeds, name, "Sunflower Seeds"), 1).
fact(1410, has(dietplanner, seeds, description, "Edible seeds from sunflower plants, often enjoyed as a snack."), 1).
fact(1411, has(dietplanner, seeds, calories, "584"), 1).

fact(1412, instance(dietplanner, seeds), 1).
fact(1413, has(dietplanner, seeds, name, "Pumpkin Seeds"), 1).
fact(1414, has(dietplanner, seeds, description, "Nutrient-rich seeds harvested from pumpkins, commonly roasted and consumed."), 1).
fact(1415, has(dietplanner, seeds, calories, "559"), 1).

fact(1416, instance(dietplanner, seeds), 1).
fact(1417, has(dietplanner, seeds, name, "Sesame Seeds"), 1).
fact(1418, has(dietplanner, seeds, description, "Tiny seeds with a nutty flavor, used as a topping and ingredient in various cuisines."), 1).
fact(1419, has(dietplanner, seeds, calories, "573"), 1).

% Subclass: salts
fact(606, instance(dietplanner, salts), 1).
fact(607, has(dietplanner, salts, name, "Sea Salt"), 1).
fact(608, has(dietplanner, salts, description, "Natural sea salt to enhance the flavor of dishes."), 1).
fact(609, has(dietplanner, salts, calories, 0), 1).

fact(1454, instance(dietplanner, salts), 1).
fact(1455, has(dietplanner, salts, name, "Himalayan Pink Salt"), 1).
fact(1456, has(dietplanner, salts, description, "Pink-colored salt mined from the Himalayan mountains, known for its trace minerals."), 1).
fact(1457, has(dietplanner, salts, calories, "0"), 1).

fact(1458, instance(dietplanner, salts), 1).
fact(1459, has(dietplanner, salts, name, "Kosher Salt"), 1).
fact(1460, has(dietplanner, salts, description, "Coarse-grained salt used in koshering meat and general cooking."), 1).
fact(1461, has(dietplanner, salts, calories, "0"), 1).

fact(1462, instance(dietplanner, salts), 1).
fact(1463, has(dietplanner, salts, name, "Table Salt"), 1).
fact(1464, has(dietplanner, salts, description, "Commonly used fine-grained salt, often fortified with iodine."), 1).
fact(1465, has(dietplanner, salts, calories, "0"), 1).

fact(1466, instance(dietplanner, salts), 1).
fact(1467, has(dietplanner, salts, name, "Black Salt"), 1).
fact(1468, has(dietplanner, salts, description, "Condiment salt with a distinctive sulfurous flavor, used in Indian cuisine."), 1).
fact(1469, has(dietplanner, salts, calories, "0"), 1).

% Subclass: spices
fact(610, instance(dietplanner, spices), 1).
fact(611, has(dietplanner, spices, name, "Cinnamon"), 1).
fact(612, has(dietplanner, spices, description, "Warm and aromatic cinnamon spice."), 1).
fact(613, has(dietplanner, spices, calories, 247), 1).

fact(1504, instance(dietplanner, spices), 1).
fact(1505, has(dietplanner, spices, name, "Turmeric"), 1).
fact(1506, has(dietplanner, spices, description, "Bright yellow spice with anti-inflammatory properties, commonly used in curries."), 1).
fact(1507, has(dietplanner, spices, calories, "354"), 1).

fact(1508, instance(dietplanner, spices), 1).
fact(1509, has(dietplanner, spices, name, "Paprika"), 1).
fact(1510, has(dietplanner, spices, description, "Ground red pepper spice with varying levels of heat and sweetness."), 1).
fact(1511, has(dietplanner, spices, calories, "282"), 1).

fact(1512, instance(dietplanner, spices), 1).
fact(1513, has(dietplanner, spices, name, "Cumin"), 1).
fact(1514, has(dietplanner, spices, description, "Aromatic spice with earthy and nutty flavor, commonly used in Middle Eastern and Indian cuisines."), 1).
fact(1515, has(dietplanner, spices, calories, "375"), 1).

fact(1516, instance(dietplanner, spices), 1).
fact(1517, has(dietplanner, spices, name, "Black Pepper"), 1).
fact(1518, has(dietplanner, spices, description, "Commonly used spice with a pungent and peppery flavor."), 1).
fact(1519, has(dietplanner, spices, calories, "251"), 1).

% Subclass: sweets
fact(614, instance(dietplanner, sweets), 1).
fact(615, has(dietplanner, sweets, name, "Dark Chocolate"), 1).
fact(616, has(dietplanner, sweets, description, "Rich and indulgent dark chocolate."), 1).
fact(617, has(dietplanner, sweets, calories, 546), 1).

fact(1554, instance(dietplanner, sweets), 1).
fact(1555, has(dietplanner, sweets, name, "Gummy Bears"), 1).
fact(1556, has(dietplanner, sweets, description, "Chewy and colorful gelatin-based candy in the shape of bears."), 1).
fact(1557, has(dietplanner, sweets, calories, "325"), 1).

fact(1558, instance(dietplanner, sweets), 1).
fact(1559, has(dietplanner, sweets, name, "Cotton Candy"), 1).
fact(1560, has(dietplanner, sweets, description, "Light and fluffy spun sugar treat, often found at fairs and events."), 1).
fact(1561, has(dietplanner, sweets, calories, "398"), 1).

fact(1562, instance(dietplanner, sweets), 1).
fact(1563, has(dietplanner, sweets, name, "Ice Cream"), 1).
fact(1564, has(dietplanner, sweets, description, "Frozen dessert made from dairy or non-dairy ingredients, available in numerous flavors."), 1).
fact(1565, has(dietplanner, sweets, calories, "207"), 1).

fact(1566, instance(dietplanner, sweets), 1).
fact(1567, has(dietplanner, sweets, name, "Donut"), 1).
fact(1568, has(dietplanner, sweets, description, "Deep-fried sweet pastry often coated with icing or powdered sugar."), 1).
fact(1569, has(dietplanner, sweets, calories, "452"), 1).

% Subclass: beverage
% Subclass: alcoholic_beverages
fact(620, instance(dietplanner, alcoholic_beverages), 1).
fact(621, has(dietplanner, alcoholic_beverages, name, "Red Wine"), 1).
fact(622, has(dietplanner, alcoholic_beverages, description, "Classic red wine for a delightful evening."), 1).
fact(623, has(dietplanner, alcoholic_beverages, calories, 85), 1).

fact(720, instance(dietplanner, alcoholic_beverages), 1).
fact(721, has(dietplanner, alcoholic_beverages, name, "Beer"), 1).
fact(722, has(dietplanner, alcoholic_beverages, description, "Classic beer for a casual drink."), 1).
fact(723, has(dietplanner, alcoholic_beverages, calories, 43), 1).

fact(724, instance(dietplanner, alcoholic_beverages), 1).
fact(725, has(dietplanner, alcoholic_beverages, name, "Vodka"), 1).
fact(726, has(dietplanner, alcoholic_beverages, description, "Clear and versatile vodka for mixing or sipping."), 1).
fact(727, has(dietplanner, alcoholic_beverages, calories, 96), 1).

fact(728, instance(dietplanner, alcoholic_beverages), 1).
fact(729, has(dietplanner, alcoholic_beverages, name, "Rum"), 1).
fact(730, has(dietplanner, alcoholic_beverages, description, "Smooth and flavorful rum for cocktails."), 1).
fact(731, has(dietplanner, alcoholic_beverages, calories, 231), 1).

fact(732, instance(dietplanner, alcoholic_beverages), 1).
fact(733, has(dietplanner, alcoholic_beverages, name, "Gin"), 1).
fact(734, has(dietplanner, alcoholic_beverages, description, "Juniper-infused gin for classic cocktails."), 1).
fact(735, has(dietplanner, alcoholic_beverages, calories, 263), 1).

fact(736, instance(dietplanner, alcoholic_beverages), 1).
fact(737, has(dietplanner, alcoholic_beverages, name, "Tequila"), 1).
fact(738, has(dietplanner, alcoholic_beverages, description, "Agave-based tequila for margaritas and more."), 1).
fact(739, has(dietplanner, alcoholic_beverages, calories, 96), 1).

% Subclass: coffee_energydrinks
fact(624, instance(dietplanner, coffee_energydrinks), 1).
fact(625, has(dietplanner, coffee_energydrinks, name, "Espresso"), 1).
fact(626, has(dietplanner, coffee_energydrinks, description, "Strong and invigorating espresso shot."), 1).
fact(627, has(dietplanner, coffee_energydrinks, calories, 2), 1).

fact(700, instance(dietplanner, coffee_energydrinks), 1).
fact(701, has(dietplanner, coffee_energydrinks, name, "Cold Brew Coffee"), 1).
fact(702, has(dietplanner, coffee_energydrinks, description, "Smooth and cold brewed coffee for a refreshing kick."), 1).
fact(703, has(dietplanner, coffee_energydrinks, calories, 3), 1).

fact(704, instance(dietplanner, coffee_energydrinks), 1).
fact(705, has(dietplanner, coffee_energydrinks, name, "Energy Drink"), 1).
fact(706, has(dietplanner, coffee_energydrinks, description, "High-energy drink with caffeine for an energy boost."), 1).
fact(707, has(dietplanner, coffee_energydrinks, calories, 45), 1).

fact(708, instance(dietplanner, coffee_energydrinks), 1).
fact(709, has(dietplanner, coffee_energydrinks, name, "Iced Latte"), 1).
fact(710, has(dietplanner, coffee_energydrinks, description, "Chilled latte with espresso and milk for a creamy taste."), 1).
fact(711, has(dietplanner, coffee_energydrinks, calories, 29), 1).

fact(712, instance(dietplanner, coffee_energydrinks), 1).
fact(713, has(dietplanner, coffee_energydrinks, name, "Black Coffee"), 1).
fact(714, has(dietplanner, coffee_energydrinks, description, "Strong and bold black coffee for a wake-up call."), 1).
fact(715, has(dietplanner, coffee_energydrinks, calories, 2), 1).

fact(716, instance(dietplanner, coffee_energydrinks), 1).
fact(717, has(dietplanner, coffee_energydrinks, name, "Mocha Frappuccino"), 1).
fact(718, has(dietplanner, coffee_energydrinks, description, "Creamy and chocolaty mocha frappuccino for a delightful treat."), 1).
fact(719, has(dietplanner, coffee_energydrinks, calories, 54), 1).

% Subclass: soda
fact(628, instance(dietplanner, soda), 1).
fact(629, has(dietplanner, soda, name, "Cola"), 1).
fact(630, has(dietplanner, soda, description, "Classic cola soda for a refreshing taste."), 1).
fact(631, has(dietplanner, soda, calories, 42), 1).

fact(680, instance(dietplanner, soda), 1).
fact(681, has(dietplanner, soda, name, "Lemon Lime Soda"), 1).
fact(682, has(dietplanner, soda, description, "Citrusy lemon-lime soda for a zesty flavor."), 1).
fact(683, has(dietplanner, soda, calories, 41), 1).

fact(684, instance(dietplanner, soda), 1).
fact(685, has(dietplanner, soda, name, "Cola Light"), 1).
fact(686, has(dietplanner, soda, description, "Light version of classic cola for reduced calories."), 1).
fact(687, has(dietplanner, soda, calories, 0), 1).

fact(688, instance(dietplanner, soda), 1).
fact(689, has(dietplanner, soda, name, "Ginger Ale"), 1).
fact(690, has(dietplanner, soda, description, "Bubbly ginger ale with a hint of spice."), 1).
fact(691, has(dietplanner, soda, calories, 37), 1).

fact(692, instance(dietplanner, soda), 1).
fact(693, has(dietplanner, soda, name, "Orange Soda"), 1).
fact(694, has(dietplanner, soda, description, "Fizzy orange soda for a burst of citrus."), 1).
fact(695, has(dietplanner, soda, calories, 42), 1).

fact(696, instance(dietplanner, soda), 1).
fact(697, has(dietplanner, soda, name, "Root Beer"), 1).
fact(698, has(dietplanner, soda, description, "Classic root beer with a rich and creamy taste."), 1).
fact(699, has(dietplanner, soda, calories, 46), 1).

% Subclass: juice
fact(632, instance(dietplanner, juice), 1).
fact(633, has(dietplanner, juice, name, "Orange Juice"), 1).
fact(634, has(dietplanner, juice, description, "Freshly squeezed orange juice for a vitamin C boost."), 1).
fact(635, has(dietplanner, juice, calories, 45), 1).

fact(660, instance(dietplanner, juice), 1).
fact(661, has(dietplanner, juice, name, "Grapefruit Juice"), 1).
fact(662, has(dietplanner, juice, description, "Tangy and invigorating grapefruit juice."), 1).
fact(663, has(dietplanner, juice, calories, 39), 1).

fact(664, instance(dietplanner, juice), 1).
fact(665, has(dietplanner, juice, name, "Pineapple Juice"), 1).
fact(666, has(dietplanner, juice, description, "Sweet and tropical pineapple juice."), 1).
fact(667, has(dietplanner, juice, calories, 50), 1).

fact(668, instance(dietplanner, juice), 1).
fact(669, has(dietplanner, juice, name, "Cranberry Juice"), 1).
fact(670, has(dietplanner, juice, description, "Tart and antioxidant-rich cranberry juice."), 1).
fact(671, has(dietplanner, juice, calories, 46), 1).

fact(672, instance(dietplanner, juice), 1).
fact(673, has(dietplanner, juice, name, "Mango Juice"), 1).
fact(674, has(dietplanner, juice, description, "Smooth and luscious mango juice."), 1).
fact(675, has(dietplanner, juice, calories, 54), 1).

fact(676, instance(dietplanner, juice), 1).
fact(677, has(dietplanner, juice, name, "Watermelon Juice"), 1).
fact(678, has(dietplanner, juice, description, "Refreshing watermelon juice for hydration."), 1).
fact(679, has(dietplanner, juice, calories, 30), 1).

% Subclass: water
fact(636, instance(dietplanner, water), 1).
fact(637, has(dietplanner, water, name, "Mineral Water"), 1).
fact(638, has(dietplanner, water, description, "Refreshing mineral water for hydration."), 1).
fact(639, has(dietplanner, water, calories, 0), 1).

fact(640, instance(dietplanner, water), 1).
fact(641, has(dietplanner, water, name, "Sparkling Water"), 1).
fact(642, has(dietplanner, water, description, "Bubbly sparkling water for a refreshing effervescence."), 1).
fact(643, has(dietplanner, water, calories, 0), 1).

fact(644, instance(dietplanner, water), 1).
fact(645, has(dietplanner, water, name, "Spring Water"), 1).
fact(646, has(dietplanner, water, description, "Fresh and pure spring water sourced from natural springs."), 1).
fact(647, has(dietplanner, water, calories, 0), 1).

fact(648, instance(dietplanner, water), 1).
fact(649, has(dietplanner, water, name, "Mineral Water with Lemon"), 1).
fact(650, has(dietplanner, water, description, "Mineral water infused with zesty lemon flavor."), 1).
fact(651, has(dietplanner, water, calories, 2), 1).

fact(652, instance(dietplanner, water), 1).
fact(653, has(dietplanner, water, name, "Coconut Water"), 1).
fact(654, has(dietplanner, water, description, "Natural and hydrating coconut water."), 1).
fact(655, has(dietplanner, water, calories, 19), 1).

fact(656, instance(dietplanner, water), 1).
fact(657, has(dietplanner, water, name, "Infused Water with Cucumber and Mint"), 1).
fact(658, has(dietplanner, water, description, "Refreshing infused water with cool cucumber and fresh mint."), 1).
fact(659, has(dietplanner, water, calories, 0), 1).



% ---------
% Class: nutrient

% Subclass: alcoholic
fact(428, instance(dietplanner, alcoholic), 1).
fact(429, has(dietplanner, alcoholic, name, "Ethanol"), 1).
fact(430, has(dietplanner, alcoholic, description, "The psychoactive ingredient in alcoholic beverages."), 1).

% Subclass: amino_acidic
fact(860, instance(dietplanner, amino_acidic), 1).
fact(861, has(dietplanner, amino_acidic, name, "Tryptophan"), 1).
fact(862, has(dietplanner, amino_acidic, description, "Essential amino acid important for mood regulation and serotonin production."), 1).

fact(863, instance(dietplanner, amino_acidic), 1).
fact(864, has(dietplanner, amino_acidic, name, "Leucine"), 1).
fact(865, has(dietplanner, amino_acidic, description, "Essential amino acid vital for muscle growth and repair."), 1).

fact(866, instance(dietplanner, amino_acidic), 1).
fact(867, has(dietplanner, amino_acidic, name, "Valine"), 1).
fact(868, has(dietplanner, amino_acidic, description, "Essential amino acid involved in energy production and tissue repair."), 1).

fact(869, instance(dietplanner, amino_acidic), 1).
fact(870, has(dietplanner, amino_acidic, name, "Methionine"), 1).
fact(871, has(dietplanner, amino_acidic, description, "Essential amino acid important for metabolism and detoxification."), 1).

fact(872, instance(dietplanner, amino_acidic), 1).
fact(873, has(dietplanner, amino_acidic, name, "Phenylalanine"), 1).
fact(874, has(dietplanner, amino_acidic, description, "Essential amino acid precursor to various neurotransmitters and hormones."), 1).

% Subclass: dietary_fiber
fact(434, instance(dietplanner, dietary_fiber), 1).
fact(435, has(dietplanner, dietary_fiber, name, "Soluble Fiber"), 1).
fact(436, has(dietplanner, dietary_fiber, description, "Fiber that dissolves in water and forms a gel-like substance."), 1).

fact(880, instance(dietplanner, dietary_fiber), 1).
fact(881, has(dietplanner, dietary_fiber, name, "Insoluble Fiber"), 1).
fact(882, has(dietplanner, dietary_fiber, description, "Fiber that does not dissolve in water and promotes regular bowel movements."), 1).

fact(883, instance(dietplanner, dietary_fiber), 1).
fact(884, has(dietplanner, dietary_fiber, name, "Pectin"), 1).
fact(885, has(dietplanner, dietary_fiber, description, "Soluble fiber found in fruits and used for making jams and jellies."), 1).

fact(886, instance(dietplanner, dietary_fiber), 1).
fact(887, has(dietplanner, dietary_fiber, name, "Cellulose"), 1).
fact(888, has(dietplanner, dietary_fiber, description, "Plant-based fiber that provides structure to plant cell walls."), 1).

fact(889, instance(dietplanner, dietary_fiber), 1).
fact(890, has(dietplanner, dietary_fiber, name, "Oligosaccharides"), 1).
fact(891, has(dietplanner, dietary_fiber, description, "Short-chain carbohydrates with potential prebiotic effects."), 1).

fact(892, instance(dietplanner, dietary_fiber), 1).
fact(893, has(dietplanner, dietary_fiber, name, "Resistant Starch"), 1).
fact(894, has(dietplanner, dietary_fiber, description, "Starch that escapes digestion in the small intestine and provides benefits to the large intestine."), 1).

% Subclass: carbs
fact(437, instance(dietplanner, carbs), 1).
fact(438, has(dietplanner, carbs, name, "Complex Carbohydrates"), 1).
fact(439, has(dietplanner, carbs, description, "Carbohydrates with longer chains of sugar molecules."), 1).

fact(900, instance(dietplanner, carbs), 1).
fact(901, has(dietplanner, carbs, name, "Glucose"), 1).
fact(902, has(dietplanner, carbs, description, "Simple sugar and primary source of energy for the body."), 1).

fact(903, instance(dietplanner, carbs), 1).
fact(904, has(dietplanner, carbs, name, "Fructose"), 1).
fact(905, has(dietplanner, carbs, description, "Naturally occurring sugar found in fruits and honey."), 1).

fact(906, instance(dietplanner, carbs), 1).
fact(907, has(dietplanner, carbs, name, "Starch"), 1).
fact(908, has(dietplanner, carbs, description, "Complex carbohydrate providing sustained energy."), 1).

fact(909, instance(dietplanner, carbs), 1).
fact(910, has(dietplanner, carbs, name, "Lactose"), 1).
fact(911, has(dietplanner, carbs, description, "Sugar found in milk and dairy products."), 1).

fact(912, instance(dietplanner, carbs), 1).
fact(913, has(dietplanner, carbs, name, "Galactose"), 1).
fact(914, has(dietplanner, carbs, description, "Simple sugar found in milk and as part of lactose."), 1).

% Subclass: lipids
fact(440, instance(dietplanner, lipids), 1).
fact(441, has(dietplanner, lipids, name, "Saturated Fats"), 1).
fact(442, has(dietplanner, lipids, description, "Fats with no double bonds between carbon molecules."), 1).

fact(923, instance(dietplanner, lipids), 1).
fact(924, has(dietplanner, lipids, name, "Monounsaturated Fat"), 1).
fact(925, has(dietplanner, lipids, description, "Healthy fat with one double bond in its structure."), 1).

fact(926, instance(dietplanner, lipids), 1).
fact(927, has(dietplanner, lipids, name, "Polyunsaturated Fat"), 1).
fact(928, has(dietplanner, lipids, description, "Healthy fat with multiple double bonds in its structure."), 1).

fact(929, instance(dietplanner, lipids), 1).
fact(930, has(dietplanner, lipids, name, "Trans Fat"), 1).
fact(931, has(dietplanner, lipids, description, "Unhealthy fat created through hydrogenation, found in some processed foods."), 1).

fact(932, instance(dietplanner, lipids), 1).
fact(933, has(dietplanner, lipids, name, "Omega-3 Fatty Acids"), 1).
fact(934, has(dietplanner, lipids, description, "Essential fatty acids with anti-inflammatory benefits."), 1).

% Subclass: minerals
fact(443, instance(dietplanner, minerals), 1).
fact(444, has(dietplanner, minerals, name, "Calcium"), 1).
fact(445, has(dietplanner, minerals, description, "Mineral important for bone health and muscle function."), 1).

fact(943, instance(dietplanner, minerals), 1).
fact(944, has(dietplanner, minerals, name, "Iron"), 1).
fact(945, has(dietplanner, minerals, description, "Critical mineral for oxygen transport and energy production."), 1).

fact(946, instance(dietplanner, minerals), 1).
fact(947, has(dietplanner, minerals, name, "Potassium"), 1).
fact(948, has(dietplanner, minerals, description, "Electrolyte crucial for fluid balance and nerve function."), 1).

fact(949, instance(dietplanner, minerals), 1).
fact(950, has(dietplanner, minerals, name, "Magnesium"), 1).
fact(951, has(dietplanner, minerals, description, "Involved in hundreds of biochemical reactions in the body."), 1).

fact(952, instance(dietplanner, minerals), 1).
fact(953, has(dietplanner, minerals, name, "Zinc"), 1).
fact(954, has(dietplanner, minerals, description, "Essential trace mineral supporting immune function and more."), 1).

% Subclass: protein
fact(446, instance(dietplanner, protein), 1).
fact(447, has(dietplanner, protein, name, "Whey Protein"), 1).
fact(448, has(dietplanner, protein, description, "High-quality protein derived from milk."), 1).

fact(963, instance(dietplanner, protein), 1).
fact(964, has(dietplanner, protein, name, "Casein Protein"), 1).
fact(965, has(dietplanner, protein, description, "Slow-digesting protein found in milk products and supplements."), 1).

fact(966, instance(dietplanner, protein), 1).
fact(967, has(dietplanner, protein, name, "Soy Protein"), 1).
fact(968, has(dietplanner, protein, description, "Plant-based protein derived from soybeans, suitable for vegetarians and vegans."), 1).

fact(969, instance(dietplanner, protein), 1).
fact(970, has(dietplanner, protein, name, "Egg White Protein"), 1).
fact(971, has(dietplanner, protein, description, "Protein sourced from egg whites, low in fat and carbohydrates."), 1).

fact(972, instance(dietplanner, protein), 1).
fact(973, has(dietplanner, protein, name, "Pea Protein"), 1).
fact(974, has(dietplanner, protein, description, "Plant-based protein extracted from yellow peas, suitable for various diets."), 1).

% Subclass: vitamin
fact(449, instance(dietplanner, vitamin), 1).
fact(450, has(dietplanner, vitamin, name, "Vitamin C"), 1).
fact(451, has(dietplanner, vitamin, description, "An antioxidant vitamin that supports immune health."), 1).

fact(983, instance(dietplanner, vitamin), 1).
fact(984, has(dietplanner, vitamin, name, "Vitamin D"), 1).
fact(985, has(dietplanner, vitamin, description, "Crucial vitamin for bone health and calcium absorption."), 1).

fact(986, instance(dietplanner, vitamin), 1).
fact(987, has(dietplanner, vitamin, name, "Vitamin A"), 1).
fact(988, has(dietplanner, vitamin, description, "Essential for vision, immune function, and cell growth."), 1).

fact(989, instance(dietplanner, vitamin), 1).
fact(990, has(dietplanner, vitamin, name, "Vitamin K"), 1).
fact(991, has(dietplanner, vitamin, description, "Vitamin necessary for blood clotting and bone health."), 1).

fact(992, instance(dietplanner, vitamin), 1).
fact(993, has(dietplanner, vitamin, name, "Vitamin E"), 1).
fact(994, has(dietplanner, vitamin, description, "Antioxidant vitamin protecting cells from damage."), 1).


% ---------
% Class: allergen
fact(365, instance(dietplanner, allergen), 1).
fact(366, has(dietplanner, allergen, name, "Gluten"), 1).
fact(367, has(dietplanner, allergen, description, "A protein found in wheat, barley, and rye."), 1).

fact(368, instance(dietplanner, allergen), 1).
fact(369, has(dietplanner, allergen, name, "Dairy"), 1).
fact(370, has(dietplanner, allergen, description, "Products containing milk or milk-derived ingredients."), 1).

fact(371, instance(dietplanner, allergen), 1).
fact(372, has(dietplanner, allergen, name, "Peanuts"), 1).
fact(373, has(dietplanner, allergen, description, "Tree nuts that can cause severe allergies."), 1).

fact(374, instance(dietplanner, allergen), 1).
fact(375, has(dietplanner, allergen, name, "Soy"), 1).
fact(376, has(dietplanner, allergen, description, "Products made from soybeans."), 1).

fact(377, instance(dietplanner, allergen), 1).
fact(378, has(dietplanner, allergen, name, "Shellfish"), 1).
fact(379, has(dietplanner, allergen, description, "Seafood like shrimp, crab, and lobster."), 1).


% ---------
% Class: person
fact(330, instance(dietplanner, person), 1).
fact(331, has(dietplanner, person, name, "Alice"), 1).
fact(332, has(dietplanner, person, surname, "Johnson"), 1).
fact(333, has(dietplanner, person, age, 30), 1).
fact(334, has(dietplanner, person, gender, "Female"), 1).
fact(335, has(dietplanner, person, height, 165), 1).
fact(336, has(dietplanner, person, weight, 60.5), 1).

fact(337, instance(dietplanner, person), 1).
fact(338, has(dietplanner, person, name, "Bob"), 1).
fact(339, has(dietplanner, person, surname, "Smith"), 1).
fact(340, has(dietplanner, person, age, 28), 1).
fact(341, has(dietplanner, person, gender, "Male"), 1).
fact(342, has(dietplanner, person, height, 180), 1).
fact(343, has(dietplanner, person, weight, 75.2), 1).

fact(344, instance(dietplanner, person), 1).
fact(345, has(dietplanner, person, name, "Emma"), 1).
fact(346, has(dietplanner, person, surname, "Davis"), 1).
fact(347, has(dietplanner, person, age, 22), 1).
fact(348, has(dietplanner, person, gender, "Female"), 1).
fact(349, has(dietplanner, person, height, 158), 1).
fact(350, has(dietplanner, person, weight, 55.0), 1).

fact(351, instance(dietplanner, person), 1).
fact(352, has(dietplanner, person, name, "Michael"), 1).
fact(353, has(dietplanner, person, surname, "Brown"), 1).
fact(354, has(dietplanner, person, age, 35), 1).
fact(355, has(dietplanner, person, gender, "Male"), 1).
fact(356, has(dietplanner, person, height, 175), 1).
fact(357, has(dietplanner, person, weight, 80.7), 1).

fact(358, instance(dietplanner, person), 1).
fact(359, has(dietplanner, person, name, "Sophia"), 1).
fact(360, has(dietplanner, person, surname, "Miller"), 1).
fact(361, has(dietplanner, person, age, 29), 1).
fact(362, has(dietplanner, person, gender, "Female"), 1).
fact(363, has(dietplanner, person, height, 170), 1).
fact(364, has(dietplanner, person, weight, 63.8), 1).

% ---------
% Class: activity
fact(250, instance(dietplanner, activity), 1).
fact(251, has(dietplanner, activity, name, "Running"), 1).
fact(252, has(dietplanner, activity, description, "Go for a run to boost your cardiovascular health."), 1).
fact(253, has(dietplanner, activity, calory_effort, 600), 1).

fact(254, instance(dietplanner, activity), 1).
fact(255, has(dietplanner, activity, name, "Swimming"), 1).
fact(256, has(dietplanner, activity, description, "Hit the pool for a full-body workout."), 1).
fact(257, has(dietplanner, activity, calory_effort, 700), 1).

fact(258, instance(dietplanner, activity), 1).
fact(259, has(dietplanner, activity, name, "Yoga"), 1).
fact(260, has(dietplanner, activity, description, "Relax and stretch with a calming yoga session."), 1).
fact(261, has(dietplanner, activity, calory_effort, 300), 1).

fact(262, instance(dietplanner, activity), 1).
fact(263, has(dietplanner, activity, name, "Weightlifting"), 1).
fact(264, has(dietplanner, activity, description, "Build strength and muscle with weightlifting."), 1).
fact(265, has(dietplanner, activity, calory_effort, 400), 1).

fact(266, instance(dietplanner, activity), 1).
fact(267, has(dietplanner, activity, name, "Cycling"), 1).
fact(268, has(dietplanner, activity, description, "Take a bike ride for a fun and effective workout."), 1).
fact(269, has(dietplanner, activity, calory_effort, 500), 1).

% Subclass: sports
fact(270, instance(dietplanner, sports), 1).
fact(271, has(dietplanner, sports, name, "Soccer"), 1).
fact(272, has(dietplanner, sports, description, "Play soccer for a team-based cardio workout."), 1).
fact(273, has(dietplanner, sports, calory_effort, 800), 1).

fact(274, instance(dietplanner, sports), 1).
fact(275, has(dietplanner, sports, name, "Basketball"), 1).
fact(276, has(dietplanner, sports, description, "Shoot hoops and run on the court for fitness."), 1).
fact(277, has(dietplanner, sports, calory_effort, 700), 1).

fact(278, instance(dietplanner, sports), 1).
fact(279, has(dietplanner, sports, name, "Tennis"), 1).
fact(280, has(dietplanner, sports, description, "Enjoy a game of tennis to improve agility."), 1).
fact(281, has(dietplanner, sports, calory_effort, 600), 1).

fact(282, instance(dietplanner, sports), 1).
fact(283, has(dietplanner, sports, name, "Volleyball"), 1).
fact(284, has(dietplanner, sports, description, "Bump, set, and spike in a game of volleyball."), 1).
fact(285, has(dietplanner, sports, calory_effort, 500), 1).

fact(286, instance(dietplanner, sports), 1).
fact(287, has(dietplanner, sports, name, "Cycling Race"), 1).
fact(288, has(dietplanner, sports, description, "Participate in a cycling race for a challenging workout."), 1).
fact(289, has(dietplanner, sports, calory_effort, 1000), 1).

% Subclass: inactivity
fact(290, instance(dietplanner, inactivity), 1).
fact(291, has(dietplanner, inactivity, name, "Sitting"), 1).
fact(292, has(dietplanner, inactivity, description, "Sitting for extended periods can be detrimental to health."), 1).
fact(293, has(dietplanner, inactivity, calory_effort, 100), 1).

fact(294, instance(dietplanner, inactivity), 1).
fact(295, has(dietplanner, inactivity, name, "TV Watching"), 1).
fact(296, has(dietplanner, inactivity, description, "Watching TV for hours can lead to a sedentary lifestyle."), 1).
fact(297, has(dietplanner, inactivity, calory_effort, 50), 1).

fact(298, instance(dietplanner, inactivity), 1).
fact(299, has(dietplanner, inactivity, name, "Desk Work"), 1).
fact(300, has(dietplanner, inactivity, description, "Sitting at a desk for work without breaks can impact well-being."), 1).
fact(301, has(dietplanner, inactivity, calory_effort, 70), 1).

fact(302, instance(dietplanner, inactivity), 1).
fact(303, has(dietplanner, inactivity, name, "Reading"), 1).
fact(304, has(dietplanner, inactivity, description, "Reading for long periods can lead to reduced physical activity."), 1).
fact(305, has(dietplanner, inactivity, calory_effort, 60), 1).

fact(306, instance(dietplanner, inactivity), 1).
fact(307, has(dietplanner, inactivity, name, "Computer Use"), 1).
fact(308, has(dietplanner, inactivity, description, "Using a computer for extended periods can contribute to inactivity."), 1).
fact(309, has(dietplanner, inactivity, calory_effort, 80), 1).

% Subclass: walking
fact(310, instance(dietplanner, walking), 1).
fact(311, has(dietplanner, walking, name, "Brisk Walking"), 1).
fact(312, has(dietplanner, walking, description, "Take a brisk walk to improve cardiovascular health."), 1).
fact(313, has(dietplanner, walking, calory_effort, 300), 1).

fact(314, instance(dietplanner, walking), 1).
fact(315, has(dietplanner, walking, name, "Nature Walk"), 1).
fact(316, has(dietplanner, walking, description, "Enjoy a leisurely walk in nature for mental and physical well-being."), 1).
fact(317, has(dietplanner, walking, calory_effort, 200), 1).

fact(318, instance(dietplanner, walking), 1).
fact(319, has(dietplanner, walking, name, "Power Walking"), 1).
fact(320, has(dietplanner, walking, description, "Engage in power walking for an effective workout."), 1).
fact(321, has(dietplanner, walking, calory_effort, 400), 1).

fact(322, instance(dietplanner, walking), 1).
fact(323, has(dietplanner, walking, name, "Evening Stroll"), 1).
fact(324, has(dietplanner, walking, description, "Take a relaxing evening stroll to unwind."), 1).
fact(325, has(dietplanner, walking, calory_effort, 150), 1).

fact(326, instance(dietplanner, walking), 1).
fact(327, has(dietplanner, walking, name, "Urban Walking"), 1).
fact(328, has(dietplanner, walking, description, "Explore the city on foot with urban walking."), 1).
fact(329, has(dietplanner, walking, calory_effort, 250), 1).

% ---------
% Class: meal
fact(200, instance(dietplanner, meal), 1).
fact(201, has(dietplanner, meal, name, "Breakfast"), 1).
fact(202, has(dietplanner, meal, description, "Start your day with a healthy breakfast."), 1).

fact(203, instance(dietplanner, meal), 1).
fact(204, has(dietplanner, meal, name, "Lunch"), 1).
fact(205, has(dietplanner, meal, description, "A balanced lunch to keep you energized."), 1).

fact(206, instance(dietplanner, meal), 1).
fact(207, has(dietplanner, meal, name, "Dinner"), 1).
fact(208, has(dietplanner, meal, description, "A light and nutritious dinner option."), 1).

fact(209, instance(dietplanner, meal), 1).
fact(210, has(dietplanner, meal, name, "Snack 1"), 1).
fact(211, has(dietplanner, meal, description, "A quick and healthy snack."), 1).

fact(212, instance(dietplanner, meal), 1).
fact(213, has(dietplanner, meal, name, "Snack 2"), 1).
fact(214, has(dietplanner, meal, description, "Another tasty snack to curb your hunger."), 1).

% Subclass: main_meals
fact(215, instance(dietplanner, main_meals), 1).
fact(216, has(dietplanner, main_meals, name, "Chicken Stir-Fry"), 1).
fact(217, has(dietplanner, main_meals, description, "A flavorful stir-fry with lean chicken and vegetables."), 1).

fact(218, instance(dietplanner, main_meals), 1).
fact(219, has(dietplanner, main_meals, name, "Vegetable Curry"), 1).
fact(220, has(dietplanner, main_meals, description, "A hearty curry loaded with assorted vegetables."), 1).

fact(221, instance(dietplanner, main_meals), 1).
fact(222, has(dietplanner, main_meals, name, "Grilled Salmon"), 1).
fact(223, has(dietplanner, main_meals, description, "Freshly grilled salmon fillet with a citrus glaze."), 1).

fact(224, instance(dietplanner, main_meals), 1).
fact(225, has(dietplanner, main_meals, name, "Pasta Primavera"), 1).
fact(226, has(dietplanner, main_meals, description, "Pasta tossed with seasonal vegetables in a light sauce."), 1).

fact(227, instance(dietplanner, main_meals), 1).
fact(228, has(dietplanner, main_meals, name, "Quinoa Bowl"), 1).
fact(229, has(dietplanner, main_meals, description, "A nutritious bowl featuring quinoa, greens, and assorted toppings."), 1).

% Subclass: snacks
fact(230, instance(dietplanner, snacks), 1).
fact(231, has(dietplanner, snacks, name, "Greek Yogurt Parfait"), 1).
fact(232, has(dietplanner, snacks, description, "Layers of Greek yogurt, granola, and fresh berries."), 1).

fact(233, instance(dietplanner, snacks), 1).
fact(234, has(dietplanner, snacks, name, "Hummus and Veggies"), 1).
fact(235, has(dietplanner, snacks, description, "Crunchy vegetables paired with creamy hummus."), 1).

fact(236, instance(dietplanner, snacks), 1).
fact(237, has(dietplanner, snacks, name, "Trail Mix"), 1).
fact(238, has(dietplanner, snacks, description, "A mix of nuts, dried fruits, and chocolate chips for a quick snack."), 1).

fact(239, instance(dietplanner, snacks), 1).
fact(240, has(dietplanner, snacks, name, "Rice Cakes with Peanut Butter"), 1).
fact(241, has(dietplanner, snacks, description, "Light rice cakes spread with peanut butter."), 1).

fact(242, instance(dietplanner, snacks), 1).
fact(243, has(dietplanner, snacks, name, "Apple Slices with Almond Butter"), 1).
fact(244, has(dietplanner, snacks, description, "Fresh apple slices served with almond butter."), 1).
