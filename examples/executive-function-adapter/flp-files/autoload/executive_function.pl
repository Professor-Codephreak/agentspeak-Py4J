%% FIXME: eventually have this ask the user
flp_ask_user(Question,Answer) :-
	view([flp_ask_user(Question,Answer)]),
	hasCannedReply(Question,Answer),
	view([answer,Answer]).
	%% sleep(1).

flp_query_flp(Query,Response) :-
	view([flp_query_flp(Query,Response)]),
	findall(Query,call(Query),Response),
	view([responses,Response]).
