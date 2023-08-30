:- consult('functions.pl').
%:- consult('fact_persons.pl').


:- dynamic (rule/5).


% ---------
% Nutrient distribution
% ---------
% 1. Protein should make up about 10-15% of total calories.

% 2. Carbohydrates should make up about 45-65% of total calories.

% 3. Lipids should make up about 20-35% of total calories.

% 4. Dietary Fibers should be 25-30 g per day.










compute_diet(Name, Surname, Diet) :-
    find_person_id(Name, Surname, PersonID),
    find_bmi_energy_effort(PersonID, BMI, EnergyValue),
    set_right_number_calories(BMI, EnergyValue, TotalCalories).
    get_activities(PersonID, ActivityList)

%Diet = [Meal1, Meal2],
        
