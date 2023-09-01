:- consult('instances.pl').
:- use_module(library(lists)).

% Compute the total calories about a list of foods 
compute_calories_amount([], 0).
compute_calories_amount([Food|Rest], TotalCalories) :-
    attribute_value(dietplanner, Food, calories, CaloriesFood),
    compute_calories_amount(Rest, RestCalories),
    TotalCalories is RestCalories + CaloriesFood.

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

name_allergen(Name) :- 
    allergen_instance(dietplanner, allergen, X),
    attribute_value(dietplanner, X, name, Name),
    !.

find_person_id(Name, Surname, PersonID) :-
    person_instance(dietplanner, person, PersonID),
    attribute_value(dietplanner, PersonID, name, Name),
    attribute_value(dietplanner, PersonID, surname, Surname),
    !.
find_person_id(_, _, false).


find_bmi_energy_effort(PersonID, BMIValue, EnergyValue) :-
    attribute_value(dietplanner, PersonID, bmi, BMIValue),
    attribute_value(dietplanner, PersonID, energy_demand, EnergyValue),
    !.

% Ordinamento decrescente in base al secondo parametro
ordered_list(List, OrderedList) :-
    predsort(compare_second_param, List, OrderedList).

% Predicato per confrontare sublist in base al secondo parametro
compare_second_param(Order, Sublist1, Sublist2) :-
    nth0(1, Sublist1, Param1),
    nth0(1, Sublist2, Param2),
    compare(Order, Param2, Param1).

create_week(PersonID, Week) :-
    attribute_value(dietplanner, PersonID, number_day_on, NumeberDayOn),
    create_days_list(7, EmptyDay),
    ordered_list(ActivityList, OrderedList),
    distribute_sorted_activities(OrderedList, EmptyDay, NumeberDayOn, Week).

compute_activity_effort([], 0).
compute_activity_effort([Activity-Duration|Rest], TotalEffort) :-
    attribute_value(dietplanner, Activity, calory_effort, EffortOneHour),
    ActivityEffort is EffortOneHour * Duration,
    compute_activity_effort(Rest, RestEffort),
    TotalEffort is ActivityEffort + RestEffort.

% Compute the total calories effort for a single day
set_right_number_calories(BMI, EnergyValue, [], TotalCalories) :-
    (BMI < 18.49 ->
        TotalCalories is EnergyValue + 300;
    (BMI >= 18.50, BMI =< 24.99) ->
        TotalCalories is EnergyValue;
    BMI > 25.00 ->
        TotalCalories is EnergyValue - 300).
set_right_number_calories(BMI, EnergyValue, [Activity-Duration|Rest], TotalCalories) :-
    attribute_value(dietplanner, Activity, calory_effort, EffortOneHour),
    ActivityEffort is EffortOneHour * Duration,
    set_right_number_calories(BMI, EnergyValue, Rest, RestEffort),
    TotalCalories is ActivityEffort + RestEffort.

get_activities(PersonID, ActivityList) :-
    (   setof([Activity-Hours, Frequency],
                carry_out(PersonID, Activity-Hours, Frequency),
                ActivityList)
        ->  true;   
        ActivityList = []
    ).

flatten_pairs([], []).
flatten_pairs([[X-Y|RestPairs]|RestLists], [X-Y|FlattenedRest]) :-
    flatten_pairs(RestLists, FlattenedRest).



compute_diet(Name, Surname, Diet) :-
    find_person_id(Name, Surname, PersonID),
    find_bmi_energy_effort(PersonID, BMI, EnergyValue),
    get_activities(PersonID, ActivityList),
    set_week(PersonID, ActivityList, Week),
    length(ActivityList, Length),
    (Length =\= 0 -> flatten_pairs(ActivityList, ActivityDurationList); true),
    set_right_number_calories(BMI, EnergyValue, ActivityDurationList, TotalCalories),
    writeln(TotalCalories).








% Predicato per distribuire le attività equamente su 7 giorni
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    DaysPerWeek > 0,
    !,
    create_days_list(7, EmptyList),  % Crea una lista di 7 giorni vuoti
    sort_activity_list(ActivityList, SortedActivityList),  % Ordina la lista di attività per frequenza
    distribute_activities_recursive(DaysPerWeek, SortedActivityList, EmptyList, DistributedList).
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    writeln('Errore: numero di giorni non valido'), 
    fail.

% Predicato per creare una lista di N giorni vuoti
create_days_list(0, []).
create_days_list(N, [[] | Rest]) :-
    N > 0,
    NextN is N - 1,
    create_days_list(NextN, Rest).

% Predicato per ordinare la lista di attività in base alla frequenza (in ordine decrescente)
sort_activity_list(ActivityList, SortedActivityList) :-
    predsort(compare_activity_frequency, ActivityList, SortedActivityList).

% Predicato per confrontare due elementi Activity-Hours, Frequency
compare_activity_frequency(Order, [_, Frequency1], [_, Frequency2]) :-
    compare(Order, Frequency2, Frequency1).

% Predicato per distribuire le attività
distribute_activities_recursive(_, [], DistributedList, DistributedList).  % Tutte le attività sono state distribuite
distribute_activities_recursive(DaysPerWeek, [[Activity-Hours, Frequency] | RestActivities], EmptyList, DistributedList) :-
    distribute_activity(Activity-Hours, Frequency, EmptyList, TempDistributedList),
    distribute_activities_recursive(DaysPerWeek, RestActivities, TempDistributedList, DistributedList).

% Predicato per concatenare due liste di liste
concatenate_lists([], [], []).
concatenate_lists([], RestList, RestList).
concatenate_lists(List, [], List).
concatenate_lists([H1 | T1], [H2 | T2], [Result | RestResult]) :-
    append(H1, H2, Result),
    concatenate_lists(T1, T2, RestResult).

% Predicato per distribuire un'attività in base alle ore su una lista di giorni
distribute_activity(_, 0, DaysList, DaysList).
distribute_activity(ActivityHours, Frequency, [Day | RestDays], DistributedList) :-
    Frequency > 0,
    append(Day, [ActivityHours], NewDay),
    NewFrequency is Frequency - 1,
    distribute_activity(ActivityHours, NewFrequency, RestDays, RestDistributedList),
    !,
    append([NewDay], RestDistributedList, DistributedList).
distribute_activity(_, 0, DaysList, DaysList).
