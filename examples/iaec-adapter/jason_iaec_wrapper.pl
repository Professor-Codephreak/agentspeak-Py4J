:- dynamic flag/2,isa/2.
:- multifile flag/2,isa/2.
:- discontiguous flag/2,isa/2.

:- ensure_loaded('/var/lib/myfrdcsa/codebases/minor/strads-frdcsa/attempts/9/util.pl').

isa(iaec,actor).

flag(jasonIntegration,true).

%% :- consult('/var/lib/myfrdcsa/codebases/minor/agentspeak-frdcsa/jason/environments/iaec/situated_agent.pl').

jpl_execute_action(Agent,Action,Result) :-
	log(1,jpl_execute_action(Agent,Action,Result)),
	(   call(Action) -> Result = true ; Result = fail).

jpl_perceive(Agent,Percepts,Result) :-
	Percepts = [],
	Result = true.

%% https://www.swi-prolog.org/pldoc/doc/_SWI_/library/jpl.pl

%% jpl_call(+X, +MethodName:atom, +Params:list(datum), -Result:datum) is det.

%% 192.168.121.55

executable_file(A) :-
	fail.

has_filename_extension(A,B) :-
	B = 'pdf'.

has_mime_type(A,B) :-
	B = 'pdf'.

has_corresponding_text_file(A,B) :-
	B = '/home/andrewdo/morbini-phd-thesis.txt'.

