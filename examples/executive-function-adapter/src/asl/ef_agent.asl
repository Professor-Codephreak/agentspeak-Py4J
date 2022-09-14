+!elicit_entry(Agent,Entry,Type) <-
	!flp_ask(['Please state your task/objective: '],Entry);
	.print('ENTRY HERE: ',Entry);
	!classify_entry(Agent,Entry,Type);
	!add_entry(Agent,Entry,Type).

+!classify_entry(Agent,Entry,Type) <-
	!flp_ask(['Please review: ',Entry,'.  Is it an objective or a task: '],Type);
	!add_entry(Agent,Entry,Type).

+!add_entry(Agent,Entry,Type) : Type == 'objective' <-
	+hasObjective(Agent,Entry).

+!add_entry(Agent,Entry,Type) : Type == 'task' <-
	+hasTask(Agent,Entry).

+hasObjective(Agent,Objective) : not currentlyObtainableForP(Agent,Objective) & not ~currentlyObtainableForP(Agent,Objective) <-
	!flp_ask(['Consider this objective: ',Objective,'.  Is it currently obtainable for: ',Agent,'.  yes or no?: '],Answer);
	if (Answer == 'yes') {
			      +currentlyObtainableForP(Agent,Objective);
			      };
	if (Answer == 'no') {
			     +~currentlyObtainableForP(Agent,Objective);
			     }.
