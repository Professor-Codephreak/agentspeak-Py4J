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

%% %% FIXME: This is all wrong VVV
%% %% Formalog::UniLangProxy
%% send_message_to_executive_function(UserName,Message,Result) :-
%%  	connectToUniLang('Agent1','Yaswi1',Connection),
%% 	perl5_method(Connection,'ShinyCMS::Controller::FRDCSA::Codebases::Minor::Executive_Function::MessageClients',['_perl_hash','username',UserName,'message',Message],Result),
%%  	view([myResult,Result]).

flp_ask_ws_user(Query,Answer) :-
	correctLists(Query,QueryCorrected),
	view([flp_ask_ws_user(QueryCorrected,Response)]),
	atomic_list_concat(Query,'',TmpQueryAtom),
	atom_concat('call ',TmpQueryAtom,QueryAtom),
	view([queryAtom,QueryAtom]),
	atomic_list_concat(['unilang-client -q -r FCMS -c "',QueryAtom,'"'],'',Command),
	shell_command_to_string(Command,Result),
	view([result,Result]),
	flp_ask_user(Query,Answer).

%% flp_ask_user(QueryCorrected,Answer).

efa_respond_to_jason(List) :-
	view([list,List]),
	List = [username,UserName,message,Message],
	query_agent_bindings(jasonExecutiveFunction,'localhost',[TmpResults],assertz(messageQueue(efaMessage(Message))),TmpTmpResults).
