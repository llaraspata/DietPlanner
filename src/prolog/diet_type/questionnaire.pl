% ---------
% Diet Types
% ---------
inference_goal_instance(dietplanner, diet_type, diabetic_diet).
attribute_value(dietplanner, diabetic_diet, name, 'Diabetic diet').
attribute_value(dietplanner, diabetic_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, high_cholesterol_diet).
attribute_value(dietplanner, high_cholesterol_diet, name, 'High cholesterol diet').
attribute_value(dietplanner, high_cholesterol_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, gastrointestinal_disorder_diet).
attribute_value(dietplanner, gastrointestinal_disorder_diet, name, 'Gastrointestinal disorders diet').
attribute_value(dietplanner, gastrointestinal_disorder_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, kidney_problem_diet).
attribute_value(dietplanner, kidney_problem_diet, name, 'Kidney problems diet').
attribute_value(dietplanner, kidney_problem_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, omnivorous_diet).
attribute_value(dietplanner, omnivorous_diet, name, 'Omnivorous diet').
attribute_value(dietplanner, omnivorous_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, vegetarian_diet).
attribute_value(dietplanner, vegetarian_diet, name, 'Vegetarian diet').
attribute_value(dietplanner, vegetarian_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, vegan_diet).
attribute_value(dietplanner, vegan_diet, name, 'Vegan diet').
attribute_value(dietplanner, vegan_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, no_meat_diet).
attribute_value(dietplanner, no_meat_diet, name, 'No meat diet').
attribute_value(dietplanner, no_meat_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, no_fish_seafood_diet).
attribute_value(dietplanner, no_fish_seafood_diet, name, 'No fish and seafood diet').
attribute_value(dietplanner, no_fish_seafood_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, healthy_weight_diet).
attribute_value(dietplanner, healthy_weight_diet, name, 'Healty weight diet').
attribute_value(dietplanner, healthy_weight_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, hyperproteic_diet).
attribute_value(dietplanner, hyperproteic_diet, name, 'Hyperproteic diet').
attribute_value(dietplanner, hyperproteic_diet, description, 'TODO').

inference_goal_instance(dietplanner, diet_type, hypocaloric_diet).
attribute_value(dietplanner, hypocaloric_diet, name, 'Hypocaloric diet').
attribute_value(dietplanner, hypocaloric_diet, description, 'TODO').

% ---------
% Topic
% ---------
topic_instance(dietplanner, topic, eating_habits).
attribute_value(dietplanner, eating_habits, name, 'Eating habits').

topic_instance(dietplanner, topic, health_conditions).
attribute_value(dietplanner, health_conditions, name, 'Health conditions').

topic_instance(dietplanner, topic, body_goal).
attribute_value(dietplanner, body_goal, name, 'Body goal').

topic_instance(dietplanner, topic, dietary_habits).
attribute_value(dietplanner, dietary_habits, name, 'Dietary habits').



% ---------
% Question
% ---------
question_instance(dietplanner, question, q1).
attribute_value(dietplanner, q1, text, 'Do you have any dietary restrictions to report?').
attribute_value(dietplanner, q1, asked_why, 'TODO').
attribute_value(dietplanner, q1, mandatory, TODO).
attribute_value(dietplanner, q1, importance, TODO).

question_instance(dietplanner, question, q2).
attribute_value(dietplanner, q2, text, 'Do you eat meat?').
attribute_value(dietplanner, q2, asked_why, 'TODO').
attribute_value(dietplanner, q2, mandatory, TODO).
attribute_value(dietplanner, q2, importance, TODO).

question_instance(dietplanner, question, q3).
attribute_value(dietplanner, q3, text, 'Do you eat fish and seafood?').
attribute_value(dietplanner, q3, asked_why, 'TODO').
attribute_value(dietplanner, q3, mandatory, TODO).
attribute_value(dietplanner, q3, importance, TODO).

question_instance(dietplanner, question, q4).
attribute_value(dietplanner, q4, text, 'Do you eat animal-derived foods?').
attribute_value(dietplanner, q4, asked_why, 'TODO').
attribute_value(dietplanner, q4, mandatory, TODO).
attribute_value(dietplanner, q4, importance, TODO).

question_instance(dietplanner, question, q5).
attribute_value(dietplanner, q5, text, 'Do you have any particular medical conditions or chronic illnesses to report?').
attribute_value(dietplanner, q5, asked_why, 'TODO').
attribute_value(dietplanner, q5, mandatory, TODO).
attribute_value(dietplanner, q5, importance, TODO).

question_instance(dietplanner, question, q6).
attribute_value(dietplanner, q6, text, 'Are you diabetic?').
attribute_value(dietplanner, q6, asked_why, 'TODO').
attribute_value(dietplanner, q6, mandatory, TODO).
attribute_value(dietplanner, q6, importance, TODO).

question_instance(dietplanner, question, q7).
attribute_value(dietplanner, q7, text, 'Do you suffer from high blood pressure?').
attribute_value(dietplanner, q7, asked_why, 'TODO').
attribute_value(dietplanner, q7, mandatory, TODO).
attribute_value(dietplanner, q7, importance, TODO).

question_instance(dietplanner, question, q8).
attribute_value(dietplanner, q8, text, 'Do you have high cholesterol?').
attribute_value(dietplanner, q8, asked_why, 'TODO').
attribute_value(dietplanner, q8, mandatory, TODO).
attribute_value(dietplanner, q8, importance, TODO).

question_instance(dietplanner, question, q9).
attribute_value(dietplanner, q9, text, 'Do you suffer from gastro-intestinal disorders?').
attribute_value(dietplanner, q9, asked_why, 'TODO').
attribute_value(dietplanner, q9, mandatory, TODO).
attribute_value(dietplanner, q9, importance, TODO).

question_instance(dietplanner, question, q10).
attribute_value(dietplanner, q10, text, 'Do you suffer from kidney problems?').
attribute_value(dietplanner, q10, asked_why, 'TODO').
attribute_value(dietplanner, q10, mandatory, TODO).
attribute_value(dietplanner, q10, importance, TODO).

question_instance(dietplanner, question, q11).
attribute_value(dietplanner, q11, text, 'Do you simply want to reach your healthy weight?').
attribute_value(dietplanner, q11, asked_why, 'TODO').
attribute_value(dietplanner, q11, mandatory, TODO).
attribute_value(dietplanner, q11, importance, TODO).

question_instance(dietplanner, question, q12).
attribute_value(dietplanner, q12, text, 'Do you want to increase your muscle mass?').
attribute_value(dietplanner, q12, asked_why, 'TODO').
attribute_value(dietplanner, q12, mandatory, TODO).
attribute_value(dietplanner, q12, importance, TODO).

question_instance(dietplanner, question, q13).
attribute_value(dietplanner, q13, text, 'Do you want to reduce your body fat percentage?').
attribute_value(dietplanner, q13, asked_why, 'TODO').
attribute_value(dietplanner, q13, mandatory, TODO).
attribute_value(dietplanner, q13, importance, TODO).

question_instance(dietplanner, question, q14).
attribute_value(dietplanner, q14, text, 'Do you consider yourself capable of following a strict diet?').
attribute_value(dietplanner, q14, asked_why, 'TODO').
attribute_value(dietplanner, q14, mandatory, TODO).
attribute_value(dietplanner, q14, importance, TODO).

question_instance(dietplanner, question, q15).
attribute_value(dietplanner, q15, text, 'Do you pay attention to the nutritional values of what you eat?').
attribute_value(dietplanner, q15, asked_why, 'TODO').
attribute_value(dietplanner, q15, mandatory, TODO).
attribute_value(dietplanner, q15, importance, TODO).


% ---------
% Answer
% ---------
answer_instance(dietplanner, answer, a1).
attribute_value(dietplanner, a1, text, 'Yes').

answer_instance(dietplanner, answer, a2).
attribute_value(dietplanner, a2, text, 'No').


% ---------
% comes_after(first_topic, second_topic)
% ---------
comes_after(eating_habits, health_conditions).
comes_after(health_conditions, body_goal).
% comes_after(body_goal, dietary_habits). -> non le dobbiamo mettere??


% ---------
% belongs_to(question, topic, is_first_topic_question)
% ---------
belongs_to(q1, eating_habits, 1).
belongs_to(q2, eating_habits, 0).
belongs_to(q3, eating_habits, 0).
belongs_to(q4, eating_habits, 0).

belongs_to(q5, health_conditions, 1).
belongs_to(q6, health_conditions, 0).
belongs_to(q7, health_conditions, 0).
belongs_to(q8, health_conditions, 0).
belongs_to(q9, health_conditions, 0).
belongs_to(q10, health_conditions, 0).

belongs_to(q11, body_goal, 1).
belongs_to(q12, body_goal, 0).
belongs_to(q13, body_goal, 0).

belongs_to(q14, dietary_habits, 1).
belongs_to(q15, dietary_habits, 0).


% ---------
% has_answer(question, answer)
% ---------
has_answer(q1, a1).
has_answer(q1, a2).

has_answer(q2, a1).
has_answer(q2, a2).

has_answer(q3, a1).
has_answer(q3, a2).

has_answer(q4, a1).
has_answer(q4, a2).

has_answer(q5, a1).
has_answer(q5, a2).

has_answer(q6, a1).
has_answer(q6, a2).

has_answer(q7, a1).
has_answer(q7, a2).

has_answer(q8, a1).
has_answer(q8, a2).

has_answer(q9, a1).
has_answer(q9, a2).

has_answer(q10, a1).
has_answer(q10, a2).

has_answer(q11, a1).
has_answer(q11, a2).

has_answer(q12, a1).
has_answer(q12, a2).

has_answer(q13, a1).
has_answer(q13, a2).

has_answer(q14, a1).
has_answer(q14, a2).

has_answer(q15, a1).
has_answer(q15, a2).


% ---------
% is_related_to(first_question, second_question, correlating_answer, [prerequirements])
% ---------
is_related_to(q1, q2, a1, []).

is_related_to(q2, q3, a1, []).
is_related_to(q2, q3, a2, []).

is_related_to(q3, q4, a2, [q2-a2]).

is_related_to(q5, q6, a1, []).

is_related_to(q6, q7, a1, []).
is_related_to(q6, q7, a2, []).

is_related_to(q7, q8, a1, []).
is_related_to(q7, q9, a2, []).

is_related_to(q8, q9, a1, []).
is_related_to(q8, q9, a2, []).

is_related_to(q9, q10, a1, []).
is_related_to(q9, q10, a2, []).

is_related_to(q11, q12, a2, []).
is_related_to(q12, q13, a2, []).

% is_related_to(q14, q15).		-> non sappiamo se metterle: TODO discuterne
