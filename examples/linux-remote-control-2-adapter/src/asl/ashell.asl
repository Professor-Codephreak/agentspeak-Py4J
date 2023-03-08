+!elicit_ashell_command(Agent,PreviousOutput,Command,Output) <-
	!flp_ask_ws([PreviousOutput,'AShell Command: '],Command);
	.print(process_ashell_command(Agent,Command,Output));
	!process_ashell_command(Agent,Command,Output);
	!elicit_ashell_command(Agent,Output,Command2,Output2).

+!process_ashell_command(Agent,Command,Output) <-
	!sys(Command,Output);
	.print(process_ashell_command(Agent,Command,Output)).
