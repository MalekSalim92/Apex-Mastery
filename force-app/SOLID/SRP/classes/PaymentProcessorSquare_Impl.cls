public with sharing class PaymentProcessorSquare_Impl implements PaymentProcessor {
  public String processPayment(Decimal amount) {
    if (amount < 1) {
      return '1 $ is the minimum';
    } else {
      return 'Success Square';
    }
  }
}
