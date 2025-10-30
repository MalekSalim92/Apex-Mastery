public with sharing class OppCalculator_Service {
    private static Map<String,Type> classesByUserType = new Map<String,Type>{
        'CTO' => OppCalculatorCTO.class,
        'Manager' => OppCalculatorManager.class
    };
    String userType;
    public Oppcalculator_Service(String userType){
    this.userType = userType;
    }
    public static void calculateOpp(String userType) {
        OppCalculator_Interface oppCalculator = (OppCalculator_Interface) classesByUserType.get(userType).newInstance();
        oppCalculator.calculateOpp();
    }
}