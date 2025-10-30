public with sharing class PaymentProcessorPaypal_Impl implements PaymentProcessor {
  public String processPayment(Decimal amount) {
    return amount < 1 ? 'Minimum 1$' : 'Success Paypal';
  }
}
