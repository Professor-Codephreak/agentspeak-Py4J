+!queryCycTest <-
	query_agent_bindings(flp,'localhost',[X],cycQuery(isa(X,'Dog'),'BaseKB',X),Results);
	.print('Cyc Query Results: ',Results).
