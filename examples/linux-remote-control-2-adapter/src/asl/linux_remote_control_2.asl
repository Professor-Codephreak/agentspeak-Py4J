+p(X) <-
	.print("YAY!",X).


//+doTest(X) <-
// 	.print('WTF: doTest(',X,').').

+!run <-
	// doTest(test);
	!x(directory_files('/var/lib/myfrdcsa/collaborative/git/jason',X));
	.print('MY FILES: ',X).

// +directory_files(A,B)[source(percept)] <-
// 	+directory_files(A,B)[source(self)].

// +Prolog[source(percept)] : Prolog =.. [Pred|_] & member(Pred,[directory_files]) <-
// 	+Prolog[source(self)].

+Prolog[source(percept)] <-
	+Prolog[source(self)].

+!x(Term) <-
	Term;
	.wait(50);
	// .print('DID THIS REALLY WORK?');
	?Term[source(self)].

// +!run <-
// 	doTest(test);
// 	directory_files('/var/lib/myfrdcsa/collaborative/git/jason/src',X);
// 	.wait(100);
// 	?directory_files(Y,Zs)[source(self)];
// 	// .findall(Z,directory_files(Y,Z)[source(self)],Zs);
// 	.print('MY PERSONS: ',Zs).

// //	findall(X,member(X,[a,b,c,d]),Xs);
// //	query_agent_bindings(flp,'localhost',[Persons],allInstances(person,Persons),Results).
	
!run.

// Should probably have an action that asserts into FreeKBS2 for long
// time storage.  need to finish query/retractall.
+query_agent_bindings(flp, localhost, _, allInstances(person, _), Persons) <-
	.print('PERSONS: ',Persons).