import jason.asSyntax.Literal;
import jason.asSyntax.Structure;
import jason.environment.Environment;

import org.jpl7.Util;
import org.jpl7.Compound;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

public class StrategicDefenseAdapterEnv extends Environment {

    Literal init0  = Literal.parseLiteral("continue");
    Literal init1  = Literal.parseLiteral("do(husband,insult(husband,wife))");
    Literal init2  = Literal.parseLiteral("do(wife,nothing)");

    @Override
    public void init(String[] args) {
	Query.oneSolution("consult('jason_strategic_defense_wrapper.pl')");
        // initial percepts
        addPercept(init1);
        addPercept(init2);
    }

    /**
     * Implementation of the agent's basic actions
     */
    @Override
    public boolean executeAction(String ag, Structure act) {
        System.out.println("Agent "+ag+" is doing "+act);

        clearPercepts();

	try {
	    var string = "jpl_execute_action("+ag+","+act+",Percepts,Result)";
	    System.out.println("\t" + string);
	    var solution =  Query.oneSolution(string);
	    var percepts = solution.get("Percepts");
	    // System.out.println("\t" + "Percepts: " + percepts);
	    if (percepts.isVariable()) {
		// getEnvironmentInfraTier().getRuntimeServices().stopMAS();
	    } else {
 		Term[] arr = Util.listToTermArray(percepts);
		int i;
		for (i = 0; i < arr.length; ++i) {
		    Term oneTerm = arr[i];
		    System.out.println("\t<<<" + oneTerm.toString() + ">>>");
		    addPercept(Literal.parseLiteral(oneTerm.toString()));
		}
		var result = solution.get("Result");
		System.out.println("\t" + "Result " + result.toString());
	    } 
	    addPercept(init0);
	    System.out.println("");
	    informAgsEnvironmentChanged();

	    return true;
	} catch (Exception e) {
            System.out.println("error executing " + ag + " for " + act + ": " + e.toString());
	    // throw e;
	    return false;
	}
    }
}
