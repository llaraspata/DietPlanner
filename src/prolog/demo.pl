% Define a predicate to sum the content for the same food
sum_contents([], Result, Result) :- 
    writeln('END').
sum_contents([N1-Food-Gram1 | Rest], Acc, Result) :-
    % Call a helper predicate to find and sum content for the same food
    writeln('start'),
    sum_contents_helper(Rest, N1-Food-Gram1, TempSum),
    remove_processed_food(Food, [N1-Food-Gram1 | Rest], RestWithoutFood),
    % Create the result by appending the summed content
    append(Acc, [TempSum-Food-Gram1], NewAcc),
    % Recursively process the updated list
    sum_contents(RestWithoutFood, NewAcc, Result).

% Helper predicate to sum content for the same food
sum_contents_helper([], _, 0).
sum_contents_helper([N2-Food2-Gram2 | Rest], N1-Food1-Gram1, TempSum) :-
    writeln('helper'),
    % If the food matches, update the temporary sum
    Food2 = Food1,
    writeln('food mached'),
    writeln(Food2),
    writeln(Food1),
    TempSum1 is N1 + N2,
    writeln('temp sum'),
    writeln(TempSum1),
    % Recursively call the helper predicate
    sum_contents_helper(Rest, TempSum1-Food1-Gram1, TempSum),
    writeln(TempSum-Food1-Gram),
    !.
sum_contents_helper([N2-Food2-Gram2 | Rest], N1-Food1-Gram1, TempSum) :-
    % If the food doesn't match, keep it in the remaining list
    Food2 \= Food1,
    writeln('food NOT mached'),
    writeln(Food2),
    writeln(Food1),
    sum_contents_helper(Rest, N1-Food1-Gram1, TempSum).


% Remove already processed food from RestWithoutFood
remove_processed_food(_, [], []).
remove_processed_food(Food, [N-Food-Gram | Rest], UpdatedRest) :-
    % Food matches, skip it
    remove_processed_food(Food, Rest, UpdatedRest),
    !.
remove_processed_food(Food, [N-Item-Gram | Rest], [N-Item-Gram | UpdatedRest]) :-
    % Food doesn't match, keep it
    Food \= Item,
    remove_processed_food(Food, Rest, UpdatedRest).




% Example usage:
input_list([1.6-carrot-368,2.6-hummus-132,0.9-bell_peppers-140,1.1-bell_peppers-140,0.2-cucumber-146,0.2-cucumber-146,0.3-cucumber-146,0.3-cucumber-146]).
sum_contents_test(Result) :-
    input_list(Input),
    sum_contents(Input, [], Result).
