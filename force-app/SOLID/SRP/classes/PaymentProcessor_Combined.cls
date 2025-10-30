public class PaymentProcessor_Combined {
  public String processPayment(String gateway, Decimal amount) {
    if (gateway == 'Stripe') {
      // Stripe logic
      if (amount < 0.50) {
        return 'Stripe minimum is $0.50';
      }
      // Call Stripe API
      return 'Stripe payment successful';
    } else if (gateway == 'PayPal') {
      // PayPal logic
      if (amount < 1.00) {
        return 'PayPal minimum is $1.00';
      }
      // Call PayPal API
      return 'PayPal payment successful';
    } else if (gateway == 'Square') {
      // Square logic
      if (amount < 1.00) {
        return 'Square minimum is $1.00';
      }
      // Call Square API
      return 'Square payment successful';
    }
    return 'Unknown gateway';
  }
}
