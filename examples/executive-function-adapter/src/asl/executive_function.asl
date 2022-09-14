+p(X) <-
	.print("YAY!",X).

// FIXME: Do we need this vvv ?  If we enable it, it does not generate
// plans. if we disable it, then it might not input beliefs correctly

+flp_ask_user('[|]'(Question,'[]'),Answer) <-
	-flp_ask_user('[|]'(Question,'[]'),Answer);
	+flp_ask_user([Question],Answer);
	.print('Converted: ',flp_ask_user([Question],Answer)).

-flp_ask_user('[|]'(Question,'[]'),Answer)[source(percept)] <-
	.print('Converting...').

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
		      .concat("+",Term," : true <- .print(\"x/1\",",Term,").",Plan);
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

+!run1 <-
	!x(directory_files('/var/lib/myfrdcsa/collaborative/git/jason',X));
	.print('MY FILES: ',X).

+!run2 <-
	!x(member(X,[a,b,c]));
	.print('MY MEMBERS: ',Persons).

+!run3 <-
	!x(flp([Persons],allInstances(person,Persons)));
	.print('MY PERSONS: ',Persons).

+!run4 <-
	// !x(flp([Persons],allInstances(person,Persons)));
	flp([Persons],allInstances(person,Persons));
	.wait(2000);
	?flp([Persons],allInstances(person,Persons));
	.print('MY PERSONS: ',Persons).

// +query_agent_bindings(flp, localhost, _, allInstances(person, _), Persons) <-
// 	.print('THE PERSONS: ',Persons).

+query_agent_bindings(flp, localhost, _, allInstances(person, _), Persons) <-
	+allInstances(person,Persons).

+query_agent_bindings(flp, localhost, _, flp_ask_user(Question, _), Results) <-
	+flp_ask_user(Question,Results).

+!run5 <-
	query_agent_bindings(flp,'localhost',[Persons],allInstances(person,Persons),Results);
	.print('IS THIS ALREADY ANSWERED?: ',Results).

// !run1.

// !run2.

// !run3.

// !run4.

// !run5.

// !pwd(Dir).
// !cd(Dir,'/tmp').

// +!test <-
// 	!sys(pwd,Result);
// 	.print('Result: ',Result);
// 	!chomp(Result,Chomped);
// 	.print('Chomped: ',Chomped);
// 	!cd(Chomped,'/tmp');
// 	!sys(pwd,NewResult);
// 	.print('NewResult: ',NewResult);
// 	!chomp(NewResult,NewChomped);
// 	.print('NewChomped: ',NewChomped).

// +!test(I) <-
// 	.print('I: ',I);
// 	!sys(pwd,Result);
// 	.print('Result: ',Result);
// 	!chomp(Result,Chomped);
// 	.print('Chomped: ',Chomped);
// 	!cd(Chomped,'/tmp');
// 	!sys(pwd,NewResult);
// 	.print('NewResult: ',NewResult);
// 	!chomp(NewResult,NewChomped);
// 	.print('NewChomped: ',NewChomped);
// 	if (I < 100) {
// 		     !test(I + 1);
//         }.

+!test(I) <-
	.print('I: ',I);
	!sys(pwd,Result);
	.print('Result: ',Result);
	!chomp(Result,Chomped);
	.print('Chomped: ',Chomped);
	if (I < 100) {
		      .wait(200);
		     !test(I + 1);
        }.

-!test(_) <-
	true.

// !test(1).


+!run6 <-
	!initializeCommands;
	.wait(1000);
	!elicit_entry(andrewDougherty,Entry,Type);
	.print('Entry: ',Entry,'.  Type: ',Type).

!run6.


////////////////////////////////////////////////////////////////////////////////////

// Should probably have an action that asserts into FreeKBS2 for long
// time storage.  need to finish query/retractall.

// +Prolog[source(percept)] : Prolog =.. [Pred|_] & member(Pred,[directory_files]) <-
// 	+Prolog[source(self)].

/* { include("/var/lib/myfrdcsa/codebases/minor/agentspeak-frdcsa/jason/environments/executive-function/agent2.asl") }
   { include("/var/lib/myfrdcsa/codebases/minor/agentspeak-frdcsa/jason/environments/executive-function/ef_agent.asl") }
*/

{ include("/var/lib/myfrdcsa/collaborative/git/jason/examples/executive-function-adapter/src/asl/agent2.asl") }
{ include("/var/lib/myfrdcsa/collaborative/git/jason/examples/executive-function-adapter/src/asl/ef_agent.asl") }