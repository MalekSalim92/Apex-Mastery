public with sharing class PaymentProcessorFactory {
  private static Map<String, Type> ClassesByGateway = new Map<String, Type>{
    'Stripe' => PaymentProcessorStripe_Impl.class,
    'Paypal' => PaymentProcessorPaypal_Impl.class,
    'Square' => PaymentProcessorSquare_Impl.class
  };

  public static PaymentProcessor getProcessor(String gateway) {
    return (paymentProcessor) ClassesByGateway.get(gateway).newInstance();
  }
}
