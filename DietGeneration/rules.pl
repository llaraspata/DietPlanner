:- consult('functions.pl').
%:- consult('fact_persons.pl').


:- dynamic (rule/5).


% ---------
% Nutrient distribution
% ---------
% a. Protein should make up about 10-15% of total calories.
% b. Carbohydrates should make up about 45-65% of total calories.
% c. Lipids should make up about 20-35% of total calories.
% d. Dietary Fibers should be 25-30 g per day.
% e-f. Sufficient quantity of Vitamins and Minerals is ensured by the presence of fruits and vegetables.
rule(1, suggested_diet(Person, Diet), and([
            check_macronutrient_percentage(DailyDiet, protein, 10, 15),
            check_macronutrient_percentage(DailyDiet, carbs, 45, 65),
            check_macronutrient_percentage(DailyDiet, lipids, 20, 35),
            check_macronutrient_grams(DailyDiet, dietary_fiber, 25, 30),
            ]))


% 5-6. Sufficient quantity of Vitamins and Minerals is ensured by the presence of fruits and vegetables.
rule(5, count_foodbeverage_in_daily_diet(DailyDiet, fruits_olives, TotalFruit), and([TotalFruit > 1])).
rule(6, count_foodbeverage_in_daily_diet(DailyDiet, vegetables, TotalVegetables), and([TotalVegetables > 2])).


% ---------
% Allergies
% ---------
% 7. Food and Beverages containing allergens at which the person is allergic cannot be included in a daily diet

