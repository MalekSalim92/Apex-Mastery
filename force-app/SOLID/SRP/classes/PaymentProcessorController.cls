public with sharing class PaymentProcessorController {
  public static String processPayment(String gateway, Decimal amount) {
    PaymentProcessor processor = PaymentProcessorFactory.getProcessor(gateway);
    return processor.processPayment(amount);
  }
}
