from py4j.java_gateway import JavaGateway

gateway = JavaGateway()                   # connect to the JVM
jason_agent = gateway.entry_point.getJasonAgent()  # get the JasonAgent instance

# now you can call methods on the JasonAgent instance
jason_agent.someMethod()
