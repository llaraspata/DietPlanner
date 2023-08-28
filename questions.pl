:- reconsult('knowledgeBase.pl').

% ---------------------------------------------------------------------------------------------------------------------------------------
% RULES
% ---------------------------------------------------------------------------------------------------------------------------------------

%ATTENZIONE: Bisognerebbe aggiungere le motivazioni per cui si fanno queste domande, motivazione che compare quando viene premuto "WHY"

%domande
%testo
domanda(d1,'A quanto ammonta il tuo peso attuale?').
domanda(d2,'A quanto ammonta la tua altezza in centimetri?').
domanda(d3,'Quanti anni hai?').
domanda(d4,'Sei uomo o donna?').
domanda(d5,'Hai delle intolleranze alimentari?').
domanda(d6,'A cosa sei intollerante?').
domanda(d7,'Hai altre intolleranze?').
domanda(d8,'Come definisci la tua vita, dinamica o sedentaria?').
domanda(d8,'Pratichi attivita sportiva durante la settimana?').
domanda(d9,'Quale attivita sportiva svolgi?').
domanda(d10,'Fai altre attivita sportive?').
domanda(d11,'Quali attivita svolgi durante la settimana?').
domanda(d12,'Quante volte pratichi questa attivita in una settimana?').
domanda(d13,'Per quanto tempo mediamente pratichi questa attivita durante la settimana?').
domanda(d14,'Fai altre attivita?').
domanda(d15,'Cammini durante la settimana?').
domanda(d16,'Quale tipologia di camminata pratichi?').
domanda(d17,'Fai altri tipi di camminata pratichi?').
domanda(d18,'Quanti litri di acqua bevi ogni giorno?').
domanda(d19,'Assumi alcolici?').
domanda(d20,'Bevi bevande gassate o zuccherate?').

%risposte
%testo 
risposta(r1,'dinamica').
risposta(r2,'sedentaria').
risposta(r3,'uomo').
risposta(r4,'donna').
risposta(r6,'si').
risposta(r7,'no').


%domanda
%risposte possibili per ogni domanda
risposta(d1,r1).
risposta(d1,r2).
risposta(d1,r3).
risposta(d1,r4).
risposta(d1,r16).
risposta(d2,r5).
risposta(d2,r6).
risposta(d2,r7).
risposta(d2,r8).
risposta(d2,r9).
risposta(d4,r10).
risposta(d4,r11).
risposta(d4,r12).
risposta(d4,r13).
risposta(d6,r14).
risposta(d6,r15).
risposta(d6,r2).
risposta(d6,r3).
risposta(d6,r16).
risposta(d7,r17).
risposta(d7,r18).
risposta(d7,r19).
risposta(d8,r20).
risposta(d8,r21).
risposta(d8,r22).
risposta(d8,r23).
risposta(d9,r14).
risposta(d9,r15).
risposta(d9,r2).
risposta(d9,r3).
risposta(d9,r16).
risposta(d10,r24).
risposta(d10,r25).
risposta(d12,r26).
risposta(d12,r27).
risposta(d12,r28).
risposta(d12,r29).
risposta(d13,r30).
risposta(d13,r31).
risposta(d13,r32).
risposta(d14,r44).
risposta(d14,r45).
risposta(d14,r46).
risposta(d14,r47).
risposta(d15,r33).
risposta(d15,r34).
risposta(d15,r35).
risposta(d16,r36).
risposta(d16,r37).
risposta(d16,r38).
risposta(d16,r39).
risposta(d18,r14).
risposta(d18,r15).
risposta(d18,r2).
risposta(d18,r3).
risposta(d18,r16).
risposta(d19,r40).
risposta(d19,r41).
risposta(d19,r42).
risposta(d19,r43).
risposta(d20,r14).
risposta(d20,r15).
risposta(d20,r2).
risposta(d20,r3).
risposta(d20,r16).
risposta(d21,r14).
risposta(d21,r15).
risposta(d21,r2).
risposta(d21,r3).
risposta(d21,r16).
risposta(d22,r26).
risposta(d22,r27).
risposta(d22,r28).
risposta(d22,r29).

%domanda
%domanda correlata ad altra domanda
correlata(d1,d3).
correlata(d10,d11).
correlata(d10,d8).
correlata(d13,d14).
correlata(d18,d19).


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
			
							
							
							

