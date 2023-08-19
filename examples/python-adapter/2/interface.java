import py4j.GatewayServer;

public class JasonEntryPoint {
    private JasonAgent jasonAgent;

    public JasonEntryPoint() {
        jasonAgent = new JasonAgent();
    }

    public JasonAgent getJasonAgent() {
        return jasonAgent;
    }

    public static void main(String[] args) {
        GatewayServer gatewayServer = new GatewayServer(new JasonEntryPoint());
        gatewayServer.start();
        System.out.println("Gateway Server Started");
    }
}
