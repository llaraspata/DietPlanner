:- consult('fact_person.pl').

% ---------------------------------------------------------------------------------------------------------------------------------------
% RULES
% ---------------------------------------------------------------------------------------------------------------------------------------

%ATTENZIONE: Bisognerebbe aggiungere le motivazioni per cui si fanno queste domande, motivazione che compare quando viene premuto "WHY"

%domande
%testo
domanda(d1,'Hai restrizioni alimentari da segnalare?').
domanda(d2,'Mangi carne?').
domanda(d3,'Mangi pesce e frutti di mare?').
domanda(d4,'Mangi cibi derivati da animali?').

domanda(d5,'Hai da segnalare delle condizioni mediche particolari, o malattie croniche ?').
domanda(d6,'Hai il diabete?').
domanda(d7,'Soffri di ipertensione arteriosa?').
domanda(d8,'Hai il colesterolo alto?').
domanda(d9,'Soffri di disturbi gastro-intestinali?').
domanda(d10,'Soffri di problemi renali?').

%da sottoporre in base al bmi
domanda(d11,'Vuoi raggiungere semplicemente il tuo peso forma?').
domanda(d12,'Vuoi raggiungere il tuo peso forma e aumentare la tua massa muscolare?').
domanda(d13,'Vuoi raggiungere il tuo peso forma e dimunuire la percentuale di grasso corporeo?').

domanda(d14,'Ti reputi capace di seguire in modo rigoroso la dieta?').
domanda(d15,'Fai attenzione ai valori nutrizionali di cio che mangi?').


%quando premo il pulsante per avviare la creazione della dieta parte una chiamata al predicato run_inference(Nome, Cognome)

dieta per diabetici
dieta per colesterolo alto
dieta per disturbi gasto-intestinali
dieta per problemi renali

dieta vegetariana 
dieta vegana

dieta equilibrata
dieta equilibrata senza pesce
dieta equilibrata senza carne
dieta iperproteica
dieta iperproteica senza pesce
dieta iperproteica senza carne
dieta ipocalorica
dieta ipocalorica senza pesce
dieta ipocalorica senza carne


testo(r1,'si').
testo(r2,'no').

%domanda
%risposte possibili per ogni domanda
risposta(d1,r1).
risposta(d1,r2).
risposta(d2,r1).
risposta(d2,r2).
risposta(d3,r1).
risposta(d3,r2).
risposta(d4,r1).
risposta(d4,r2).
risposta(d5,r1).
risposta(d5,r2).
risposta(d6,r1).
risposta(d6,r2).
risposta(d7,r1).
risposta(d7,r2).
risposta(d8,r1).
risposta(d8,r2).
risposta(d9,r1).
risposta(d9,r2).
risposta(d10,r1).
risposta(d10,r2).
risposta(d11,r1).
risposta(d11,r2).
risposta(d12,r1).
risposta(d12,r2).
risposta(d13,r1).
risposta(d13,r2).


%domanda
%domanda correlata ad altra domanda
correlata(d1,d2).
correlata(d1,d3).
correlata(d2,d4).
correlata(d3,d4).
correlata(d5,d6).
correlata(d5,d7).
correlata(d5,d8).
correlata(d5,d9).
correlata(d5,d10).
correlata(d11,d12).
correlata(d12,d13).



run_inference(User) :-
    retractall(user_goal(User, _)), % Rimuovi eventuali obiettivi precedenti
    ask_user(User), % Fai domande all'utente
    select_foods(User, Foods), % Seleziona gli alimenti in base all'obiettivo
    % Logica per creare un piano dietetico basato sugli alimenti selezionati
    write("Ecco il tuo piano dietetico: "), nl,
    print_foods(Foods).

ask_user(User) :-
    write("Qual è il tuo obiettivo dietetico? (perdita di peso / aumento di massa / mantenimento) "),
    read(Goal),
    assert(user_goal(User, Goal)).





%rule intermedie

max_member(Max,[H|T]) :- max_member_(T,H,Max).
max_member_([], Max0, Max) :- Max = Max0.
max_member_([H|T], Max0, Max) :- ( H@=
 Max0 -> max_member_(T, Max0, Max);  max_member_(T, H, Max)).

min_member(Min,[H|T]) :- min_member_(T,H,Min).
min_member_([], Min0, Min) :- Min = Min0.
min_member_([H|T], Min0, Min) :- ( H@>= Min0 -> min_member_(T, Min0, Min);  min_member_(T, H, Min)).

get_priorita(L,D) :- 
						\+list_empty([], L), 
						findall(PR-D,(domanda(D), member(D,L), priorita(D,PR)), DPR),
						max_member(PR-D,DPR).

get_necessita(L,C) :- 
						\+list_empty([], L), 
						findall(NE-Z,(domanda(Z), member(Z,L), livello_correlazione(D,Z,NE)), NEC),
						max_member(NE-C,NEC).

get_numero_domande_disponibili(P,MA,X,N) :- 
								findall(Y,(tipo_argomento(A,MA),argomento(Y,A),\+ha_risposto(P,Y,_)),L),
								sort(L,X), 
								length(X,N).

get_numero_domande_argomento(A,L,N) :- 
								findall(X,argomento(X,A),L), 
								length(L,N).

richiesto(P,A):- 
				completezza_argomento(P,A,Z),Z<1.

controllo_paziente(X,P,A,Y):- 
								rivolto_a(X,P),
								richiesto(P,A),
								\+ha_risposto(P,Y,_).

controllo_domanda(X,P,A,Y):- 
								\+inserita(Y,X),
								controllo_paziente(X,P,A,Y).

controllo_domanda_e_risposta(X,P,A,Y,C,R):-
											controllo_domanda(X,P,A,Y),
											ha_risposto(P,C,R). 

controllo_completezza_argomento(P,Y,MA,A):-
											findall(CA-A,(tipo_argomento(A,MA), argomento(Y,A), completezza_argomento(P,A,CA)), CAM),
											min_member(CA-A,CAM).




%rule
%INCLUDE_DOMANDA

include_domanda(X,P,d1,'cibo',Z):- 	
									controllo_completezza_argomento(P,d1,'cibo',A),
									controllo_domanda_e_risposta(X,P,A,d1,d14,'pranzo').
include_domanda(X,P,d1,'cibo',Z):- 	
									controllo_completezza_argomento(P,d1,'cibo',A),
									controllo_domanda_e_risposta(X,P,A,d1,d14,'spuntino').

include_domanda(X,P,d1,'cibo',Z):- 	
									controllo_completezza_argomento(P,d1,'cibo',A),
									controllo_domanda_e_risposta(X,P,A,d1,d14,'cena').
include_domanda(X,P,d1,'cibo',Z):- 	
									controllo_completezza_argomento(P,d1,'cibo',A),
									controllo_domanda(X,P,A,d1),
									discrimina_argomento(X,P,d1,A,Z).
include_domanda(X,P,d1,'cibo',Z):- 	
									controllo_completezza_argomento(P,d1,'cibo',A),
									controllo_domanda(X,P,A,d1).
include_correlata(X,P,d1,d3,'colazione'):-
									controllo_domanda(X,P,a1,d3).
discrimina_argomento(X,P,d1,a1,Z):-
									findall(C,include_correlata(X,P,d1,C,'colazione'),L),
									get_necessita(L,Z).
discrimina_argomento(X,P,d1,a3,Z,C):-
									findall(C,include_correlata(X,P,d1,C,'abitudini_alimentari'),L),
									get_necessita(L,Z).
									



include_domanda(X,P,d2,'cibo',Z):- 	
									controllo_completezza_argomento(P,'cibo',A),
									controllo_domanda(X,P,A,d2).



include_domanda(X,P,d3,'cibo',Z):- 	
									testo_argomento(A,'colazione'),
									controllo_domanda_e_risposta(X,P,A,d3,d1,'tutte_le_mattine').
include_domanda(X,P,d3,'cibo',Z):- 	
									testo_argomento(A,'colazione'),
									controllo_domanda_e_risposta(X,P,A,d3,d1,'spesso').
include_domanda(X,P,d3,'cibo',Z):- 	
									testo_argomento(A,'colazione'),
									controllo_domanda_e_risposta(X,P,A,d3,d1,'a_volte').
include_domanda(X,P,d3,'cibo',Z):- 	
									testo_argomento(A,'colazione'),
									controllo_domanda(X,P,A,d3),
									inserita(d1,X).



include_domanda(X,P,d4,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda(X,P,A,d4).
							


include_domanda(X,P,d5,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda_e_risposta(X,P,A,d5,d13,'3-5').
include_domanda(X,P,d5,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda_e_risposta(X,P,A,d5,d13,'>_5').
include_domanda(X,P,d5,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda_e_risposta(X,P,A,d5,d14,'colazione').
include_domanda(X,P,d5,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda_e_risposta(X,P,A,d5,d14,'pranzo').
include_domanda(X,P,d5,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda_e_risposta(X,P,A,d5,d14,'cena').




include_domanda(X,P,d6,'cibo',Z):- 	
									testo_argomento(A,'disturbi_alimentari'),
									controllo_domanda(X,P,A,d6).
					


include_domanda(X,P,d7,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d7,d14,'colazione').
include_domanda(X,P,d7,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d7,d14,'spuntino').
include_domanda(X,P,d7,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d7,d14,'cena').
						
						


include_domanda(X,P,d8,'sport',Z):- 	
									testo_argomento(A,'attivita_fisica'),
									controllo_domanda_e_risposta(X,P,A,d8,d10,'si').
include_domanda(X,P,d8,'sport',Z):- 	
									testo_argomento(A,'attivita_fisica'),
									controllo_domanda(X,P,A,d8),
									inserita(d10,X).	

						

include_domanda(X,P,d9,'cibo',Z):- 	
									testo_argomento(A,'disturbi_alimentari'),
									controllo_domanda(X,P,A,d9).	



include_domanda(X,P,d10,'sport',Z):- 	
									testo_argomento(A,'attivita_fisica'),
									controllo_domanda(X,P,A,d10).
include_correlata(X,P,d10,d8,'sport'):-
									include_domanda(X,P,d8,'sport',Z).													
include_correlata(X,P,d10,d11,'sport'):-
									include_domanda(X,P,d11,'sport',Z).



include_domanda(X,P,d11,'sport',Z):- 	
									testo_argomento(A,'attivita_fisica'),
									controllo_domanda_e_risposta(X,P,A,d11,d10,'si').
include_domanda(X,P,d11,'sport',Z):- 	
									testo_argomento(A,'attivita_fisica'),
									controllo_domanda(X,P,A,d11),
									inserita(d10,X).								
							


include_domanda(X,P,d12,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d12),
									\+ha_risposto(d22,X).
include_domanda(X,P,d12,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d12),
									\+inserita(d22,X).
							


include_domanda(X,P,d13,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d13).
include_correlata(X,P,d13,d14,'cibo'):-
									include_domanda(X,P,d14,'cibo',Z).




include_domanda(X,P,d14,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda_e_risposta(X,P,A,d14,d13,'<_2').
include_domanda(X,P,d14,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d14),
									inserita(d13,X).
include_domanda(X,P,d14,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d14),
									\+ha_risposto(d23,X).
include_domanda(X,P,d14,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d14),
									\+inserita(d23,X).



include_domanda(X,P,d15,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d15).	



include_domanda(X,P,d16,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d16,d14,'colazione').
include_domanda(X,P,d16,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d16,d14,'spuntino').
include_domanda(X,P,d16,'cibo'):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d16,d14,'cena').
include_domanda(X,P,d16,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda(X,P,A,d16).							
							



include_domanda(X,P,d17,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d17,d16,'al_bar_o_al_ristorante').
include_domanda(X,P,d17,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d17,d16,'fast_food').
include_domanda(X,P,d17,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda_e_risposta(X,P,A,d17,d16,'porto_il_cibo_da_casa').
include_domanda(X,P,d17,'cibo',Z):- 	
									testo_argomento(A,'pranzo'),
									controllo_domanda(X,P,A,d17).	
							



include_domanda(X,P,d18,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda(X,P,A,d18),
									\+ha_risposto(d21,X).
include_domanda(X,P,d18,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda(X,P,A,d18),
									\+inserita(d21,X).								
include_correlata(X,P,d18,d19,'cibo'):-
									include_domanda(X,P,d19,'cibo',Z).



include_domanda(X,P,d19,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda_e_risposta(X,P,A,d19,d18,'sempre').
include_domanda(X,P,d19,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda_e_risposta(X,P,A,d19,d18,'molto_spesso').
include_domanda(X,P,d19,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda_e_risposta(X,P,A,d19,d18,'spesso').
include_domanda(X,P,d19,'cibo',Z):- 	
									testo_argomento(A,'nutrizione'),
									controllo_domanda(X,P,A,d19),
									inserita(d18,X).
		


include_domanda(X,P,d20,'cibo',Z):- 	
									controllo_completezza_argomento(P,d20,'cibo',A),
									controllo_domanda(X,P,A,d20).						


include_domanda(X,P,d21,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d21),
									\+ha_risposto(d18,X).
include_domanda(X,P,d21,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d21),
									\+inserita(d18,X).	



include_domanda(X,P,d22,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d22),
									\+ha_risposto(d12,X).
include_domanda(X,P,d22,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d22),
									\+inserita(d12,X).									
							


include_domanda(X,P,d23,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d23),
									\+ha_risposto(d14,X).
include_domanda(X,P,d23,'cibo',Z):- 	
									testo_argomento(A,'abitudini_alimentari'),
									controllo_domanda(X,P,A,d23),
									\+inserita(d14,X).	