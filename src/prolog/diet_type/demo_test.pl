% ---------
% Naive User's data
% ---------

% Adriano Meis -> vegan
has_dietary_restrictions(adriano_meis).
do_not_eat(adriano_meis, meat).
do_not_eat(adriano_meis, fish_seafood).
do_not_eat(adriano_meis, animal_derived).

% Mattia Pascal -> vegetarian
has_dietary_restrictions(mattia_pascal).
do_not_eat(mattia_pascal, meat).
do_not_eat(mattia_pascal, fish_seafood).

% Romina Pescatore -> diabetic 
has_medical_issues(romilda_pescatore).
has(romilda_pescatore, diabetes).

% Anselmo Paleari -> high cholesterol
has_medical_issues(anselmo_paleari).
has(anselmo_paleari, high_blood_pressure).
has(anselmo_paleari, high_cholesterol).

% Silvia Caporale -> gastrointestinal disorder
has_medical_issues(silvia_caporale).
has(silvia_caporale, gastrointestinal_disorders).

% Terenzio Papiano -> kidney problems
has_medical_issues(terenzio_papiano).
has(terenzio_papiano, kidney_problems).

% Luigi Pirandello -> healthy weight
wants_to(luigi_pirandello, reach_healthy_weight).

% Giacomo Leopardi -> healthy weight no meat
has_dietary_restrictions(giacomo_leopardi).
do_not_eat(giacomo_leopardi, meat).
wants_to(giacomo_leopardi, reach_healthy_weight).

% Oscar Wilde -> healthy weight no fish seafood
has_dietary_restrictions(oscar_wilde).
do_not_eat(oscar_wilde, fish_seafood).
wants_to(oscar_wilde, reach_healthy_weight).

% Dacia Maraini -> hyperproteic
wants_to(dacia_maraini, increase_muscle_mass).

% Virginia Woolf -> hyperproteic no meat
has_dietary_restrictions(virginia_woolf).
do_not_eat(virginia_woolf, meat).
wants_to(virginia_woolf, increase_muscle_mass).

% Jojo Moyes -> hyperproteic no fish seafood
has_dietary_restrictions(jojo_moyes).
do_not_eat(jojo_moyes, fish_seafood).
wants_to(jojo_moyes, increase_muscle_mass).

% Emily Bronte -> hypocaloric
wants_to(emily_bronte, reduce_body_fat).

% Jane Austen -> hypocaloric no meat
has_dietary_restrictions(jane_austen).
do_not_eat(jane_austen, meat).
wants_to(jane_austen, reduce_body_fat).

% PierPaolo Pasolini -> hypocaloric no fish seafood
has_dietary_restrictions(pierpaolo_pasolini).
do_not_eat(pierpaolo_pasolini, fish_seafood).
wants_to(pierpaolo_pasolini, reduce_body_fat).

% ---------
% Realistic User's data
% ---------
has_dietary_restrictions(mario_rossi).
do_not_eat(mario_rossi, meat).
do_not_eat(mario_rossi, fish_seafood).
do_not_eat(mario_rossi, animal_derived).
has_medical_issues(mario_rossi).
has(mario_rossi, diabetes).
has(mario_rossi, high_blood_pressure).
has(mario_rossi, high_cholesterol).
has(mario_rossi, gastrointestinal_disorders).
has(mario_rossi, kidney_problems).
wants_to(mario_rossi, reach_healthy_weight).

has_dietary_restrictions(luigi_bianchi).
do_not_eat(luigi_bianchi, meat).
wants_to(luigi_bianchi, reach_healthy_weight).

has_dietary_restrictions(anna_dibari).
do_not_eat(anna_dibari, fish_seafood).
wants_to(anna_dibari, reach_healthy_weight).

has_dietary_restrictions(chiara_ranieri).
do_not_eat(chiara_ranieri, meat).
do_not_eat(chiara_ranieri, fish_seafood).
has_medical_issues(chiara_ranieri).
has(chiara_ranieri, diabetes).
wants_to(chiara_ranieri, reach_healthy_weight).

has_medical_issues(marica_accorsi).
has(marica_accorsi, high_blood_pressure).
wants_to(marica_accorsi, reach_healthy_weight).