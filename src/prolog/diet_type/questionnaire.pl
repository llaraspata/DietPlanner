% ---------
% Diet Types
% ---------
inference_goal_instance(dietplanner, diet_type, diabetic_diet).
attribute_value(dietplanner, diabetic_diet, name, 'Diabetic diet').
attribute_value(dietplanner, diabetic_diet, description, 'A diabetic diet controls blood sugar through careful food choices.').

inference_goal_instance(dietplanner, diet_type, high_cholesterol_diet).
attribute_value(dietplanner, high_cholesterol_diet, name, 'High cholesterol diet').
attribute_value(dietplanner, high_cholesterol_diet, description, 'A high cholesterol diet focuses on reducing dietary cholesterol and saturated fats to manage cholesterol levels.').

inference_goal_instance(dietplanner, diet_type, gastrointestinal_disorder_diet).
attribute_value(dietplanner, gastrointestinal_disorder_diet, name, 'Gastrointestinal disorders diet').
attribute_value(dietplanner, gastrointestinal_disorder_diet, description, 'A diet for gastrointestinal disorders helps manage digestive problems.').

inference_goal_instance(dietplanner, diet_type, kidney_problem_diet).
attribute_value(dietplanner, kidney_problem_diet, name, 'Kidney problems diet').
attribute_value(dietplanner, kidney_problem_diet, description, 'A kidney problems diet is tailored to support kidney function and manage renal conditions.').

inference_goal_instance(dietplanner, diet_type, omnivorous_diet).
attribute_value(dietplanner, omnivorous_diet, name, 'Omnivorous diet').
attribute_value(dietplanner, omnivorous_diet, description, 'An omnivorous diet includes both plant and animal foods.').

inference_goal_instance(dietplanner, diet_type, vegetarian_diet).
attribute_value(dietplanner, vegetarian_diet, name, 'Vegetarian diet').
attribute_value(dietplanner, vegetarian_diet, description, 'A vegetarian diet excludes meat and fish, emphasizing plant-based foods.').

inference_goal_instance(dietplanner, diet_type, vegan_diet).
attribute_value(dietplanner, vegan_diet, name, 'Vegan diet').
attribute_value(dietplanner, vegan_diet, description, 'A vegan diet excludes all animal products.').

inference_goal_instance(dietplanner, diet_type, no_meat_diet).
attribute_value(dietplanner, no_meat_diet, name, 'No-meat diet').
attribute_value(dietplanner, no_meat_diet, description, 'A no-meat diet eliminates meat consumption.').

inference_goal_instance(dietplanner, diet_type, no_fish_seafood_diet).
attribute_value(dietplanner, no_fish_seafood_diet, name, 'No-fish-and-seafood diet').
attribute_value(dietplanner, no_fish_seafood_diet, description, 'A no-fish-and-seafood diet excludes fish and other aquatic foods.').

inference_goal_instance(dietplanner, diet_type, healthy_weight_diet).
attribute_value(dietplanner, healthy_weight_diet, name, 'Healty weight diet').
attribute_value(dietplanner, healthy_weight_diet, description, 'A healthy weight diet promotes weight management and overall well-being through balanced eating.').

inference_goal_instance(dietplanner, diet_type, hyperproteic_diet).
attribute_value(dietplanner, hyperproteic_diet, name, 'Hyperproteic diet').
attribute_value(dietplanner, hyperproteic_diet, description, 'A hyperproteic diet is characterized by a high intake of protein-rich foods.').

inference_goal_instance(dietplanner, diet_type, hypocaloric_diet).
attribute_value(dietplanner, hypocaloric_diet, name, 'Hypocaloric diet').
attribute_value(dietplanner, hypocaloric_diet, description, 'A hypocaloric diet involves a reduced calorie intake to promote weight loss or manage certain health conditions.').

% ---------
% Topic
% ---------
topic_instance(dietplanner, topic, eating_habits).
attribute_value(dietplanner, eating_habits, name, 'Eating habits').

topic_instance(dietplanner, topic, health_conditions).
attribute_value(dietplanner, health_conditions, name, 'Health conditions').

topic_instance(dietplanner, topic, body_goal).
attribute_value(dietplanner, body_goal, name, 'Body goal').



% ---------
% Question
% ---------
question_instance(dietplanner, question, q1).
attribute_value(dietplanner, q1, text, 'Do you have any dietary restrictions to report?').
attribute_value(dietplanner, q1, asked_why, 'It is useful to assess an individual\'s dietary needs and preferences, as it allows for the identification of any specific dietary restrictions, allergies, or cultural/religious preferences that might influence the type of diet that can be recommended effectively. This question ensures that the suggested diet plan is personalized and suitable for the individual\'s unique requirements and constraints.').
attribute_value(dietplanner, q1, mandatory, 1).
attribute_value(dietplanner, q1, importance, 1).

question_instance(dietplanner, question, q2).
attribute_value(dietplanner, q2, text, 'Do you eat meat?').
attribute_value(dietplanner, q2, asked_why, 'It is crucial in a questionnaire aimed at deducing the proper diet type to suggest because it helps determine whether the individual follows a vegetarian, vegan, or omnivorous diet, which is fundamental for tailoring dietary recommendations and ensuring dietary compatibility with the person\'s existing dietary choices and preferences.').
attribute_value(dietplanner, q2, mandatory, 1).
attribute_value(dietplanner, q2, importance, 1).

question_instance(dietplanner, question, q3).
attribute_value(dietplanner, q3, text, 'Do you eat fish and seafood?').
attribute_value(dietplanner, q3, asked_why, 'It helps establish whether an individual includes or excludes fish and seafood in their diet, which is essential for determining if they follow a vegetarian, vegan, or other diet, and enables personalized diet recommendations that align with their dietary habits.').
attribute_value(dietplanner, q3, mandatory, 1).
attribute_value(dietplanner, q3, importance, 1).

question_instance(dietplanner, question, q4).
attribute_value(dietplanner, q4, text, 'Do you eat animal-derived foods?').
attribute_value(dietplanner, q4, asked_why, 'It is intended to deduce the proper diet type to suggest because it provides insights into whether an individual consumes any animal products, which is fundamental for categorizing their diet as vegetarian, or vegan.').
attribute_value(dietplanner, q4, mandatory, 1).
attribute_value(dietplanner, q4, importance, 1).

question_instance(dietplanner, question, q5).
attribute_value(dietplanner, q5, text, 'Do you have any particular medical conditions or chronic illnesses to report?').
attribute_value(dietplanner, q5, asked_why, 'It is crucial in a questionnaire aimed at deducing the proper diet type to suggest because it helps identify any health-related dietary restrictions or requirements, ensuring that dietary recommendations take into account the individual\'s medical conditions, or specific health needs for a safe and effective dietary plan.').
attribute_value(dietplanner, q5, mandatory, 1).
attribute_value(dietplanner, q5, importance, 1).

question_instance(dietplanner, question, q6).
attribute_value(dietplanner, q6, text, 'Are you diabetic?').
attribute_value(dietplanner, q6, asked_why, 'It is essential in a questionnaire designed to deduce the proper diet type to suggest because it directly determines whether the individual has diabetes, a condition that significantly influences dietary choices.').
attribute_value(dietplanner, q6, mandatory, 1).
attribute_value(dietplanner, q6, importance, 1).

question_instance(dietplanner, question, q7).
attribute_value(dietplanner, q7, text, 'Do you suffer from high blood pressure?').
attribute_value(dietplanner, q7, asked_why, 'It is important in a questionnaire aimed at deducing the proper diet type to suggest because it helps identify a specific medical condition that requires dietary considerations. Knowing if someone has high blood pressure is crucial for recommending a diet that can support blood pressure management and overall cardiovascular health.').
attribute_value(dietplanner, q7, mandatory, 1).
attribute_value(dietplanner, q7, importance, 1).

question_instance(dietplanner, question, q8).
attribute_value(dietplanner, q8, text, 'Do you have high cholesterol?').
attribute_value(dietplanner, q8, asked_why, 'It is significant in a questionnaire designed to deduce the proper diet type to suggest because it alerts to a specific health condition that has a direct impact on dietary recommendations. Understanding whether an individual has high cholesterol, together with high blood pressure, is essential for tailoring a diet plan that can assist in managing cholesterol levels and reducing cardiovascular risk.').
attribute_value(dietplanner, q8, mandatory, 1).
attribute_value(dietplanner, q8, importance, 1).

question_instance(dietplanner, question, q9).
attribute_value(dietplanner, q9, text, 'Do you suffer from gastro-intestinal disorders?').
attribute_value(dietplanner, q9, asked_why, 'It is crucial in a questionnaire aimed at deducing the proper diet type to suggest because it helps identify specific gastrointestinal health issues that require dietary modifications. Recognizing the presence of such disorders is essential for customizing a diet plan that can alleviate symptoms and support digestive health.').
attribute_value(dietplanner, q9, mandatory, 1).
attribute_value(dietplanner, q9, importance, 1).

question_instance(dietplanner, question, q10).
attribute_value(dietplanner, q10, text, 'Do you suffer from kidney problems?').
attribute_value(dietplanner, q10, asked_why, 'It is pivotal in a questionnaire designed to deduce the proper diet type to suggest because it indicates a specific medical condition that significantly impacts dietary choices.').
attribute_value(dietplanner, q10, mandatory, 1).
attribute_value(dietplanner, q10, importance, 1).

question_instance(dietplanner, question, q11).
attribute_value(dietplanner, q11, text, 'Do you simply want to reach your healthy weight?').
attribute_value(dietplanner, q11, asked_why, 'It is relevant in a questionnaire aimed at deducing the proper diet type to suggest because it helps determine the primary goal of the individual, which is essential for tailoring a diet plan that focuses on weight management and overall well-being.').
attribute_value(dietplanner, q11, mandatory, 1).
attribute_value(dietplanner, q11, importance, 1).

question_instance(dietplanner, question, q12).
attribute_value(dietplanner, q12, text, 'Do you want to increase your muscle mass?').
attribute_value(dietplanner, q12, asked_why, 'It is important in a questionnaire aimed at deducing the proper diet type to suggest because it signals a specific fitness goal, allowing for the customization of a diet plan that emphasizes higher protein intake and appropriate nutrient balance to support muscle growth and athletic performance.').
attribute_value(dietplanner, q12, mandatory, 1).
attribute_value(dietplanner, q12, importance, 1).

question_instance(dietplanner, question, q13).
attribute_value(dietplanner, q13, text, 'Do you want to reduce your body fat percentage?').
attribute_value(dietplanner, q13, asked_why, 'It is crucial in a questionnaire aimed at deducing the proper diet type to suggest because it indicates a specific weight management goal, enabling the tailoring of a diet plan that emphasizes calorie control to support the individual in achieving their desired body composition.').
attribute_value(dietplanner, q13, mandatory, 1).
attribute_value(dietplanner, q13, importance, 1).


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