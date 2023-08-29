:- consult('knowledgeBase.pl').

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

cereal_instance(dietplanner, cereal, pasta).
attribute_value(dietplanner, granola, name, "Pasta").
attribute_value(dietplanner, durum_wheat_pasta, description, "Pasta made from semolina, known for its high protein content and gluten strength.").
attribute_value(dietplanner, durum_wheat_pasta, calories, 250).

cereal_instance(dietplanner, cereal, white_bread).
attribute_value(dietplanner, white_bread, name, "White Bread").
attribute_value(dietplanner, white_bread, description, "White bread, a type of bread made from refined wheat flour, commonly used for sandwiches.").
attribute_value(dietplanner, white_bread, calories, 80).


% Subclass: eggs
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

% Subclass: fat_oils
fat_oils_instance(dietplanner, fat_oils, olive_oil).
attribute_value(dietplanner, olive_oil, name, "Olive Oil").
attribute_value(dietplanner, olive_oil, description, "Extra virgin olive oil for cooking and dressing.").
attribute_value(dietplanner, olive_oil, calories, 884).

fat_oils_instance(dietplanner, fat_oils, coconut_oil).
attribute_value(dietplanner, coconut_oil, name, "Coconut Oil").
attribute_value(dietplanner, coconut_oil, description, "Oil derived from coconuts, used in cooking and skincare.").
attribute_value(dietplanner, coconut_oil, calories, 862).

fat_oils_instance(dietplanner, fat_oils, avocado_oil).
attribute_value(dietplanner, avocado_oil, name, "Avocado Oil").
attribute_value(dietplanner, avocado_oil, description, "Oil made from avocados, known for its rich, buttery flavor.").
attribute_value(dietplanner, avocado_oil, calories, 124).

fat_oils_instance(dietplanner, fat_oils, canola_oil).
attribute_value(dietplanner, canola_oil, name, "Canola Oil").
attribute_value(dietplanner, canola_oil, description, "Neutral-flavored oil often used for cooking and frying.").
attribute_value(dietplanner, canola_oil, calories, 884).

fat_oils_instance(dietplanner, fat_oils, sesame_oil).
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

fish_seafood_instance(dietplanner, fish_seafood, lobster).
attribute_value(dietplanner, lobster, name, "Lobster").
attribute_value(dietplanner, lobster, description, "Succulent shellfish known for its sweet and tender meat.").
attribute_value(dietplanner, lobster, calories, 89).

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

fruits_olives_instance(dietplanner, fruits_olives, blueberries).
attribute_value(dietplanner, blueberries, name, "Orange").
attribute_value(dietplanner, blueberries, description, "Antioxidant-rich, nutrient-dense fruits known for their vibrant color and potential health benefits.").
attribute_value(dietplanner, blueberries, calories, 57).

% Subclass: meats
meats_instance(dietplanner, meats, chicken).
attribute_value(dietplanner, chicken, name, "Chicken").
attribute_value(dietplanner, chicken, description, "Chicken breast lean and tender, cooked in a pan or on grid.").
attribute_value(dietplanner, chicken, calories, 165).

meats_instance(dietplanner, meats, beef).
attribute_value(dietplanner, beef, name, "Beef").
attribute_value(dietplanner, beef, description, "Beef, a red meat, rich in flavor, often used for steaks and roasts.").
attribute_value(dietplanner, beef, calories, 250).

meats_instance(dietplanner, meats, pork).
attribute_value(dietplanner, pork, name, "Pork").
attribute_value(dietplanner, pork, description, "Pork, a meat vailable in various cuts, commonly used in sausages, bacon, and chops.").
attribute_value(dietplanner, pork, calories, 300).

meats_instance(dietplanner, meats, lamb).
attribute_value(dietplanner, lamb, name, "Lamb").
attribute_value(dietplanner, lamb, description, "Lamb, tender and flavorful meat, often used in stews, kebabs, and roasts.").
attribute_value(dietplanner, lamb, calories, 220).

meats_instance(dietplanner, meats, horse).
attribute_value(dietplanner, horse, name, "Horse").
attribute_value(dietplanner, horse, description, "Horse meat, consumed in some cultures, typically lean and slightly gamey.").
attribute_value(dietplanner, horse, calories, 180).

% Subclass: milk
milk_cheese_instance(dietplanner, milk_cheese, skim_milk).
attribute_value(dietplanner, skim_milk, name, "Skim Milk").
attribute_value(dietplanner, skim_milk, description, "Low-fat skim milk for a calcium boost.").
attribute_value(dietplanner, skim_milk, calories, 34).

milk_cheese_instance(dietplanner, milk_cheese, whole_milk).
attribute_value(dietplanner, whole_milk, name, "Whole Milk").
attribute_value(dietplanner, whole_milk, description, "Dairy milk with full-fat content, often used for drinking and cooking.").
attribute_value(dietplanner, whole_milk, calories, 61).

milk_cheese_instance(dietplanner, milk_cheese, reduced_fat_milk).
attribute_value(dietplanner, reduced_fat_milk, name, "Reduced-Fat Milk").
attribute_value(dietplanner, reduced_fat_milk, description, "Dairy milk with reduced fat content, commonly used as a lighter option.").
attribute_value(dietplanner, reduced_fat_milk, calories, 34).

milk_cheese_instance(dietplanner, milk_cheese, soy_milk).
attribute_value(dietplanner, soy_milk, name, "Soy Milk").
attribute_value(dietplanner, soy_milk, description, "Plant-based milk made from soybeans, suitable for vegans and lactose-intolerant individuals.").
attribute_value(dietplanner, soy_milk, calories, 33).

milk_cheese_instance(dietplanner, milk_cheese, almond_milk).
attribute_value(dietplanner, almond_milk, name, "Almond Milk").
attribute_value(dietplanner, almond_milk, description, "Nut milk made from almonds, often used as a dairy-free alternative.").
attribute_value(dietplanner, almond_milk, calories, 13).

milk_cheese_instance(dietplanner, milk, coconut_milk).
attribute_value(dietplanner, coconut_milk, name, "Coconut Milk").
attribute_value(dietplanner, coconut_milk, description, "Creamy milk derived from coconuts, used in cooking and beverages.").
attribute_value(dietplanner, coconut_milk, calories, 230).

milk_cheese_instance(dietplanner, milk, cheese).
attribute_value(dietplanner, cheese, name, "Cheese").
attribute_value(dietplanner, cheese, description, "A dairy product made from curdled milk, with a wide range of flavors, textures, and uses.").
attribute_value(dietplanner, cheese, calories, 300).

milk_cheese_instance(dietplanner, milk, gorgonzola_cheese).
attribute_value(dietplanner, gorgonzola_cheese, name, "Gorgonzola Cheese").
attribute_value(dietplanner, gorgonzola_cheese, description, "A type of blue cheese known for its characteristic veining and strong, tangy flavor.").
attribute_value(dietplanner, gorgonzola_cheese, calories, 350).


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

sweets_instance(dietplanner, sweets, milk_chocolate).
attribute_value(dietplanner, milk_chocolate, name, "Milk Chocolate").
attribute_value(dietplanner, milk_chocolate, description, "Smooth and creamy milk chocolate, a delightful treat.").
attribute_value(dietplanner, milk_chocolate, calories, 598).

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

% Subclass: vegetables
vegetable_instance(dietplanner, vegetables, carrot).
attribute_value(dietplanner, carrot, name, "Carrot").
attribute_value(dietplanner, carrot, description, "Root vegetable rich in vitamins and minerals.").
attribute_value(dietplanner, carrot, calories, 41).

vegetable_instance(dietplanner, vegetables, spinach).
attribute_value(dietplanner, spinach, name, "Spinach").
attribute_value(dietplanner, spinach, description, "Leafy green vegetable packed with nutrients.").
attribute_value(dietplanner, spinach, calories, 23).

vegetable_instance(dietplanner, vegetables, broccoli).
attribute_value(dietplanner, broccoli, name, "Broccoli").
attribute_value(dietplanner, broccoli, description, "Nutrient-dense green vegetable with edible florets.").
attribute_value(dietplanner, broccoli, calories, 55).

vegetable_instance(dietplanner, vegetables, bell_pepper).
attribute_value(dietplanner, bell_pepper, name, "Bell Pepper").
attribute_value(dietplanner, bell_pepper, description, "Colorful vegetable high in antioxidants.").
attribute_value(dietplanner, bell_pepper, calories, 29).

vegetable_instance(dietplanner, vegetables, tomato).
attribute_value(dietplanner, tomato, name, "Tomato").
attribute_value(dietplanner, tomato, description, "Edible red fruit commonly used as a vegetable.").
attribute_value(dietplanner, tomato, calories, 74).

% Subclass: beverage
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

minerals_instance(dietplanner, minerals, phosphorus).
attribute_value(dietplanner, phosphorus, name, "Phosphorus").
attribute_value(dietplanner, phosphorus, description, "Vital mineral supporting bone health, energy transfer, and various cellular processes in the body.").

minerals_instance(dietplanner, minerals, manganese).
attribute_value(dietplanner, manganese, name, "Manganese").
attribute_value(dietplanner, manganese, description, "Trace mineral essential for metabolism, bone health, and antioxidant defense in the body.").

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

protein_instance(dietplanner, protein, lean_protein).
attribute_value(dietplanner, lean_protein, name, "Lean Protein").
attribute_value(dietplanner, lean_protein, description, "Lean protein is low in fat and rich in essential amino acids, promoting muscle health and overall well-being.").

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

vitamin_instance(dietplanner, vitamin, vitamin_b6).
attribute_value(dietplanner, vitamin_b6, name, "Vitamin B6").
attribute_value(dietplanner, vitamin_b6, description, "Vitamin B6 is vital for metabolism, neurotransmitters, and immunity.").

vitamin_instance(dietplanner, vitamin, vitamin_b12).
attribute_value(dietplanner, vitamin_b12, name, "Vitamin B12").
attribute_value(dietplanner, vitamin_b12, description, "Water-soluble vitamin necessary for nerve function, DNA synthesis, and red blood cell formation.").

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

allergen_instance(dietplanner, allergens, nuts).
attribute_value(dietplanner, nuts, name, "Nuts").
attribute_value(dietplanner, nuts, description, "Common allergen, various types of nuts can trigger allergic reactions.").

allergen_instance(dietplanner, allergens, eggs).
attribute_value(dietplanner, eggs, name, "Eggs").
attribute_value(dietplanner, eggs, description, "Common allergen, egg allergies are especially common in children.").

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
attribute_value(dietplanner, alice_johnson, bmi, 22.22).
attribute_value(dietplanner, alice_johnson, energy_demand, 1710).

person_instance(dietplanner, person, bob_smith).
attribute_value(dietplanner, bob_smith, name, "Bob").
attribute_value(dietplanner, bob_smith, surname, "Smith").
attribute_value(dietplanner, bob_smith, age, 28).
attribute_value(dietplanner, bob_smith, gender, "Male").
attribute_value(dietplanner, bob_smith, height, 180).
attribute_value(dietplanner, bob_smith, weight, 75.2).
attribute_value(dietplanner, bob_smith, bmi, 23.21).
attribute_value(dietplanner, bob_smith, energy_demand, 2080).

person_instance(dietplanner, person, emma_finner).
attribute_value(dietplanner, emma_finner, name, "Emma").
attribute_value(dietplanner, emma_finner, surname, "Finner").
attribute_value(dietplanner, emma_finner, age, 40).
attribute_value(dietplanner, emma_finner, gender, "Female").
attribute_value(dietplanner, emma_finner, height, 172).
attribute_value(dietplanner, emma_finner, weight, 53.0).
attribute_value(dietplanner, emma_finner, bmi, 17.92).
attribute_value(dietplanner, emma_finner, energy_demand, 1550).

person_instance(dietplanner, person, emma_davis).
attribute_value(dietplanner, emma_davis, name, "Emma").
attribute_value(dietplanner, emma_davis, surname, "Davis").
attribute_value(dietplanner, emma_davis, age, 22).
attribute_value(dietplanner, emma_davis, gender, "Female").
attribute_value(dietplanner, emma_davis, height, 158).
attribute_value(dietplanner, emma_davis, weight, 55.0).
attribute_value(dietplanner, emma_davis, bmi, 22.03).
attribute_value(dietplanner, emma_davis, energy_demand, 1600).

person_instance(dietplanner, person, michael_brown).
attribute_value(dietplanner, michael_brown, name, "Michael").
attribute_value(dietplanner, michael_brown, surname, "Brown").
attribute_value(dietplanner, michael_brown, age, 35).
attribute_value(dietplanner, michael_brown, gender, "Male").
attribute_value(dietplanner, michael_brown, height, 175).
attribute_value(dietplanner, michael_brown, weight, 83.2).
attribute_value(dietplanner, michael_brown, bmi, 27.17).
attribute_value(dietplanner, michael_brown, energy_demand, 2150).

person_instance(dietplanner, person, sophia_miller).
attribute_value(dietplanner, sophia_miller, name, "Sophia").
attribute_value(dietplanner, sophia_miller, surname, "Miller").
attribute_value(dietplanner, sophia_miller, age, 29).
attribute_value(dietplanner, sophia_miller, gender, "Female").
attribute_value(dietplanner, sophia_miller, height, 170).
attribute_value(dietplanner, sophia_miller, weight, 51.8).
attribute_value(dietplanner, sophia_miller, bmi, 17.92).
attribute_value(dietplanner, sophia_miller, energy_demand, 1530).

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
% Class: dish
% ---------
% Instances of Dish
dish_instance(dietplanner, dish, scrambled_eggs).
attribute_value(dietplanner, scrambled_eggs, name, "Scrambled Eggs").
attribute_value(dietplanner, scrambled_eggs, description, "Fluffy scrambled eggs cooked to perfection.").
attribute_value(dietplanner, scrambled_eggs, type, breakfast).

dish_instance(dietplanner, dish, grilled_chicken_salad).
attribute_value(dietplanner, grilled_chicken_salad, name, "Grilled Chicken Salad").
attribute_value(dietplanner, grilled_chicken_salad, description, "Healthy salad with grilled chicken, mixed greens, and veggies.").
attribute_value(dietplanner, grilled_chicken_salad, type, lunch).

dish_instance(dietplanner, dish, hummus_and_veggie_platter).
attribute_value(dietplanner, hummus_and_veggie_platter, name, "Hummus and Veggie Platter").
attribute_value(dietplanner, hummus_and_veggie_platter, description, "Appetizer platter with hummus, carrot sticks, cucumber slices, and pita bread.").
attribute_value(dietplanner, hummus_and_veggie_platter, type, snack).

dish_instance(dietplanner, dish, spaghetti_bolognese).
attribute_value(dietplanner, spaghetti_bolognese, name, "Spaghetti Bolognese").
attribute_value(dietplanner, spaghetti_bolognese, description, "Classic Italian dish with spaghetti pasta and savory Bolognese sauce.").
attribute_value(dietplanner, spaghetti_bolognese, type, lunch).

dish_instance(dietplanner, dish, fruit_salad).
attribute_value(dietplanner, fruit_salad, name, "Fruit Salad").
attribute_value(dietplanner, fruit_salad, description, "Refreshing salad with a mix of fresh seasonal fruits.").
attribute_value(dietplanner, fruit_salad, type, snack).

dish_instance(dietplanner, dish, grilled_salmon_with_quinoa).
attribute_value(dietplanner, grilled_salmon_with_quinoa, name, "Grilled Salmon with Quinoa").
attribute_value(dietplanner, grilled_salmon_with_quinoa, description, "Grilled salmon fillet served with quinoa and steamed vegetables.").
attribute_value(dietplanner, grilled_salmon_with_quinoa, type, lunch).

dish_instance(dietplanner, dish, greek_yogurt).
attribute_value(dietplanner, greek_yogurt, name, "Greek Yogur").
attribute_value(dietplanner, greek_yogurt, description, "Healthy dessert parfait with Greek yogurt, berries, and granola.").
attribute_value(dietplanner, greek_yogurt, type, breakfast).

dish_instance(dietplanner, dish, vegan_lentil_curry).
attribute_value(dietplanner, vegan_lentil_curry, name, "Vegan Lentil Curry").
attribute_value(dietplanner, vegan_lentil_curry, description, "Flavorful curry made with lentils, vegetables, and aromatic spices.").
attribute_value(dietplanner, vegan_lentil_curry, type, lunch).

dish_instance(dietplanner, dish, trail_mix).
attribute_value(dietplanner, trail_mix, name, "Trail Mix").
attribute_value(dietplanner, trail_mix, description, "Energy-boosting snack mix with nuts, dried fruits, and seeds.").
attribute_value(dietplanner, trail_mix, type, snack).

dish_instance(dietplanner, dish, caesar_salad).
attribute_value(dietplanner, caesar_salad, name, "Caesar Salad").
attribute_value(dietplanner, caesar_salad, description, "Classic salad with Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.").
attribute_value(dietplanner, caesar_salad, type, lunch).

dish_instance(dietplanner, dish, veggie_spring_rolls).
attribute_value(dietplanner, veggie_spring_rolls, name, "Veggie Spring Rolls").
attribute_value(dietplanner, veggie_spring_rolls, description, "Light and crunchy spring rolls filled with fresh vegetables.").
attribute_value(dietplanner, veggie_spring_rolls, type, snack).

dish_instance(dietplanner, dish, grilled_steak_with_roasted_potatoes).
attribute_value(dietplanner, grilled_steak_with_roasted_potatoes, name, "Grilled Steak with Roasted Potatoes").
attribute_value(dietplanner, grilled_steak_with_roasted_potatoes, description, "Juicy grilled steak served with roasted potatoes and a side salad.").
attribute_value(dietplanner, grilled_steak_with_roasted_potatoes, type, dinner).

dish_instance(dietplanner, dish, smoothie_bowl).
attribute_value(dietplanner, smoothie_bowl, name, "Smoothie Bowl").
attribute_value(dietplanner, smoothie_bowl, description, "Thick and creamy smoothie bowl topped with fresh fruits, nuts, and seeds.").
attribute_value(dietplanner, smoothie_bowl, type, snack).

dish_instance(dietplanner, dish, mushroom_risotto).
attribute_value(dietplanner, mushroom_risotto, name, "Mushroom Risotto").
attribute_value(dietplanner, mushroom_risotto, description, "Creamy risotto made with Arborio rice and sautéed mushrooms.").
attribute_value(dietplanner, mushroom_risotto, type, lunch).

dish_instance(dietplanner, dish, popcorn).
attribute_value(dietplanner, popcorn, name, "Popcorn").
attribute_value(dietplanner, popcorn, description, "Light and crunchy popcorn, a great movie-time snack.").
attribute_value(dietplanner, popcorn, type, snack).

dish_instance(dietplanner, dish, chicken_stir_fry).
attribute_value(dietplanner, chicken_stir_fry, name, "Chicken Stir-Fry").
attribute_value(dietplanner, chicken_stir_fry, description, "Quick and healthy chicken stir-fry with colorful vegetables.").
attribute_value(dietplanner, chicken_stir_fry, type, dinner).

dish_instance(dietplanner, dish, pasta_primavera).
attribute_value(dietplanner, pasta_primavera, name, "Pasta Primavera").
attribute_value(dietplanner, pasta_primavera, description, "Vegetable-loaded pasta dish with a light and fresh flavor.").
attribute_value(dietplanner, pasta_primavera, type, lunch).

dish_instance(dietplanner, dish, margherita_pizza).
attribute_value(dietplanner, margherita_pizza, name, "Pizza Margherita").
attribute_value(dietplanner, margherita_pizza, description, "Classic Italian pizza with simple toppings including tomato sauce, fresh mozzarella cheese, basil leaves, and olive oil.").
attribute_value(dietplanner, margherita_pizza, type, dinner).

dish_instance(dietplanner, dish, caprese_salad).
attribute_value(dietplanner, caprese_salad, name, "Caprese Salad").
attribute_value(dietplanner, caprese_salad, description, "Classic Italian salad made with fresh tomatoes, mozzarella, and basil.").
attribute_value(dietplanner, caprese_salad, type, dinner).

dish_instance(dietplanner, dish, tomato_soup).
attribute_value(dietplanner, tomato_soup, name, "Tomato Soup").
attribute_value(dietplanner, tomato_soup, description, "Hearty and comforting tomato-based soup, perfect for any season.").
attribute_value(dietplanner, tomato_soup, type, lunch).

dish_instance(dietplanner, dish, chicken_caesar_salad).
attribute_value(dietplanner, chicken_caesar_salad, name, "Chicken Caesar Salad").
attribute_value(dietplanner, chicken_caesar_salad, description, "Classic salad with romaine lettuce, grilled chicken, croutons, and Caesar dressing.").
attribute_value(dietplanner, chicken_caesar_salad, type, lunch).

dish_instance(dietplanner, dish, grilled_chicken_burger).
attribute_value(dietplanner, grilled_chicken_burger, name, "Grilled Chicken Burger").
attribute_value(dietplanner, grilled_chicken_burger, description, "Burger with a grilled chicken patty, served with fresh toppings.").
attribute_value(dietplanner, grilled_chicken_burger, type, dinner).

dish_instance(dietplanner, dish, mixed_berry_smoothie).
attribute_value(dietplanner, mixed_berry_smoothie, name, "Mixed Berry Smoothie").
attribute_value(dietplanner, mixed_berry_smoothie, description, "Refreshing smoothie made with a blend of mixed berries and yogurt.").
attribute_value(dietplanner, mixed_berry_smoothie, type, breakfast).

dish_instance(dietplanner, dish, chocolate_mousse).
attribute_value(dietplanner, chocolate_mousse, name, "Chocolate Mousse").
attribute_value(dietplanner, chocolate_mousse, description, "Decadent dessert made with whipped chocolate and cream.").
attribute_value(dietplanner, chocolate_mousse, type, snack).

dish_instance(dietplanner, dish, chocolate_chip_cookies).
attribute_value(dietplanner, chocolate_chip_cookies, name, "Chocolate Chip Cookies").
attribute_value(dietplanner, chocolate_chip_cookies, description, "Classic cookies with chocolate chips, perfect for a sweet treat.").
attribute_value(dietplanner, chocolate_chip_cookies, type, snack).

dish_instance(dietplanner, dish, veggie_pizza).
attribute_value(dietplanner, veggie_pizza, name, "Veggie Pizza").
attribute_value(dietplanner, veggie_pizza, description, "Pizza topped with a variety of fresh vegetables and cheese.").
attribute_value(dietplanner, veggie_pizza, type, dinner).

dish_instance(dietplanner, dish, garden_salad).
attribute_value(dietplanner, garden_salad, name, "Garden Salad").
attribute_value(dietplanner, garden_salad, description, "Healthy salad with a mix of garden-fresh vegetables and greens.").
attribute_value(dietplanner, garden_salad, type, snack).

dish_instance(dietplanner, dish, tuna_sandwich).
attribute_value(dietplanner, tuna_sandwich, name, "Tuna Sandwich").
attribute_value(dietplanner, tuna_sandwich, description, "Sandwich filled with tuna salad, lettuce, and other toppings.").
attribute_value(dietplanner, tuna_sandwich, type, dinner).

dish_instance(dietplanner, dish, sushi_roll).
attribute_value(dietplanner, sushi_roll, name, "Sushi Roll").
attribute_value(dietplanner, sushi_roll, description, "Japanese dish with rice, seafood, and vegetables wrapped in seaweed.").
attribute_value(dietplanner, sushi_roll, type, dinner).

dish_instance(dietplanner, dish, beef_stew).
attribute_value(dietplanner, beef_stew, name, "Beef Stew").
attribute_value(dietplanner, beef_stew, description, "Hearty stew with tender beef, vegetables, and flavorful broth.").
attribute_value(dietplanner, beef_stew, type, dinner).

dish_instance(dietplanner, dish, beef_tacos).
attribute_value(dietplanner, beef_tacos, name, "Beef Tacos").
attribute_value(dietplanner, beef_tacos, description, "Tacos filled with seasoned ground beef and various toppings.").
attribute_value(dietplanner, beef_tacos, type, dinner).



% ---------
% Relationships
% ---------
has_nutrient(dietplanner, chicken_breast, lean_protein).
has_nutrient(dietplanner, chicken_breast, vitamin_b6).
has_nutrient(dietplanner, chicken_breast, phosphorus).
has_nutrient(dietplanner, spinach, iron).
has_nutrient(dietplanner, spinach, vitamin_k).
has_nutrient(dietplanner, spinach, vitamin_a).
has_nutrient(dietplanner, oatmeal, complex_carbohydrates).
has_nutrient(dietplanner, oatmeal, soluble_fiber).
has_nutrient(dietplanner, oatmeal, manganese).
has_nutrient(dietplanner, salmon, omega_3_fatty_acids).
has_nutrient(dietplanner, salmon, vitamin_d).
has_nutrient(dietplanner, salmon, vitamin_b12).
has_nutrient(dietplanner, almonds, monounsaturated_fat).
has_nutrient(dietplanner, almonds, vitamin_e).
has_nutrient(dietplanner, almonds, magnesium).
has_nutrient(dietplanner, greek_yogurt, casein_protein).
has_nutrient(dietplanner, greek_yogurt, calcium).
has_nutrient(dietplanner, blueberries, vitamin_c).
has_nutrient(dietplanner, blueberries, insoluble_fiber).

part_of(dietplanner, lean_protein, chicken_breast).
part_of(dietplanner, vitamin_b6, chicken_breast).
part_of(dietplanner, phosphorus, chicken_breast).
part_of(dietplanner, iron, spinach).
part_of(dietplanner, vitamin_k, spinach).
part_of(dietplanner, vitamin_a, spinach).
part_of(dietplanner, complex_carbohydrates, oatmeal).
part_of(dietplanner, soluble_fiber, oatmeal).
part_of(dietplanner, manganese, oatmeal).
part_of(dietplanner, omega_3_fatty_acids, salmon).
part_of(dietplanner, vitamin_d, salmon).
part_of(dietplanner, vitamin_b12, salmon).
part_of(dietplanner, monounsaturated_fat, almonds).
part_of(dietplanner, vitamin_e, almonds).
part_of(dietplanner, magnesium, almonds).
part_of(dietplanner, casein_protein, greek_yogurt).
part_of(dietplanner, calcium, greek_yogurt).
part_of(dietplanner, vitamin_c, blueberries).
part_of(dietplanner, insoluble_fiber, blueberries).

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

is_contained(dietplanner, nuts, almond_milk).
is_contained(dietplanner, shellfish, shrimp).
is_contained(dietplanner, shellfish, crab).
is_contained(dietplanner, gluten, wheat_bread).
is_contained(dietplanner, gluten, pasta).
is_contained(dietplanner, eggs, chicken_eggs).
is_contained(dietplanner, eggs, quail_eggs).
is_contained(dietplanner, eggs, duck_eggs).
is_contained(dietplanner, eggs, goose_eggs).
is_contained(dietplanner, eggs, egg_whites).
is_contained(dietplanner, dairy, whole_milk).
is_contained(dietplanner, shellfish, lobster).
is_contained(dietplanner, dairy, cheese).

made_of(dietplanner, margherita_pizza, cheese).
made_of(dietplanner, scrambled_eggs, chicken_eggs).
made_of(dietplanner, spaghetti_bolognese, pasta).
made_of(dietplanner, pasta_primavera, pasta).
made_of(dietplanner, caprese_salad, tomato).
made_of(dietplanner, tomato_soup, tomato).
made_of(dietplanner, chicken_caesar_salad, chicken).
made_of(dietplanner, grilled_chicken_burger, chicken).
made_of(dietplanner, fruit_salad, apple).
made_of(dietplanner, mixed_berry_smoothie, blueberries).
made_of(dietplanner, chocolate_mousse, milk_chocolate).
made_of(dietplanner, chocolate_chip_cookies, dark_chocolate).
made_of(dietplanner, veggie_pizza, tomato).
made_of(dietplanner, garden_salad, carrot).
made_of(dietplanner, tuna_sandwich, tuna).
made_of(dietplanner, sushi_roll, tuna).
made_of(dietplanner, beef_stew, beef).
made_of(dietplanner, beef_tacos, beef).