public interface PaymentProcessor {
  String processPayment(Decimal amount);
}
