import jason.asSyntax.Literal;
import jason.asSyntax.Structure;
import jason.environment.Environment;

import org.jpl7.Compound;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

public class PrologAdapterEnv extends Environment {

    Literal ld  = Literal.parseLiteral("locked(door)");
    Literal nld = Literal.parseLiteral("~locked(door)");
    boolean doorLocked = true;

    @Override
    public void init(String[] args) {
    // System.setProperty
    //     ("java.library.path",
    //      System.getProperty("java.library.path") + java.io.File.pathSeparator +
    //      "/usr/lib/swi-prolog/lib/jpl.jar" + java.io.File.pathSeparator +
    //      "/usr/lib/swi-prolog/lib/x86_64-linux/libjpl.so"
    //      );
    // System.loadLibrary("jpl.jar");
    // System.loadLibrary("libjpl.so");
        Query.oneSolution("consult('execute.pl')");
        // initial percepts
        addPercept(ld);
    }

    /**
     * Implementation of the agent's basic actions
     */
    @Override
    public boolean executeAction(String ag, Structure act) {
        System.out.println("Agent "+ag+" is doing "+act);
        clearPercepts();
    // var result = Query.oneSolution("jpl_test_execute_action("+ag+","+act+",F)");

    // var result = Query.oneSolution
    //     (
    //      new Compound("jpl_test_execute_action",
    //        new Term[] { new org.jpl7.Compound(ag),
    //                 new org.jpl7.Compound(act),
    //                 new Variable("F") }
    //        )
    //      );
        // System.out.println("Result "+result);

        if (act.getFunctor().equals("lock"))
            doorLocked = true;

        if (act.getFunctor().equals("unlock"))
            doorLocked = false;

        // update percepts given state of the environment
        if (doorLocked)
            addPercept(ld);
        else
            addPercept(nld);
            
        informAgsEnvironmentChanged();
        return true;
    }
}
