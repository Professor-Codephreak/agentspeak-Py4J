+!elicit_entry(Agent,Entry,Type) <-
	!flp_ask(['Please state your task/objective: '],Entry);
	.wait(2000);
	.print(classify_entry(Agent,Entry,Type));
	!classify_entry(Agent,Entry,Type);
	.print(add_entry(Agent,Entry,Type));
	!add_entry(Agent,Entry,Type).

+!classify_entry(Agent,Entry,Type) <-
	/* .atom_concat('Please review: ',Entry,'.  Is it an objective or a task: ',Question);
	   !flp_ask([Question],Type);*/
	!flp_ask(['Is it an objective or a task: '],Type);
	.wait(2000);
	.print(type(Type)).

+!add_entry(Agent,Entry,objective) <-
	+hasObjective(Agent,Entry).

+!add_entry(Agent,Entry,task) <-
	+hasTask(Agent,Entry).

+hasObjective(Agent,Objective) : not currentlyObtainableForP(Agent,Objective) & not ~currentlyObtainableForP(Agent,Objective) <-
	/* .concat('Consider this objective: ',Objective,'.  Is it currently obtainable for: ',Agent,'.  yes or no?: ',Question);
	   !flp_ask([Question],Answer);*/
	!flp_ask(['Is it currently obtainable: '],Answer);
	.wait(2000);
	.print('Answer',Answer);
	if (Answer == 'yes') {
			      .print("Yeha!");
			      +currentlyObtainableForP(Agent,Objective);
			      };
	if (Answer == 'no') {
			      .print("Boo hoo!");
			     +~currentlyObtainableForP(Agent,Objective);
			     }.

+currentlyObtainableForP(Agent,Objective) <-
	.print('Agent: ',Agent,' has Objective').

+~currentlyObtainableForP(Agent,Objective) <-
	.print('NOT Agent: ',Agent,' has Objective').