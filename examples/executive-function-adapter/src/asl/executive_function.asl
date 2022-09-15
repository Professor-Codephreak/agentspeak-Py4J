+p(X) <-
	.print("YAY!",X).

// FIXME: Do we need this vvv ?  If we enable it, it does not generate
// plans. if we disable it, then it might not input beliefs correctly

+Prolog[source(percept)] <-
 	+Prolog[source(self)].

+?x(Term) <-
	.concat('+',Term,Trigger);
	.relevant_plans(Trigger,RelevantPlans);
	.print('Relevant Plans: ',RelevantPlans);
	.length(RelevantPlans,L1);

	/* FIXME: originally L1 == 0, but the above source(percept)
	   code was messing it up, could not get it to do 0 or 1
	*/

	if (L1 == 1) {
		      .concat("+",Term," : true <- .print(\"x/1: \",",Term,").",Plan);
		      .print('Generated Plan: ',Plan);
		      .add_plan(Plan);
		     };
	Term;
	!waitOn(Term);
	?Term[source(self)];
	-Term[source(self)].

-?x(Term) <-
	.print('wah wah').

+!waitOn(Term) <-
	if (not .belief(Term)) {
				.wait(10);
				.print('.');
				!waitOn(Term)
			       }.

+query_agent_bindings(flp, localhost, _, flp_ask_user(Question, _), Results) <-
	+flp_ask_user(Question,Results).

+flp_ask_user('[|]'(Question,'[]'),Answer) <-
	-flp_ask_user('[|]'(Question,'[]'),Answer);
	+flp_ask_user([Question],Answer);
	.print('Converted: ',flp_ask_user([Question],Answer)).

-flp_ask_user('[|]'(Question,'[]'),Answer)[source(percept)] <-
	.print('Converting...').


+query_agent_bindings(flp, localhost, _, flp_query_flp(Query, _), Results) <-
	+flp_query_flp(Query,Results).

+flp_query_flp('[|]'(Query,'[]'),Response) <-
	-flp_query_flp('[|]'(Query,'[]'),Response);
	+flp_query_flp([Query],Response);
	.print('Converted: ',flp_query_flp([Query],Response)).

-flp_query_flp('[|]'(Query,'[]'),Response)[source(percept)] <-
	.print('Converting...').

+!run6 <-
	!initializeCommands;
	.wait(1000);
	!elicit_entry(andrewDougherty,Entry,Type);
	.print('Entry: ',Entry,'.  Type: ',Type).

{ include("/var/lib/myfrdcsa/collaborative/git/jason/examples/executive-function-adapter/src/asl/agent2.asl") }
{ include("/var/lib/myfrdcsa/collaborative/git/jason/examples/executive-function-adapter/src/asl/ef_agent.asl") }

!run6.