+p(X) <-
	.print("YAY!",X).

+directory_files(A,B) <-
	.print('MY: directory_files(',A,',',B,').').

+doTest(X) <-
	.print('WTF: doTest(',X,').').

+!run <-
	doTest(test);
	directory_files('/var/lib/myfrdcsa/collaborative/git/jason/src',X);
	findall(X,member(X,[a,b,c,d]),Xs);
	query_agent_bindings(flp,'localhost',[Persons],allInstances(person,Persons),Results).
	
!run.

// Should probably have an action that asserts into FreeKBS2 for long
// time storage.  need to finish query/retractall.
+query_agent_bindings(flp, localhost, _, allInstances(person, _), Persons) <-
	.print('PERSONS: ',Persons).