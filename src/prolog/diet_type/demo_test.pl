% ---------
% Naive User's Data
% ---------

% Adriano Meis -> vegan
fact(has_dietary_restrictions(adriano_meis)).
fact(do_not_eat(adriano_meis, meat)).
fact(do_not_eat(adriano_meis, fish_seafood)).
fact(do_not_eat(adriano_meis, animal_derived)).

% Mattia Pascal -> vegetarian
fact(has_dietary_restrictions(mattia_pascal)).
fact(do_not_eat(mattia_pascal, meat)).
fact(do_not_eat(mattia_pascal, fish_seafood)).

% Romina Pescatore -> diabetic 
fact(has_medical_issues(romilda_pescatore)).
fact(has(romilda_pescatore, diabetes)).

% Anselmo Paleari -> high cholesterol
fact(has_medical_issues(anselmo_paleari)).
fact(has(anselmo_paleari, high_blood_pressure)).
fact(has(anselmo_paleari, high_cholesterol)).

% Silvia Caporale -> gastrointestinal disorder
fact(has_medical_issues(silvia_caporale)).
fact(has(silvia_caporale, gastrointestinal_disorders)).

% Terenzio Papiano -> kidney problems
fact(has_medical_issues(terenzio_papiano)).
fact(has(terenzio_papiano, kidney_problems)).

% Luigi Pirandello -> healthy weight
fact(wants_to(luigi_pirandello, reach_healthy_weight)).

% Giacomo Leopardi -> healthy weight no meat
fact(has_dietary_restrictions(giacomo_leopardi)).
fact(do_not_eat(giacomo_leopardi, meat)).
fact(wants_to(giacomo_leopardi, reach_healthy_weight)).

% Oscar Wilde -> healthy weight no fish seafood
fact(has_dietary_restrictions(oscar_wilde)).
fact(do_not_eat(oscar_wilde, fish_seafood)).
fact(wants_to(oscar_wilde, reach_healthy_weight)).

% Dacia Maraini -> hyperproteic
fact(wants_to(dacia_maraini, increase_muscle_mass)).

% Virginia Woolf -> hyperproteic no meat
fact(has_dietary_restrictions(virginia_woolf)).
fact(do_not_eat(virginia_woolf, meat)).
fact(wants_to(virginia_woolf, increase_muscle_mass)).

% Jojo Moyes -> hyperproteic no fish seafood
fact(has_dietary_restrictions(jojo_moyes)).
fact(do_not_eat(jojo_moyes, fish_seafood)).
fact(wants_to(jojo_moyes, increase_muscle_mass)).

% Emily Bronte -> hypocaloric
fact(wants_to(emily_bronte, reduce_body_fat)).

% Jane Austen -> hypocaloric no meat
fact(has_dietary_restrictions(jane_austen)).
fact(do_not_eat(jane_austen, meat)).
fact(wants_to(jane_austen, reduce_body_fat)).

% PierPaolo Pasolini -> hypocaloric no fish seafood
fact(has_dietary_restrictions(pierpaolo_pasolini)).
fact(do_not_eat(pierpaolo_pasolini, fish_seafood)).
fact(wants_to(pierpaolo_pasolini, reduce_body_fat)).

% ---------
% Realistic User's Data
% ---------

fact(has_dietary_restrictions(mario_rossi)).
fact(do_not_eat(mario_rossi, meat)).
fact(do_not_eat(mario_rossi, fish_seafood)).
fact(do_not_eat(mario_rossi, animal_derived)).
fact(has_medical_issues(mario_rossi)).
fact(has(mario_rossi, diabetes)).
fact(has(mario_rossi, high_blood_pressure)).
fact(has(mario_rossi, high_cholesterol)).
fact(has(mario_rossi, gastrointestinal_disorders)).
fact(has(mario_rossi, kidney_problems)).
fact(wants_to(mario_rossi, reach_healthy_weight)).

fact(has_dietary_restrictions(luigi_bianchi)).
fact(do_not_eat(luigi_bianchi, meat)).
fact(wants_to(luigi_bianchi, reach_healthy_weight)).

fact(has_dietary_restrictions(anna_dibari)).
fact(do_not_eat(anna_dibari, fish_seafood)).
fact(wants_to(anna_dibari, reach_healthy_weight)).

fact(has_dietary_restrictions(chiara_ranieri)).
fact(do_not_eat(chiara_ranieri, meat)).
fact(do_not_eat(chiara_ranieri, fish_seafood)).
fact(has_medical_issues(chiara_ranieri)).
fact(has(chiara_ranieri, diabetes)).
fact(wants_to(chiara_ranieri, reach_healthy_weight)).

fact(has_medical_issues(marica_accorsi)).
fact(has(marica_accorsi, high_blood_pressure)).
fact(wants_to(marica_accorsi, reach_healthy_weight)).
