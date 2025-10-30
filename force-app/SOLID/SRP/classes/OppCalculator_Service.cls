public with sharing class OppCalculator_Service {
  private static Map<String, Type> classesByUserType = new Map<String, Type>{
    'CTO' => OppCalculatorCTO.class,
    'Manager' => OppCalculatorManager.class
  };
  public static OppCalculator_Interface getCalculator(String userType) {
    return (OppCalculator_Interface) classesByUserType.get(userType)
      .newInstance();
  }
}
