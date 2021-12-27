// +continue : not (dead(wife) & dead(husband)) <-
// 	continue.

+do(husband,insult(husband,wife)) <-
	do(wife,nothing).

+do(A,nothing)[_Annotations] <-
	// ?not(dead(A));
	do(A,nothing).


// /var/lib/myfrdcsa/codebases/minor/strads-frdcsa/attempts/9/security/security_rules.pl