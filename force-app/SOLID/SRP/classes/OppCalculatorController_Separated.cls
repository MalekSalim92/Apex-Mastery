public with sharing class OppCalculatorController_Separated {
  public static void calculateOpp(String userType) {
    OppCalculator_Interface calculator = OppCalculator_Service.getCalculator(
      userType
    );
    calculator.calculateOpp();
  }
}
