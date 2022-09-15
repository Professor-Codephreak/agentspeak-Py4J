// questions

// 1. how to convert between atoms and strings.

// 2. how to atomic_list_concat/2,3


// 3. How to string comparison
// A. Can do .substring(A,), and maybe and .substring(B,A)

+!elicit_entry(Agent,Entry,Type) <-
	!flp_ask(['Please state your task/objective: '],Entry);
	.print(classify_entry(Agent,Entry,Type));
	!classify_entry(Agent,Entry,Type);
	.print(add_entry(Agent,Entry,Type));
	!add_entry(Agent,Entry,Type).

+!classify_entry(Agent,Entry,Type) <-
	!flp_ask(['Is it an objective or a task: '],Type);
	.print(type(Type)).

+!add_entry(Agent,Entry,objective) <-
	+hasObjective(Agent,Entry).

+!add_entry(Agent,Entry,task) <-
	+hasTask(Agent,Entry).

+hasObjective(Agent,Objective) : not currentlyObtainableForP(Agent,Objective) & not ~currentlyObtainableForP(Agent,Objective) <-
	!flp_ask(['Is it currently obtainable: '],Answer);
	.print('Answer: ',Answer);
	if (.substring(Answer,'yes')) {
			      .print("Yeha!");
			      +currentlyObtainableForP(Agent,Objective);
			      };
	if (.substring(Answer,'no')) {
				      .print("Boo hoo!");
				      +~currentlyObtainableForP(Agent,Objective);
				      }.

+currentlyObtainableForP(Agent,Objective) <-
	.print('Agent: ',Agent,' has Objective').

+~currentlyObtainableForP(Agent,Objective) <-
	.print('NOT Agent: ',Agent,' has Objective').

