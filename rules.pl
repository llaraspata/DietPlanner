:- consult('functions.pl').
%:- consult('fact_persons.pl').


:- dynamic (rule/5).


% ---------
% Nutrient distribution
% ---------
% 1. Protein should make up about 10-15% of total calories.
rule(1, daily_diet_total_nutrient_percentage(DailyDiet, protein, TotalPercentage), and([TotalPercentage > 9, TotalPercentage < 16])).

% 2. Carbohydrates should make up about 45-65% of total calories.
rule(2, daily_diet_total_nutrient_percentage(DailyDiet, carbs, TotalPercentage), and([TotalPercentage > 44, TotalPercentage < 46])).

% 3. Lipids should make up about 20-35% of total calories.
rule(3, daily_diet_total_nutrient_percentage(DailyDiet, lipids, TotalPercentage), and([TotalPercentage > 19, TotalPercentage < 36])).

% 4. Dietary Fibers should be 25-30 g per day.
rule(4, daily_diet_total_nutrient_grams(DailyDiet, dietary_fiber, TotalGrams), and([TotalGrams > 24, TotalGrams < 31])).

% 5-6. Sufficient quantity of Vitamins and Minerals is ensured by the presence of fruits and vegetables.
rule(5, count_foodbeverage_in_daily_diet(DailyDiet, fruits_olives, TotalFruit), and([TotalFruit > 1])).
rule(6, count_foodbeverage_in_daily_diet(DailyDiet, vegetables, TotalVegetables), and([TotalVegetables > 2])).












%Diet = [Meal1, Meal2],
        
