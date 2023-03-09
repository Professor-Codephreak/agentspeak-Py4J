// query_agent_bindings(flp,'localhost',[X],cycQuery(isa(X,'Dog'),'BaseKB',X),Results);
// !sys(flp_query_cyc(isa(X,'Dog'),Results));

// +!queryCycTest <-
// 	!sys(flp_query_cyc(['',member(X,[a,b,c,d])],Results));
// 	.print('Cyc Query Results: ',Results).
