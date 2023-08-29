:- consult('functions.pl').
%:- consult('fact_persons.pl').



compute_diet(Name, Surname, Diet) :-
    find_person_id(Name, Surname, PersonID),
    find_bmi_energy_effort(PersonID, BMI, EnergyValue),
    set_right_number_calories(BMI, EnergyValue, TotalCalories).
    get_activities(PersonID, ActivityList)

%Diet = [Meal1, Meal2],
        
