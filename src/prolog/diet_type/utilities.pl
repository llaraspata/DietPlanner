% ---------
% Modules to consult
% ---------
:- consult('questionnaire.pl').

% ---------
% Libraries
% ---------
:- use_module(library(lists)).

% ---------
% Inference Goals
% ---------
collect_inference_goals(GoalList) :-
    findall(Id-Name, (inference_goal_instance(_, _, Id), attribute_value(_, Id, name, Name)), GoalListWithDuplicates),
    remove_duplicates(GoalListWithDuplicates, GoalList).

% ---------
% Topic
% ---------
% Get topic order so the inference engine can take dynamically the questions
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
    get_topic_order_helper(Rest, NewSecondTopics, NewAccOldTopic, NewAccSortedTopic, SortedTopics).

get_new_second_topic_list(Topic, NewSecondTopics) :-
    findall(SecondTopic, (comes_after(FirstTopic, SecondTopic), FirstTopic \= Topic, SecondTopic \= Topic), NewSecondTopics).

% Given a topic, returns the following one
get_next_topic(CurrentTopic, NextTopic) :-
    get_topic_order(SortedTopics),
    nth(J, SortedTopics, CurrentTopic),
    Index is J + 1,
    !,
    nth(Index, SortedTopics, NextTopic).



% ---------
% Question
% ---------
% Gets the next question id and its text, and the list of its possible answers, considering the current question and the given answer
get_next_question([], q0, a0, NextQuestionId, NextQuestion, NextAnswers) :-
    get_topic_order(SortedTopics),
    nth(1, SortedTopics, FirstTopic),
    get_first_question_of_topic(FirstTopic, NextQuestionId),
    attribute_value(_, NextQuestionId, text, NextQuestion),
    !,
    get_question_possible_answer_id_text(NextQuestionId, NextAnswers).

get_next_question(History, CurrentQuestion, GivenAnswer, NextQuestionId, NextQuestion, NextAnswers) :-
    is_related_to(CurrentQuestion, NextQuestionId, GivenAnswer, Prerequirements),
    check_prerequirements(History, Prerequirements, 1),
    attribute_value(_, NextQuestionId, text, NextQuestion),
    !,
    get_question_possible_answer_id_text(NextQuestionId, NextAnswers).

get_next_question(History, CurrentQuestion, GivenAnswer, NextQuestionId, NextQuestion, NextAnswers) :-
    \+ is_related_to(CurrentQuestion, _, GivenAnswer, _),
    belongs_to(CurrentQuestion, CurrentTopic, _),
    get_next_topic(CurrentTopic, NextTopic),
    get_first_question_of_topic(NextTopic, NextQuestionId),
    attribute_value(_, NextQuestionId, text, NextQuestion),
    !,
    get_question_possible_answer_id_text(NextQuestionId, NextAnswers).

% Given a topic, returns the id of its first question
get_first_question_of_topic(Topic, FirstQuestionId) :-
    !,
    belongs_to(FirstQuestionId, Topic, 1).

% Checks that the history of the given answers matches the prerequirements for the next question to ask to the user
check_prerequirements([], [], 1) :- 
    !.
check_prerequirements(History, [], 1).
check_prerequirements(History, [], 0) :-
    a = b.
check_prerequirements(History, [Question-Answer | Rest], _) :-
    (
        member(Question-Answer, History)
        ->
            !
        ;
            check_prerequirements(History, Rest, 0)
    ).


% ---------
% Answer
% ---------
% Given a question returns a list of pairs id-text of its possible answers
get_question_possible_answer_id_text(QuestionId, AnswerList) :-
    findall(Answer-Text, (has_answer(QuestionId, Answer), attribute_value(_, Answer, text, Text)), AnswerListWithDuplicate),
    remove_duplicates(AnswerListWithDuplicate, AnswerList).

% Get ids possible answers of a given question
get_question_possible_answer_ids(QuestionId, AnswerIdList) :-
    findall(Answer, has_answer(QuestionId, Answer), AnswerIdList).

% Get text of possible answers of a given question
get_question_possible_answers(QuestionId, AnswerList) :-
    get_question_possible_answer_ids(QuestionId, AnswerIdList),
    get_question_possible_answers_helper(AnswerIdList, [], AnswerList).

get_question_possible_answers_helper([], Acc, Acc).
get_question_possible_answers_helper([Id | Rest], Acc, AnswerList) :-
    attribute_value(_, Id, text, Text),
    append(Acc, [Text], NewAcc),
    get_question_possible_answers_helper(Rest, NewAcc, AnswerList).

% Get user's answers
has_answered(User, q1, a1) :-
    assertz(fact(has_dietary_restrictions(User))).

has_answered(User, q2, a1) :-
    assertz(fact(eat(User, meat))).

has_answered(User, q3, a1) :-
    assertz(fact(eat(User, fish_seafood))).

has_answered(User, q2, a2) :-
    assertz(fact(do_not_eat(User, meat))).

has_answered(User, q3, a2) :-
    assertz(fact(do_not_eat(User, fish_seafood))).

has_answered(User, q4, a2) :-
    assertz(fact(do_not_eat(User, animal_derived))).

has_answered(User, q5, a1) :-
    assertz(fact(has_medical_issues(User))).

has_answered(User, q6, a1) :-
    assertz(fact(has(User, diabetes))).

has_answered(User, q7, a1) :-
    assertz(fact(has(User, high_blood_pressure))).

has_answered(User, q8, a1) :-
    assertz(fact(has(User, high_cholesterol))).

has_answered(User, q9, a1) :-
    assertz(fact(has(User, gastrointestinal_disorders))).
    
has_answered(User, q10, a1) :-
    assertz(fact(has(User, kidney_problems))).

has_answered(User, q11, a1) :-
    assertz(fact(wants_to(User, healthy_weight))).

has_answered(User, q11, a1) :-
    assertz(fact(wants_to(User, reach_healthy_weight))).

has_answered(User, q11, a1) :-
    assertz(fact(wants_to(User, increase_muscle_mass))).

has_answered(User, q11, a1) :-
    assertz(fact(wants_to(User, reduce_body_fat))).


% ---------
% Diet type
% ---------
% Gets the suggested diet types for a user, together with the explanation in natural language of the reason why each diet type has been suggested
get_suggested_diet_type(User, SuggestedTypes) :-
    findall(
        DietType-Explanation, 
        (
            suggested_diet_type(User, DietType),
            why(suggested_diet_type(User, DietType), Explanation)
        ), 
        SuggestedTypes).