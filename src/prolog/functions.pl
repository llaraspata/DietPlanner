predsort(P, L, R) :-
	length(L, N),
	predsort(P, N, L, _, R1), !,
	R = R1.

predsort(P, 2, [X1, X2|L], L, R) :- !,
	call(P, Delta, X1, X2),
	sort2(Delta, X1, X2, R).
predsort(_, 1, [X|L], L, [X]) :- !.
predsort(_, 0, L, L, []) :- !.
predsort(P, N, L1, L3, R) :-
	N1 is N // 2,
	plus(N1, N2, N),
	predsort(P, N1, L1, L2, R1),
	predsort(P, N2, L2, L3, R2),
	predmerge(P, R1, R2, R).

sort2(<, X1, X2, [X1, X2]).
sort2(=, X1, _,  [X1]).
sort2(>, X1, X2, [X2, X1]).

predmerge(_, [], R, R) :- !.
predmerge(_, R, [], R) :- !.
predmerge(P, [H1|T1], [H2|T2], Result) :-
	call(P, Delta, H1, H2),
	predmerge(Delta, P, H1, H2, T1, T2, Result).

predmerge(>, P, H1, H2, T1, T2, [H2|R]) :-
	predmerge(P, [H1|T1], T2, R).
predmerge(=, P, H1, _, T1, T2, [H1|R]) :-
	predmerge(P, T1, T2, R).
predmerge(<, P, H1, H2, T1, T2, [H1|R]) :-
	predmerge(P, T1, [H2|T2], R).

%%	append(+ListOfLists, ?List)
%
%	Concatenate a list of lists.  Is  true   if  Lists  is a list of
%	lists, and List is the concatenation of these lists.
%
%	@param	ListOfLists must be a list of -possibly- partial lists

append(ListOfLists, List) :-
%	must_be(list, ListOfLists),
	append_(ListOfLists, List).

append_([], []).
append_([L|Ls], As) :-
	append(L, Ws, As),
	append_(Ls, Ws).


%   delete(List, Elem, Residue)
%   is true when List is a list, in which Elem may or may not occur, and
%   Residue is a copy of List with all elements identical to Elem deleted.

delete([], _, []).
delete([Head|List], Elem, Residue) :-
	Head == Elem, !,
	delete(List, Elem, Residue).
delete([Head|List], Elem, [Head|Residue]) :-
	delete(List, Elem, Residue).


%   last(List, Last)
%   is true when List is a List and Last is identical to its last element.
%   This could be defined as last(L, X) :- append(_, [X], L).

last([H|List], Last) :-
	last(List, H, Last).

last([], Last, Last).
last([H|List], _, Last) :-
	last(List, H, Last).

%   nextto(X, Y, List)
%   is true when X and Y appear side-by-side in List.  It could be written as
%	nextto(X, Y, List) :- append(_, [X,Y,_], List).
%   It may be used to enumerate successive pairs from the list.

nextto(X,Y, [X,Y|_]).
nextto(X,Y, [_|List]) :-
	nextto(X,Y, List).

%   nth0(?N, +List, ?Elem) is true when Elem is the Nth member of List,
%   counting the first as element 0.  (That is, throw away the first
%   N elements and unify Elem with the next.)  It can only be used to
%   select a particular element given the list and index.  For that
%   task it is more efficient than nmember.
%   nth(+N, +List, ?Elem) is the same as nth0, except that it counts from
%   1, that is nth(1, [H|_], H).

nth0(V, In, Element) :- var(V), !,
	generate_nth(0, V, In, Element).
nth0(0, [Head|_], Head) :- !.
nth0(N, [_|Tail], Elem) :-
	M is N-1,
	find_nth0(M, Tail, Elem).

find_nth0(0, [Head|_], Head) :- !.
find_nth0(N, [_|Tail], Elem) :-
	M is N-1,
	find_nth0(M, Tail, Elem).


nth1(V, In, Element) :- var(V), !,
	generate_nth(1, V, In, Element).
nth1(1, [Head|_], Head) :- !.
nth1(N, [_|Tail], Elem) :-
	nonvar(N), !,
	M is N-1,			% should be succ(M, N)
	find_nth(M, Tail, Elem).

nth(V, In, Element) :- var(V), !,
	generate_nth(1, V, In, Element).
nth(1, [Head|_], Head) :- !.
nth(N, [_|Tail], Elem) :-
	nonvar(N), !,
	M is N-1,			% should be succ(M, N)
	find_nth(M, Tail, Elem).

find_nth(1, [Head|_], Head) :- !.
find_nth(N, [_|Tail], Elem) :-
	M is N-1,
	find_nth(M, Tail, Elem).


generate_nth(I, I, [Head|_], Head).
generate_nth(I, IN, [_|List], El) :-
	I1 is I+1,
	generate_nth(I1, IN, List, El).



%   nth0(+N, ?List, ?Elem, ?Rest) unifies Elem with the Nth element of List,
%   counting from 0, and Rest with the other elements.  It can be used
%   to select the Nth element of List (yielding Elem and Rest), or to
%   insert Elem before the Nth (counting from 1) element of Rest, when
%   it yields List, e.g. nth0(2, List, c, [a,b,d,e]) unifies List with
%   [a,b,c,d,e].  nth is the same except that it counts from 1.  nth
%   can be used to insert Elem after the Nth element of Rest.

nth0(V, In, Element, Tail) :- var(V), !,
	generate_nth(0, V, In, Element, Tail).
nth0(0, [Head|Tail], Head, Tail) :- !.
nth0(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	nth0(M, Tail, Elem, Rest).

find_nth0(0, [Head|Tail], Head, Tail) :- !.
find_nth0(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	find_nth0(M, Tail, Elem, Rest).



nth1(V, In, Element, Tail) :- var(V), !,
	generate_nth(1, V, In, Element, Tail).
nth1(1, [Head|Tail], Head, Tail) :- !.
nth1(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	nth1(M, Tail, Elem, Rest).

nth(V, In, Element, Tail) :- var(V), !,
	generate_nth(1, V, In, Element, Tail).
nth(1, [Head|Tail], Head, Tail) :- !.
nth(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	nth(M, Tail, Elem, Rest).

find_nth(1, [Head|Tail], Head, Tail) :- !.
find_nth(N, [Head|Tail], Elem, [Head|Rest]) :-
	M is N-1,
	find_nth(M, Tail, Elem, Rest).


generate_nth(I, I, [Head|Tail], Head, Tail).
generate_nth(I, IN, [E|List], El, [E|Tail]) :-
	I1 is I+1,
	generate_nth(I1, IN, List, El, Tail).



%   permutation(List, Perm)
%   is true when List and Perm are permutations of each other.  Of course,
%   if you just want to test that, the best way is to keysort/2 the two
%   lists and see if the results are the same.  Or you could use list_to_bag
%   (from BagUtl.Pl) to see if they convert to the same bag.  The point of
%   perm is to generate permutations.  The arguments may be either way round,
%   the only effect will be the order in which the permutations are tried.
%   Be careful: this is quite efficient, but the number of permutations of an
%   N-element list is N!, even for a 7-element list that is 5040.

permutation([], []).
permutation(List, [First|Perm]) :-
	select(First, List, Rest),	%  tries each List element in turn
	permutation(Rest, Perm).


% prefix(Part, Whole) iff Part is a leading substring of Whole

prefix([], _).
prefix([Elem | Rest_of_part], [Elem | Rest_of_whole]) :-
  prefix(Rest_of_part, Rest_of_whole).

%   remove_duplicates(List, Pruned)
%   removes duplicated elements from List.  Beware: if the List has
%   non-ground elements, the result may surprise you.

remove_duplicates([], []).
remove_duplicates([Elem|L], [Elem|NL]) :-
	delete(L, Elem, Temp),
	remove_duplicates(Temp, NL).

%   reverse(List, Reversed)
%   is true when List and Reversed are lists with the same elements
%   but in opposite orders.  rev/2 is a synonym for reverse/2.

reverse(List, Reversed) :-
	reverse(List, [], Reversed).

reverse([], Reversed, Reversed).
reverse([Head|Tail], Sofar, Reversed) :-
	reverse(Tail, [Head|Sofar], Reversed).


%   same_length(?List1, ?List2)
%   is true when List1 and List2 are both lists and have the same number
%   of elements.  No relation between the values of their elements is
%   implied.
%   Modes same_length(-,+) and same_length(+,-) generate either list given
%   the other; mode same_length(-,-) generates two lists of the same length,
%   in which case the arguments will be bound to lists of length 0, 1, 2, ...

same_length([], []).
same_length([_|List1], [_|List2]) :-
	same_length(List1, List2).

%%      selectchk(+Elem, +List, -Rest) is semidet.
%
%       Semi-deterministic removal of first element in List that unifies
%       Elem.

selectchk(Elem, List, Rest) :-
        select(Elem, List, Rest0), !,
        Rest = Rest0.


%   select(?Element, ?Set, ?Residue)
%   is true when Set is a list, Element occurs in Set, and Residue is
%   everything in Set except Element (things stay in the same order).

select(Element, [Element|Rest], Rest).
select(Element, [Head|Tail], [Head|Rest]) :-
	select(Element, Tail, Rest).


%   sublist(Sublist, List)
%   is true when both append(_,Sublist,S) and append(S,_,List) hold.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%	sublist(?Sub, +List) is nondet.
%
%	True if all elements of Sub appear in List in the same order.

sublist(L, L).
sublist(Sub, [H|T]) :-
	'$sublist1'(T, H, Sub).

'$sublist1'(Sub, _, Sub).
'$sublist1'([H|T], _, Sub) :-
	'$sublist1'(T, H, Sub).
'$sublist1'([H|T], X, [X|Sub]) :-
	'$sublist1'(T, H, Sub).

%   substitute(X, XList, Y, YList)
%   is true when XList and YList only differ in that the elements X in XList
%   are replaced by elements Y in the YList.
substitute(X, XList, Y, YList) :-
	substitute2(XList, X, Y, YList).

substitute2([], _, _, []).
substitute2([X0|XList], X, Y, [Y|YList]) :-
	X == X0, !,
	substitute2(XList, X, Y, YList).
substitute2([X0|XList], X, Y, [X0|YList]) :-
	substitute2(XList, X, Y, YList).

%   suffix(Suffix, List)
%   holds when append(_,Suffix,List) holds.
suffix(Suffix, Suffix).
suffix(Suffix, [_|List]) :-
	suffix(Suffix,List).

%   sumlist(Numbers, Total)
%   is true when Numbers is a list of integers, and Total is their sum.

sumlist(Numbers, Total) :-
	sumlist(Numbers, 0, Total).

sum_list(Numbers, SoFar, Total) :-
	sumlist(Numbers, SoFar, Total).

sum_list(Numbers, Total) :-
	sumlist(Numbers, 0, Total).

sumlist([], Total, Total).
sumlist([Head|Tail], Sofar, Total) :-
	Next is Sofar+Head,
	sumlist(Tail, Next, Total).


%   list_concat(Lists, List)
%   is true when Lists is a list of lists, and List is the
%   concatenation of these lists.

list_concat([], []).
list_concat([H|T], L) :-
	list_concat(H, L, Li),
	list_concat(T, Li).

list_concat([], L, L).
list_concat([H|T], [H|Lf], Li) :-
	list_concat(T, Lf, Li).



%
% flatten a list
%
flatten(X,Y) :- flatten_list(X,Y,[]).

flatten_list(V) --> {var(V)}, !, [V].
flatten_list([]) --> !.
flatten_list([H|T]) --> !, flatten_list(H),flatten_list(T).
flatten_list(H) --> [H].

max_list([H|L],Max) :-
	max_list(L,H,Max).

max_list([],Max,Max).
max_list([H|L],Max0,Max) :-
	(
	  H > Max0
	->
	  max_list(L,H,Max)
	;
	  max_list(L,Max0,Max)
	).

min_list([H|L],Max) :-
	min_list(L,H,Max).

min_list([],Max,Max).
min_list([H|L],Max0,Max) :-
	(
	  H < Max0
	->
	  min_list(L, H, Max)
	;
	  min_list(L, Max0, Max)
	).

%%      numlist(+Low, +High, -List) is semidet.
%
%       List is a list [Low, Low+1, ... High].  Fails if High < Low.%
%
%       @error type_error(integer, Low)
%       @error type_error(integer, High)

numlist(L, U, Ns) :-
        must_be(integer, L),
        must_be(integer, U),
        L =< U,
        numlist_(L, U, Ns).

numlist_(U, U, OUT) :- !, OUT = [U].
numlist_(L, U, [L|Ns]) :-
        succ(L, L2),
        numlist_(L2, U, Ns).


% copied from SWI lists library.
intersection([], _, []) :- !.
intersection([X|T], L, Intersect) :-
	memberchk(X, L), !,
	Intersect = [X|R],
	intersection(T, L, R).
intersection([_|T], L, R) :-
	intersection(T, L, R).

%%	subtract(+Set, +Delete, -Result) is det.
%
%	Delete all elements from `Set' that   occur  in `Delete' (a set)
%	and unify the  result  with  `Result'.   Deletion  is  based  on
%	unification using memberchk/2. The complexity is |Delete|*|Set|.
%
%	@see ord_subtract/3.

subtract([], _, []) :- !.
subtract([E|T], D, R) :-
	memberchk(E, D), !,
	subtract(T, D, R).
subtract([H|T], D, [H|R]) :-
	subtract(T, D, R).

% ---------
% Libraries
% ---------
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(random)).


% ---------
% Constants
% ---------
% Harris-Benedict equation
male_bmr_weight_factor(13.75).
male_bmr_height_factor(5.003).
male_bmr_age_factor(6.75).
male_bmr_constant(66.5).
female_bmr_weight_factor(9.563).
female_bmr_height_factor(1.850).
female_bmr_age_factor(4.676).
female_bmr_constant(655.1).

% TODO: comment
dish_types([breakfast, snack, lunch, snack, dinner]).
daily_diet_names([daily_diet1, daily_diet2, daily_diet3, daily_diet4, daily_diet5, daily_diet6, daily_diet7]).

% Checks on generated Daily Diet based on diet type
healthy_weight_nutrient_percentages([carbs-40-55, protein-20-30, lipids-20-30, dietary_fiber-1-5]).
hyperproteic_nutrient_percentages([carbs-20-30, protein-40-55, lipids-20-30, dietary_fiber-1-5]).



% ---------
% Utilities
% ---------
% Sort a given list w.r.t. the second input parameter
ordered_list(List, OrderedList) :-
    predsort(compare_second_param, List, OrderedList).

% Compare a sublist w.r.t the second input parameter
compare_second_param(Order, Sublist1, Sublist2) :-
    nth0(1, Sublist1, Param1),
    nth0(1, Sublist2, Param2),
    compare(Order, Param2, Param1).

order_list_by_values(Values, Keys, OrderedList) :-
    map_list(Values, Keys, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, DescSortedPairs),
    reverse(DescSortedPairs, OrderedList).

map_list([], [], []).
map_list([Value|Values], [Key|Keys], [Value-Key|Rest]) :-
    map_list(Values, Keys, Rest).

flatten_list([], []).
flatten_list([H|T], FlatList) :-
    flatten_list(T, NewFlatList),
    append(H, NewFlatList, FlatList).

% Predicato per confrontare due elementi [_, Value1] e [_, Value2]
compare_values(Order, [_, Value1], [_, Value2]) :-
    compare(Order, Value2, Value1).

% Creates an empty list of N elements/days
create_days_list(0, []) :- !.
create_days_list(N, [[] | Rest]) :-
    N > 0,
    NextN is N - 1,
    create_days_list(NextN, Rest).

% Given a list, where each element is a list, returns the index of the shortest element (among the first and the n-th elements).
find_shortest_list_index(Lists, N, Index) :-
    (   Lists = []
    ->  Index = 1  
    ;   find_shortest_list_index(Lists, N, 1, 9999, -1, Index)
    ).
% After analyzing all elements within the given list, returns the index of the shortest one
find_shortest_list_index(_, 0, _, _, ShortestIndex, ShortestIndex).
find_shortest_list_index([List|Rest], N, Index, CurrentMinLength, ShortestIndex, ResultIndex) :-
    length(List, Length),
    (Length < CurrentMinLength ->
        NewShortestIndex is Index,
        NewMinLength is Length
    ;
        NewShortestIndex is ShortestIndex,
        NewMinLength is CurrentMinLength
    ),
    NewN is N - 1,
    NextIndex is Index + 1,
    find_shortest_list_index(Rest, NewN, NextIndex, NewMinLength, NewShortestIndex, ResultIndex).

% Given a list of lists, adds an element to the shortest element.
add_element_to_shortest(List, _, 0, List). 
add_element_to_shortest(List, Element, Max, Result) :-
    find_shortest_list_index(List, Max, ShortestIndex),
    nth1(ShortestIndex, List, ElementList),
    append(ElementList, [Element], NewShortestList),
    replace_list(List, ShortestIndex, NewShortestList, Result).

% Given a list of lists and a specifed index, replaces a list with a new one
replace_list(OriginalList, Index, NewList, ResultList) :-
    replace_list_helper(OriginalList, Index, NewList, 1, ResultList).

% The original list is empty
replace_list_helper([], _, _, _, []).
% The given element is the list to be substitued
replace_list_helper([_|Rest], Index, NewList, Index, [NewList|RestResult]) :-
    NextIndex is Index + 1,
    replace_list_helper(Rest, Index, NewList, NextIndex, RestResult).
% The given element is not the list to be substitued
replace_list_helper([X|Rest], Index, NewList, CurrIndex, [X|RestResult]) :-
    CurrIndex \= Index,
    NextIndex is CurrIndex + 1,
    replace_list_helper(Rest, Index, NewList, NextIndex, RestResult).

% Process the file's content and find specific instances
read_relationships(ListRelationships) :-
    findall(has(DailyDiet, Dish, IngredientsList), has(DailyDiet, Dish, IngredientsList), ListRelationships).

% Process the file's content and find specific instances
read_diet(ListRelationships) :-
    findall(DailyDiet-Dish-IngredientsList, has(DailyDiet, Dish, IngredientsList), DailyDietList), 
    add_dish_type(DailyDietList, [], ListRelationships).

add_dish_type([], ListRelationships, ListRelationships).
add_dish_type([DailyDiet-Dish-IngredientsList | Rest], Acc, ListRelationships) :-
    !,
    attribute_value(dietplanner, Dish, type, DishType),
    append(Acc, [DailyDiet-DishType-Dish-IngredientsList], NewAcc),
    !,
    add_dish_type(Rest, NewAcc, ListRelationships).

select_elements_with_pattern([], _, []).
select_elements_with_pattern([Element | Rest], Pattern, [Element | RestSelected]) :-
    Element =.. [has, FirstArg | _], 
    FirstArg = Pattern,
    !,
    select_elements_with_pattern(Rest, Pattern, RestSelected).
select_elements_with_pattern([_ | Rest], Pattern, SelectedElements) :-
    select_elements_with_pattern(Rest, Pattern, SelectedElements).

get_list_relationships(DailyDiet, ListRelationships) :-
    read_relationships(TotalList),   
    !,
    select_elements_with_pattern(TotalList, DailyDiet, ListRelationships).

% ---------
% Calories
% ---------
% Gets the standard calories amount in a given Food or Beverage
standard_calories_quantity(FoodBeverage, Quantity) :-
    attribute_value(dietplanner, FoodBeverage, calories, Quantity).

% Convert the calories content to the actual quantity in the given portion size
actual_calories_quantity(FoodBeverage, PortionSizeGrams, ActualQuantity) :-
    standard_calories_quantity(FoodBeverage, QuantityPer100),
    ActualQuantity is (PortionSizeGrams / 100) * QuantityPer100.

% TODO: comment
set_calories_week([], _, _, []).
set_calories_week([Day|Rest], BMI, EnergyValue, [TotalCalories|Tail]) :-
    set_right_number_calories(BMI, EnergyValue, ActivityDurationList, BaseCalories),
    set_calories_day(Day, BMI, TotalEffort),
    TotalCalories is TotalEffort + BaseCalories,
    !,
    set_calories_week(Rest, BMI, EnergyValue, Tail).

% TODO: comment
set_calories_day([], _, 0).
set_calories_day([Activity-Duration|Rest], BMI, TotalEffort) :-
    attribute_value(dietplanner, Activity, calory_effort, EffortOneHour),
    (   BMI < 18.49 ->
        Param is 90
    ;   (BMI >= 18.50, BMI =< 24.99) ->
        Param is 80
    ;   BMI > 25.00 ->
        Param is 70
    ),
    ActivityEffort is (EffortOneHour * Duration * Param) / 100,
    set_calories_day(Rest, BMI, RestEffort),
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

% Generates a list with the maximum amount of calories per days
generate_list_calories_week(PersonID, TotalCaloriesList) :-
    find_bmi_energyeffort_dayon(PersonID, BMI, EnergyValue, NumberDayOn),
    get_activities(PersonID, ActivityList),
    length(ActivityList, Length),
    (Length =\= 0 -> 
        distribute_activities(NumberDayOn, ActivityList, DistributedList)
    ; 
        create_days_list(7, DistributedList)),
    set_calories_week(DistributedList, BMI, EnergyValue, TotalCaloriesList).

% Given the daily amount of calories, distributes them among meals
get_daily_diet_calories(TotalDayCalories, DailyCalories) :-
    BreakfastCalories is TotalDayCalories * 0.20,
    MorningSnackCalories is TotalDayCalories * 0.08,
    LunchCalories is TotalDayCalories * 0.40,
    AfternoonSnackCalories is TotalDayCalories * 0.08,
    DinnerCalories is TotalDayCalories * 0.24,
    DailyCalories = [BreakfastCalories, MorningSnackCalories, LunchCalories, AfternoonSnackCalories, DinnerCalories].

% Given a list of ingredients for a dish, computes its actual calories amount
compute_actual_dish_calories([], ActualCalories, ActualCalories).
compute_actual_dish_calories([FoodBeverage-Grams | Rest], PartialCalories, ActualCalories) :-
    actual_calories_quantity(FoodBeverage, Grams, Calories),
    NewPartialCalories is PartialCalories + Calories,
    compute_actual_dish_calories(Rest, NewPartialCalories, ActualCalories).


% ---------
% Nutrient
% ---------
% Convert the nutrient content to the actual quantity in the given portion size
actual_nutrient_quantity(FoodBeverage, Nutrient, PortionSizeGrams, ActualQuantity) :-
    has_nutrient(FoodBeverage, Nutrient, NutrientContentPer100),
    ActualQuantity is (PortionSizeGrams / 100) * NutrientContentPer100.

% Calculate cumulative nutrient quantity for a specified macro nutrient category
cumulative_macro_nutrient_quantity(FoodGramsList, MacroNutrient, CumulativeQuantity) :-
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    cumulative_macro_nutrient_quantity(FoodGramsList, Nutrients, 0, CumulativeQuantity).
% Base case: When no nutrients are left to process, the cumulative quantity is 0.
cumulative_macro_nutrient_quantity(_, [], CumulativeQuantity, CumulativeQuantity).
% Recursive case: Calculate the cumulative quantity for the first nutrient in the category.
cumulative_macro_nutrient_quantity(FoodGramsList, [Nutrient|Rest], PartialCumulativeQuantity, CumulativeQuantity) :-
    cumulative_nutrient_quantity(FoodGramsList, Nutrient, NutrientQuantity),
    NewPartialCumulativeQuantity is PartialCumulativeQuantity + NutrientQuantity,
    cumulative_macro_nutrient_quantity(FoodGramsList, Rest, NewPartialCumulativeQuantity, CumulativeQuantity).

% Calculate the cumulative quantity of a specific nutrient in a list of food-grams pairs.
cumulative_nutrient_quantity(FoodGramsList, Nutrient, CumulativeQuantity) :-
    compute_nutrient_quantity(FoodGramsList, Nutrient, 0, CumulativeQuantity).
% Base case: When the list is empty, the cumulative quantity is 0.
compute_nutrient_quantity([], _, CumulativeQuantity, CumulativeQuantity).
% Recursive case: Calculate the cumulative quantity for the first pair in the list.
compute_nutrient_quantity([FoodBeverage-Grams|Rest], Nutrient, PartialCumulativeQuantity, CumulativeQuantity) :-
    % Check if the food item has the specified nutrient.
    (has_nutrient(FoodBeverage, Nutrient, NutrientPer100g) ->
        % Calculate the nutrient quantity for this food item and add it to the partial cumulative quantity.
        actual_nutrient_quantity(FoodBeverage, Nutrient, Grams, NutrientQuantity),
        NewPartialCumulativeQuantity is PartialCumulativeQuantity + NutrientQuantity
    ;
        % If the food item does not have the specified nutrient, leave the cumulative quantity unchanged.
        NewPartialCumulativeQuantity = PartialCumulativeQuantity
    ),
    % Recursively process the rest of the list.
    compute_nutrient_quantity(Rest, Nutrient, NewPartialCumulativeQuantity, CumulativeQuantity).

% Helper predicate to accumulate micronutrient from a list
accumulate_micronutrient_content_from_list([], FinalContentFoodList, FinalContentFoodList).
accumulate_micronutrient_content_from_list([Content-Food-Grams|Rest], Acc, FinalContentFoodList) :-
    % Check if the micronutrient is already in the accumulated list
    (member(ExistingContent-Food-Grams, Acc) ->
        NewContent is ExistingContent + Content,
        select(ExistingContent-Food-Grams, Acc, TempAcc), % Remove the old entry
        append(TempAcc, [NewContent-Food-Grams], UpdatedAcc)
    ;
        append(Acc, [Content-Food-Grams], UpdatedAcc)
    ),
    accumulate_micronutrient_content_from_list(Rest, UpdatedAcc, FinalContentFoodList),
    !.

% ---------
% Allergen
% ---------
collect_allergen_names(Names) :-
    findall(Name, allergen_instance(_, _, Name), Names).

% Get person's allergies
get_person_allergies(Person, Allergies) :-
    findall(Allergen, is_allergic(Person, Allergen), Allergies).

% ---------
% Activities
% ---------
% Gets a list of activity names
collect_activities_names(Names) :-
    findall(Name, activity_instance(_, _, Name), Names).

% Gets the list of activities carried out of a given person
get_activities(PersonID, ActivityList) :-
    (   setof([Activity-Hours, Frequency],
                carry_out(PersonID, Activity-Hours, Frequency),
                ActivityList)
        ->  true;   
        ActivityList = []
    ).

% Equally distribuites the activities over 7 days
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    DaysPerWeek > 0,
    !,
    % Create an empty list for 7 days
    create_days_list(7, EmptyList),  
    % Sort the activity list w.r.t. their frequency
    sort_activity_list(ActivityList, SortedActivityList),  
    !,
    distribute_activities_recursive(DaysPerWeek, SortedActivityList, EmptyList, DistributedList).
distribute_activities(DaysPerWeek, ActivityList, DistributedList) :-
    fail.

% Sort the activity list without removing duplicates
sort_activity_list(ActivityList, SortedActivityList) :-
    predsort(compare_activity_frequency, ActivityList, SortedActivityList).

% Compare two activity frequencies
compare_activity_frequency(Order, [_, Frequency1], [_, Frequency2]) :-
    compare(OrderFreq, Frequency2, Frequency1),
    (OrderFreq = (=) -> compare(OrderName, [_, Name1], [_, Name2]), Order = OrderName ; Order = OrderFreq).

% Distributes the activities
distribute_activities_recursive(_, [], DistributedList, DistributedList). 
distribute_activities_recursive(DaysPerWeek, [[Activity-Hours, Frequency] | RestActivities], EmptyList, DistributedList) :-
    distribute_activity(Activity-Hours, Frequency, DaysPerWeek, EmptyList, TempDistributedList),
    distribute_activities_recursive(DaysPerWeek, RestActivities, TempDistributedList, DistributedList).

% Distributes an activity according to hours and a list of days
distribute_activity(_, 0, _, DaysList, DaysList).
distribute_activity(ActivityHours, Frequency, DaysPerWeek, [Day | RestDays], DistributedList) :-
    Frequency > 0,
    add_element_to_shortest([Day | RestDays], ActivityHours, DaysPerWeek, TempDistributedList),
    NewFrequency is Frequency - 1,
    distribute_activity(ActivityHours, NewFrequency, DaysPerWeek, TempDistributedList, DistributedList),
    !.
distribute_activity(_, Frequency, DaysPerWeek, [Day | RestDays], DistributedList) :-
    Frequency > 0,
    distribute_activity(0, Frequency, DaysPerWeek, RestDays, DistributedList).

% TODO: comment
create_week(PersonID, Week) :-
    attribute_value(dietplanner, PersonID, number_day_on, NumeberDayOn),
    create_days_list(7, EmptyDay),
    ordered_list(ActivityList, OrderedList),
    distribute_sorted_activities(OrderedList, EmptyDay, NumeberDayOn, Week).


% ---------
% Person
% ---------
% Get the id of a person given his/her name and surname
find_person_id(Name, Surname, PersonID) :-
    person_instance(dietplanner, person, PersonID),
    attribute_value(dietplanner, PersonID, name, Name),
    attribute_value(dietplanner, PersonID, surname, Surname),
    !.
find_person_id(_, _, false).

% Compute Needed Calories for a Person (basal metabolism)
compute_needed_calories(Person, NeededCalories) :-
    % Get the person's data
    attribute_value(dietplanner, Person, name, PersonName),
    attribute_value(dietplanner, Person, name, PersonSurname),
    attribute_value(dietplanner, Person, age, Age),
    attribute_value(dietplanner, Person, gender, Gender),
    attribute_value(dietplanner, Person, height, Height),
    attribute_value(dietplanner, Person, weight, Weight),
    
    % Load constants according to person's gender
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

    % Compute needed calories
    BMR is Constant + (WeightFactor * Weight) + (HeightFactor * Height) - (AgeFactor * Age),
    NeededCalories is BMR.

% TODO: comment
find_bmi_energyeffort_dayon(PersonID, BMIValue, EnergyValue, NumberDayOn) :-
    attribute_value(dietplanner, PersonID, bmi, BMIValue),
    attribute_value(dietplanner, PersonID, energy_demand, EnergyValue),
    attribute_value(dietplanner, PersonID, number_day_on, NumberDayOn),
    !.


% ---------
% Dish
% ---------
% Get the list of ingredients in a dish of a daily diet as a flat list
get_ingredients_in_dish(ListRelationships, Dish, Ingredients) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, Dishes), % Get the list of dishes
    select_ingredients(IngredientLists, Dishes, Dish, Ingredients),
    !.

select_ingredients([], [], _, []).
select_ingredients([Head|Tail], [First|Rest], Dish, Ingredients) :-
    (
        First = Dish ->
            Ingredients = Head,
            !
        ;
        select_ingredients(Tail, Rest, Dish, Ingredients)
    ).
    

% Get unique ingredients and cumulative quantities for a daily diet
unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients) :-
    get_list_relationships(DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, _, [], _, Dishes), % Get the list of dishes
    remove_duplicates(Dishes, FinalDishes),
    accumulate_ingredients(ListRelationships, FinalDishes, [], UniqueIngredients).

% Helper predicate to accumulate ingredients from a list of dishes
accumulate_ingredients(_, [], Acc, Acc).
accumulate_ingredients(ListRelationships, [Dish|Rest], Acc, UniqueIngredients) :-
    get_ingredients_in_dish(ListRelationships, Dish, Ingredients), % Get ingredients in the dish
    accumulate_ingredients(ListRelationships, Rest, Acc, UpdatedAcc),
    accumulate_ingredients_from_list(Ingredients, UpdatedAcc, UniqueIngredients).

% Helper predicate to accumulate ingredients from a list
accumulate_ingredients_from_list([], Acc, Acc).
accumulate_ingredients_from_list([Ingredient-Quantity|Rest], Acc, UniqueIngredients) :-
    % Check if the ingredient is already in the accumulated list
    (member(Ingredient-ExistingQuantity, Acc) ->
        NewQuantity is ExistingQuantity + Quantity,
        select(Ingredient-ExistingQuantity, Acc, TempAcc), % Remove the old entry
        append(TempAcc, [Ingredient-NewQuantity], UpdatedAcc)
    ;
        append(Acc, [Ingredient-Quantity], UpdatedAcc)
    ),
    accumulate_ingredients_from_list(Rest, UpdatedAcc, UniqueIngredients).

% Get the list of ingredients in a dish of a daily diet as a flat list
get_foodbeverages_in_dish(Dish, FoodBeverageList) :-
    findall(FoodBeverage, made_of(Dish, FoodBeverage, _, _), FoodBeverageListWithDuplicates),
    remove_duplicates(FoodBeverageListWithDuplicates, FoodBeverageList).

% Define a predicate to get dishes whose ingredients do not contain a list of allergens
get_dishes_without_allergens(Allergens, DishType, DishesWithoutAllergens) :-
    findall(Dish, (
        dish_instance(dietplanner, dish, Dish),  % Get all dishes
        \+ dish_contains_allergens(Dish, Allergens),  % Check if dish contains allergens
        attribute_value(dietplanner, Dish, type, DishType)
    ), DishesWithoutAllergens).

% Define a predicate to check if a dish contains allergens
dish_contains_allergens(Dish, Allergens) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    member(FoodBeverage, FoodBeverageList),
    is_contained(Allergen, FoodBeverage),
    member(Allergen, Allergens).

% Get dishes whose ingredients don't contain allergens a specific person is allergic to
get_dishes_without_allergens_for_person(Person, DishType, DishesWithoutAllergens) :-
    get_person_allergies(Person, Allergies),
    get_dishes_without_allergens(Allergies, DishType, DishesWithoutAllergens).

% Get a random dish from a list of candidate dishes
get_random_dish_in_list(DishList, Dish) :-
    length(DishList, Length),
    random(1, Length, Index),
    nth(Index, DishList, Dish).

% Given a person, returns the list of dishes excluding those containing allergens the person is allergic to
get_daily_diet_dishes(_, [], DailyDietDishes, DailyDietDishes).
get_daily_diet_dishes(Person, [DishType | Rest], Acc, DailyDietDishes) :-
    get_dishes_without_allergens_for_person(Person, DishType, DishList),
    get_random_dish_in_list(DishList, Dish),
    append(Acc, [Dish], NewAcc),
    get_daily_diet_dishes(Person, Rest, NewAcc, DailyDietDishes).

get_old_new_ingredient_list_by_nutrient(DailyDiet, [Head|Tail], Fix, MacroNutrient, OldRel, NewRel) :-
    has(DailyDiet, Head, IngredientsList),
    find_ingredients_sorted_by_nutrient(IngredientsList, MacroNutrient, OrderedList),
    dif(OrderedList, []),
    change_ingredient_grams(Head, OrderedList, Fix, [], TempIngredientList),
    IngredientsList \== TempIngredientList,
    OldRel = IngredientsList, 
    NewRel = TempIngredientList,
    !.
get_old_new_ingredient_list_by_nutrient(DailyDiet, [_|Tail], Fix, MacroNutrient, OldIngredientList, NewIngredientList) :-
    get_old_new_ingredient_list_by_nutrient(DailyDiet, Tail, Fix, MacroNutrient, OldIngredientList, NewIngredientList).
get_old_new_ingredient_list_by_nutrient(_, [], _, _, _, []) :- !.

% Fix dish grams accoridng to MacroNutrient check results
fix_macronutrients_grams(NewId, ListDish, DefaultDish, MacroNutrient, Fix) :- 
    get_old_new_ingredient_list_by_nutrient(NewId, ListDish, Fix, MacroNutrient, OldIngredientList, NewIngredientList),
    has(NewId, Dish, OldIngredientList),
    (
        length(NewIngredientList, 0) ->
        (
            has(NewId, DefaultDish, IngredientList),
            find_ingredients_sorted_by_nutrient(IngredientList, MacroNutrient, OrderedList),
            nth0(0, OrderedList, FoodWithMoreNutrient-_),
            default_case_fix(FoodWithMoreNutrient, Fix, IngredientList, [], DefaultIngredientList),
            retract(has(NewId, DefaultDish, IngredientList)),
            assertz(has(NewId, DefaultDish, DefaultIngredientList))            
        )
        ;
        (            
            retract(has(NewId, Dish, OldIngredientList)),
            assertz(has(NewId, Dish, NewIngredientList))
        )
    ).


get_micronutrient_content_list(_, [], Contents, Contents).
get_micronutrient_content_list(Food-Gram, [Nutrient | Rest], Acc, Contents) :-
    findall(Content-Food-Gram, (has_nutrient(Food, Nutrient, Content)), TempContents),
    append(Acc, TempContents, NewAcc),
    get_micronutrient_content_list(Food-Gram, Rest, NewAcc, Contents),
    !.

collect_nutrient_content([], _, NutrientContentPairs, NutrientContentPairs).
collect_nutrient_content([Food-Gram | Rest], Nutrients, Acc, NutrientContentPairs) :-
    get_micronutrient_content_list(Food-Gram, Nutrients, [], Contents),
    (
        length(Contents, 0) 
        ->
            append(Acc, [0-Food-Gram], NewAcc)
        ;
            append(Acc, Contents, NewAcc)
    ),
    !,
    collect_nutrient_content(Rest, Nutrients, NewAcc, NutrientContentPairs).

% Gets the Food in a list of ingredients (Aliments) which has the highest content of a given macronutrient
find_ingredients_sorted_by_nutrient(Aliments, MacroNutrient, SortedFood) :- 
    findall(Nutrient, nutrient_instance(_, MacroNutrient, Nutrient), Nutrients),
    collect_nutrient_content(Aliments, Nutrients, [], NutrientContentPairs),
    keysort(NutrientContentPairs, SortedPairs),
    accumulate_micronutrient_content_from_list(SortedPairs, [], FinalSortedPairs),
    reverse(FinalSortedPairs, DescSortedPairs),
    extract_pairs_values(DescSortedPairs, SortedFood).

extract_pairs_values([], []).
extract_pairs_values([_-Food-Gram | T1], [Food-Gram | T2]) :-
    extract_pairs_values(T1, T2).

get_old_new_ingredient_list_by_calories(DailyDiet, ListDish, Fix, OldRel, NewRel) :-
    has(DailyDiet, Head, IngredientsList),
    sort_ingredients_by_calories(IngredientsList, OrderedList),
    dif(OrderedList, []),
    change_ingredient_grams(Head, OrderedList, Fix, [], TempIngredientList),
    IngredientsList \== TempIngredientList,
    OldRel = IngredientsList, 
    NewRel = TempIngredientList,
    !.
get_old_new_ingredient_list_by_calories(DailyDiet, [_|Tail], Fix, MacroNutrient, OldIngredientList, NewIngredientList) :-
    get_old_new_ingredient_list_by_calories(DailyDiet, Tail, Fix, MacroNutrient, OldIngredientList, NewIngredientList).
get_old_new_ingredient_list_by_calories(_, [], _, _, _, 0).

% Base case: an empty list is already sorted.
sort_ingredients_by_calories([], []).
% Recursive case: sort the tail, then insert the head in the correct position.
sort_ingredients_by_calories([Head|Tail], SortedList) :-
    sort_ingredients_by_calories(Tail, SortedTail),
    insert_ingredient(Head, SortedTail, SortedList).

% Insert an element into a sorted list, resulting in a new sorted list.
insert_ingredient(FoodBeverage-Grams, [], [FoodBeverage-Grams]).
insert_ingredient(FoodBeverage1-Grams1, [FoodBeverage2-Grams2 | Tail], [FoodBeverage1-Grams1, FoodBeverage2-Grams2 | Tail]) :-
    attribute_value(dietplanner, FoodBeverage1, calories, Calories1),
    attribute_value(dietplanner, FoodBeverage2, calories, Calories2),
    Calories1 =< Calories2.
insert_ingredient(FoodBeverage1-Grams1, [FoodBeverage2-Grams2 | Tail], [FoodBeverage2-Grams2 | NewTail]) :-
    attribute_value(dietplanner, FoodBeverage1, calories, Calories1),
    attribute_value(dietplanner, FoodBeverage2, calories, Calories2),
    Calories1 > Calories2,
    insert_ingredient(FoodBeverage1-Grams1, Tail, NewTail).

default_case_fix(_, _, [], NewIngredientList, NewIngredientList).
default_case_fix(Food, Fix, [FoodBeverage-Grams | Rest], Acc, NewIngredientList) :-
    (
        FoodBeverage = Food,
        (
            % If Fix = 1, Decrease by 10%
            Fix = 1,
            NewGrams is floor((Grams * 90) / 100)
        ;
            % If Fix = -1, Increase by 10%
            Fix = -1,
            NewGrams is ceiling((Grams * 110) / 100)
        )
        ;
        NewGrams = Grams
    ),
    !,
    append(Acc, [FoodBeverage-NewGrams], NewAcc),
    default_case_fix(Food, Fix, Rest, NewAcc, NewIngredientList).


% Fix dish grams accoridng to Calories check results
fix_calories_grams(NewId, ListDish, DefaultDish, Fix) :-
    get_old_new_ingredient_list_by_calories(NewId, ListDish, Fix, OldRel, NewRel),
    has(NewId, Dish, OldIngredientList),
    (
        length(NewIngredientList, 0) ->
        (            
            has(NewId, DefaultDish, IngredientList),
            sort_ingredients_by_calories(IngredientList, OrderedList),
            nth0(0, OrderedList, FoodWithMoreCalories),
            default_case_fix(FoodWithMoreCalories, Fix, IngredientList, [], DefaultIngredientList),
            !,
            retract(has(NewId, DefaultDish, IngredientList)),
            assertz(has(NewId, DefaultDish, DefaultIngredientList))
        )
        ;
        (
            retract(has(NewId, Dish, OldIngredientList)),
            assertz(has(NewId, Dish, NewIngredientList))
        )
    ).
    
change_ingredient_grams(_, [], _, NewIngredientList, NewIngredientList).
change_ingredient_grams(Dish, [FoodBeverage-Grams | Rest], Fix, Acc, NewIngredientList) :-
    made_of(Dish, FoodBeverage, Min, Max),
    (
        % If Fix = 1, Decrease by 10%
        Fix = 1,
        NewGrams is floor((Grams * 90) / 100),
        NewGrams >= Min, NewGrams =< Max
        ;
        % If Fix = -1, Increase by 10%
        Fix = -1,
        NewGrams is ceiling((Grams * 110) / 100),
        NewGrams >= Min, NewGrams =< Max
    ),
    !,
    append(Acc, [FoodBeverage-NewGrams | Rest], NewIngredientList). % End after making the first successful modification

change_ingredient_grams(Dish, [FoodBeverage-Grams | Rest], Fix, Acc, NewIngredientList) :-
    % This clause handles the case where no change is made
    append(Acc, [FoodBeverage-Grams], NewAcc),
    change_ingredient_grams(Dish, Rest, Fix, NewAcc, NewIngredientList).



% Returns the the list of calories, where each element corresponds to the calories of a dish (represented by its ingredients)
get_dish_calories_lists([], CaloriesList, CaloriesList).
get_dish_calories_lists([Ingredients | Rest], Acc, CaloriesList) :-
    compute_actual_dish_calories(Ingredients, 0, ActualCalories),
    IntegerCalories is round(ActualCalories),
    append(Acc, [IntegerCalories], NewAcc),
    get_dish_calories_lists(Rest, NewAcc, CaloriesList).

% Returns the most caloric dish in a daily diet
get_ordered_list_dish_by_calories(ListRelationships, FinalListDish) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, DishList),
    get_dish_calories_lists(IngredientLists, MacroNutrient, [], CaloriesList),
    order_list_by_values(CaloriesList, DishList, FinalListDish).
    
% Returns the dish with the highest macronutrient quantity in a daily diet
get_ordered_list_dish_by_nutrient(ListRelationships, MacroNutrient, FinalListDish) :-
    extract_ingredients_and_dishes(ListRelationships, [], [], IngredientLists, DishList),
    get_dish_macronutrient_amount_lists(IngredientLists, MacroNutrient, [], MacroNutrientQuantityList),
    order_list_by_values(MacroNutrientQuantityList, DishList, FinalListDish).   

% Returns the list of macronutrient quantities, where each element represents a dish
get_dish_macronutrient_amount_lists([], _, CaloriesList, CaloriesList).
get_dish_macronutrient_amount_lists([Ingredients | Rest], MacroNutrient, Acc, CaloriesList) :-
    cumulative_macro_nutrient_quantity(Ingredients, MacroNutrient, Quantity),
    IntegerQuantity is round(Quantity),
    append(Acc, [IntegerQuantity], NewAcc),
    !,
    get_dish_macronutrient_amount_lists(Rest, MacroNutrient, NewAcc, CaloriesList).

% Generate ingredients' grams for all dishes in a daily diet
set_grams_for_dish(_, []).
set_grams_for_dish(NewId, [Dish | RestDish]) :-
    get_foodbeverages_in_dish(Dish, FoodBeverageList),
    actual_foodbeverage_grams(FoodBeverageList, Dish, [], IngredientLists), 
    assertz(has(NewId, Dish, IngredientLists)),
    set_grams_for_dish(NewId, RestDish).
 

% Computes the ingredient's grams given the final daily calories
actual_foodbeverage_grams([], _, IngredientLists, IngredientLists).
actual_foodbeverage_grams([FoodBeverage | Rest], Dish, Acc, IngredientLists) :-
    made_of(Dish, FoodBeverage, Min, _),
    append(Acc, [FoodBeverage-Min], NewAcc),
    actual_foodbeverage_grams(Rest, Dish, NewAcc, IngredientLists).

% ---------
% Daily Diet
% ---------
% Get the list of food and beverages in a dish of a daily diet
get_foodbeverages_in_daily_diet(DailyDiet, FoodBeverageList) :-
    findall(Ingredient, has(DailyDiet, _, Ingredient), Ingredients),
    flatten_list(Ingredients, IngredientLists),
    get_only_foodbeverages(IngredientLists, [], FoodBeverageList).

get_only_foodbeverages([], Acc, Acc). 
get_only_foodbeverages([FoodBeverage-_Grams | Rest], Acc, FoodBeverageList) :-
    append(Acc, [FoodBeverage], UpdatedAcc),
    get_only_foodbeverages(Rest, UpdatedAcc, FoodBeverageList).

% Count how many instances of a class of FoodBeverage there are in a daily diet
count_foodbeverage_in_daily_diet(DailyDiet, ItemToCount, Total) :-
    get_foodbeverages_in_daily_diet(DailyDiet, FoodBeverageList),
    count_foodbeverage_in_list(ItemToCount, FoodBeverageList, 0, Total).

count_foodbeverage_in_list(_, [], Count, Count).
count_foodbeverage_in_list(ItemToCount, [FoodBeverage | Rest], PartialCount, Total) :-
    (foodbeverage_instance(dietplanner, ItemToCount, FoodBeverage) ->
        NewPartialCount is PartialCount + 1
        ;
        NewPartialCount is PartialCount
    ),
    count_foodbeverage_in_list(ItemToCount, Rest, NewPartialCount, Total).

% Generate a daily diet for a person
generate_daily_diet(Person, DietTypes, NewId, TotalDayCalories) :-
    dish_types(DishTypes),

    get_macronutrient_limits(DietTypes, MacronutrientLimits),
    set_daily_calories(DietTypes, TotalDayCalories, NewTotalDayCalories),

    % TODO: assert structure

    get_daily_diet_dishes(Person, DishTypes, [], DailyDietDishes),
    get_daily_diet_calories(NewTotalDayCalories, DailyCalories),
    set_grams_for_dish(NewId, DailyDietDishes),
    check_and_fix_daily_diet(NewId, MacronutrientLimits, DailyCalories).

get_macronutrient_limits(DietTypes, MacronutrientLimits) :-
    (
        member(healthy_weight_diet, DietTypes)
        ->
            healthy_weight_nutrient_percentages(MacronutrientLimits)
        ;
        member(hyperproteic_diet, DietTypes)
        ->
            hyperproteic_nutrient_percentages(MacronutrientLimits)
        ;
        member(hypocaloric_diet, DietTypes)
        ->
            healthy_weight_nutrient_percentages(MacronutrientLimits)
        ;
            % In any other case (or if not specified), it's assumed an healthy (standard) diet
            healthy_weight_nutrient_percentages(MacronutrientLimits)
    ).

set_daily_calories([], NewTotalDayCalories, NewTotalDayCalories).
set_daily_calories([DietType | Rest], TotalDayCalories, NewTotalDayCalories) :-
    (
        DietType = hypocaloric_diet 
        -> 
            % Reduce the total calories by 20%
            TempDayCalories is (TotalDayCalories * 80) / 100 
        ;
            TempDayCalories is TotalDayCalories
    ),
    set_daily_calories(Rest, TempDayCalories, NewTotalDayCalories).


% Checks Macronutrients and Calories contraints and fix the generated daily diet
check_and_fix_daily_diet(NewId, MacronutrientLimits, DailyCalories) :-
    repeat,
    (
        check_daily_macronutrient(NewId, DailyCalories, MacronutrientLimits, MacronutrientResult, FailedMacroNutrient),
        check_daily_calories(NewId, DailyCalories, CaloryResult),
        (
            MacronutrientResult = 0, CaloryResult = 0 ->
                !
            ;
            MacronutrientResult = -1    ->
                fix_macronutient(NewId, FailedMacroNutrient, MacronutrientResult)
            ;
            MacronutrientResult = 1     ->
                fix_macronutient(NewId, FailedMacroNutrient, MacronutrientResult)
            ;
            CaloryResult = -1    ->
                fix_calories(NewId, CaloriesResult)
            ;
            CaloryResult = 1     ->
                fix_calories(NewId, CaloriesResult)
        )
    ). % Fail to exit the repeat loop.


% Fix dish grams w.r.t. macronutrient checks
fix_macronutient(NewId, MacroNutrient, MacronutrientResult) :-
    get_list_dish_by_nutrient(NewId, MacroNutrient, ListDish),
    nth0(0, ListDish, DefaultDish),
    fix_macronutrients_grams(NewId, ListDish, DefaultDish, MacroNutrient, MacronutrientResult),
    !,
    fail.

% Fix dish grams w.r.t. calories checks
fix_calories(NewId, CaloriesResult) :-
    get_list_dish_by_calories(NewId, ListDish),
    nth0(0, ListDish, DefaultDish),
    fix_calories_grams(NewId, ListDish, DefaultDish, CaloryResult),
    !,
    fail.

% Read a file and find specific instances
get_list_dish_by_calories(DailyDiet, ListDish) :-
    get_list_relationships(DailyDiet, ListRelationships),
    get_ordered_list_dish_by_calories(ListRelationships, ListDish).

% Predicate to read a file and find specific instances
get_list_dish_by_nutrient(DailyDiet, MacroNutrient, ListDish) :-
    get_list_relationships(DailyDiet, ListRelationships),
    get_ordered_list_dish_by_nutrient(ListRelationships, MacroNutrient, ListDish).

% Given a list of terms, gets the list of ingredients and a list of dishes
extract_ingredients_and_dishes([], AllIngredients, AllDishes, AllIngredients, AllDishes).
extract_ingredients_and_dishes([Term | Rest], AccIngredients, AccDishes, AllIngredients, AllDishes) :-
    Term = has(_, Dish, Ingredients),
    append(AccIngredients, [Ingredients], NewIngredient),
    append(AccDishes, [Dish], NewDish),
    extract_ingredients_and_dishes(Rest, NewIngredient, NewDish, AllIngredients, AllDishes).

convert_grams_in_calories(MacroNutrient, TotalNutrientQuantity, TotalCalories) :-
    (   MacroNutrient = lipids ->
            TotalCalories is (TotalNutrientQuantity * 8)
        ;   
        MacroNutrient = dietary_fiber ->    
            TotalCalories is TotalNutrientQuantity 
        ;  
        MacroNutrient = protein ->    
            TotalCalories is (TotalNutrientQuantity * 6) 
        ; 
            TotalCalories is (TotalNutrientQuantity * 5)
    ).

% Checks that the macronutrient quantity in a daily diet is between a specified range
check_macronutrient_helper(DailyDiet, DailyCalories, MacroNutrient, LowerBound, UpperBound, Result) :-
    unique_ingredients_in_daily_diet(DailyDiet, UniqueIngredients), 
    sum_list(DailyCalories, DayCalories),
    !,
    cumulative_macro_nutrient_quantity(UniqueIngredients, MacroNutrient, TotalNutrientQuantity),
    convert_grams_in_calories(MacroNutrient, TotalNutrientQuantity, TotalCalories),

    Min is floor((DayCalories * LowerBound) / 100),
    Max is ceiling((DayCalories * UpperBound) / 100),

    (
        TotalCalories < Min ->
        TempResult is -1
        ;
        TotalCalories > Max ->
        TempResult is 1
        ;
        TotalCalories >= Min, TotalCalories =< Max ->
        TempResult is 0 
    ),

    Result = TempResult.


% Caso base: se la lista è vuota, e non ci sono altre macro da controllare, la funzione restituisce 0 (nessun errore).
check_daily_macronutrient(_, _, [], 0, _) :-
    !.

% Caso ricorsivo: se il check del macronutriente corrente fallisce (InnerResult \= 0), 
% la funzione restituisce l'InnerResult e il MacroNutrient corrente come FailedMacroNutrient.
check_daily_macronutrient(DailyDiet, DailyCalories, [MacroNutrient-LowerBound-UpperBound | Rest], Result, FailedMacroNutrient) :-
    check_macronutrient_helper(DailyDiet, DailyCalories, MacroNutrient, LowerBound, UpperBound, InnerResult),
    (
        InnerResult \= 0 
        ->
            Result = InnerResult,
            FailedMacroNutrient = MacroNutrient,
            !  % Blocca ulteriori backtracking
        ;
            check_daily_macronutrient(DailyDiet, DailyCalories, Rest, Result, FailedMacroNutrient)
    ).


% Checks that the calories in a daily diet is between a specified range
check_daily_calories(DailyDiet, DailyCalories, Result) :-
    get_list_relationships(DailyDiet, ListRelationships),
    extract_ingredients_and_dishes(ListRelationships, [], _, IngredientLists, _),
    check_dish_calories(IngredientsList, DailyCalories, Result),
    !.

% Checks calories constraints among dishes, stopping the execution when the result is different from 0, meaning that some check failed
check_dish_calories([], _, 0).
check_dish_calories([Ingredients | RestIngredients], [DishCalories | RestCalories], Result) :-
    compute_actual_dish_calories(Ingredients, 0, ActualCalories),
    (
        ActualCalories =< DishCalories - 60   ->
        InnerResult is -1
    ;
        ActualCalories >= DishCalories + 1    ->
        InnerResult is 1
    ;
        ActualCalories >= DishCalories - 60, ActualCalories =< DishCalories + 1 ->
        InnerResult is 0
    ),
    (InnerResult = 0 ->
        check_dish_calories(RestIngredients, RestCalories, Result)
        ;
        Result = InnerResult % Pass along the non-zero result
    ).
check_dish_calories(_, _, Result) :- 
    Result \= 0, 
    !.


init_diet(Name, Surname, Type, Person, Structure) :-
    find_person_id(Name, Surname, Person),
    atomic_concat('diet_', Person, DietName),
    atomic_concat('Diet for ', Name, Temp),
    atomic_concat(Temp, ' ', Temp1),
    atomic_concat(Temp1, Surname, TotalName),
    Structure = [diet_instance(dietplanner, diet, DietName),
                attribute_value(dietplanner, DietName, name, TotalName),
                attribute_value(dietplanner, diet_nome, type, Type),
                daily_diet_instance(dietplanner, daily_diet, daily_diet1),
                attribute_value(dietplanner, daily_diet1, name, 'Daily Diet 1'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet2),
                attribute_value(dietplanner, daily_diet2, name, 'Daily Diet 2'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet3),
                attribute_value(dietplanner, daily_diet3, name, 'Daily Diet 3'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet4),
                attribute_value(dietplanner, daily_diet4, name, 'Daily Diet 4'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet5),
                attribute_value(dietplanner, daily_diet5, name, 'Daily Diet 5'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet6),
                attribute_value(dietplanner, daily_diet6, name, 'Daily Diet 6'),
                daily_diet_instance(dietplanner, daily_diet, daily_diet7),
                attribute_value(dietplanner, daily_diet7, name, 'Daily Diet 7'),
                made_for(DietName, Person),
                suggested_diet(Person, DietName),
                composed_of(DietName, daily_diet1),
                composed_of(DietName, daily_diet2),
                composed_of(DietName, daily_diet3),
                composed_of(DietName, daily_diet4),
                composed_of(DietName, daily_diet5),
                composed_of(DietName, daily_diet6),
                composed_of(DietName, daily_diet7)].

% ---------
% Diet
% ---------
% Compute the diet for a specific person
compute_diet(Name, Surname, Type, Structure, Instances) :-
    init_diet(Name, Surname, Type, Person, Structure),
    generate_list_calories_week(Person, TotalWeekCaloriesList),
    daily_diet_names(DailyDietNames),
    retractall(has(_, _, _)),
    !,
    generate_daily_diet(Person, DailyDietNames, TotalWeekCaloriesList),
    read_relationships(Instances).


get_init_info(Person, TotalWeekCaloriesList, DailyDietNames) :-
    generate_list_calories_week(Person, TotalWeekCaloriesList),
    daily_diet_names(DailyDietNames).
