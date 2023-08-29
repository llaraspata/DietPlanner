:- consult('functions.pl').
%:- consult('fact_persons.pl').

find_person_id(Name, Surname, PersonID) :-
    person_instance(dietplanner, person, PersonID),
    attribute_value(dietplanner, PersonID, name, Name),
    attribute_value(dietplanner, PersonID, surname, Surname),
    !.

find_person_id(_, _, null).

%Diet = [Meal1, Meal2],
        
