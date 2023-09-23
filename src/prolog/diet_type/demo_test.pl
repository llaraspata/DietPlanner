% ---------
% Libraries
% ---------
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(random)).

comes_after(eating_habits, health_conditions).
comes_after(health_conditions, body_goal).
comes_after(body_goal, dietary_habits).


get_topic_order(SortedTopics) :-
    findall(FirstTopic, comes_after(FirstTopic, _), FirstTopics),
    findall(SecondTopic, comes_after(_, SecondTopic), SecondTopics),

    remove_duplicates(FirstTopics, FinalFirstTopics),
    remove_duplicates(SecondTopics, FinalSecondTopics),

    get_topic_order_helper(FinalFirstTopics, FinalSecondTopics, [], [], SortedTopics).


get_topic_order_helper([], _, _, Acc, SortedTopics) :-
    !,
    length(Acc, Length),
    nth(Length, Acc, Topic),
    comes_after(Topic, LastTopic),
    !,
    append(Acc, [LastTopic], SortedTopics).
get_topic_order_helper([Topic | Rest], SecondTopics, AccOldTopic, AccSortedTopic, SortedTopics) :-
    \+ nth(I, AccOldTopic, Topic),  % The topic has not been already checked
    \+ nth(J, SecondTopics, Topic), % If the topic is not in the second topics list, then it must be the first one

    append(AccOldTopic, [Topic], NewAccOldTopic),
    append(AccSortedTopic, [Topic], NewAccSortedTopic),

    get_new_second_topic_list(Topic, NewSecondTopics),

    writeln('NewSecondTopics'),
    writeln(NewSecondTopics),

    writeln('NewAccSortedTopic'),
    writeln(NewAccSortedTopic),

    get_topic_order_helper(Rest, NewSecondTopics, NewAccOldTopic, NewAccSortedTopic, SortedTopics).


get_new_second_topic_list(Topic, NewSecondTopics) :-
    findall(SecondTopic, (comes_after(FirstTopic, SecondTopic), FirstTopic \= Topic, SecondTopic \= Topic), NewSecondTopics).
