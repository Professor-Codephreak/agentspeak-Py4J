:- ensure_loaded('/var/lib/myfrdcsa/codebases/minor/free-life-planner/lib/util/util.pl').

:- use_module(library(shell)).

directoryP(_) :-
	true.

basenameP(BaseName) :-
	file_base_name(X,X).

currentDirectory(Dir) :-
	shell_command_to_string(pwd,TmpDir),
	normalize_space(atom(Dir),TmpDir),
	writeln(Dir).

%% systemCall(Command,Result) :-
%% 	shell_command_to_string(Command,Result).

%% is query_agent_bindings available here

flp_ask_user(Question,TheAnswer) :-
	listing(query_agent_bindings),
	Question = [FirstQuestion|_],
	user:query_agent_bindings(flp, localhost, [Answer], flp_ask_user(FirstQuestion, Answer), [[TheAnswer]]).


