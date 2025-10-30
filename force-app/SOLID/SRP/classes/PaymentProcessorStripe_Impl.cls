public with sharing class PaymentProcessorStripe_Impl implements PaymentProcessor {
  public String processPayment(Decimal amount) {
    if (amount < 1)
      return '1$ is the minimum to pay';
    return 'Payment Stripe Successful';
  }
}
