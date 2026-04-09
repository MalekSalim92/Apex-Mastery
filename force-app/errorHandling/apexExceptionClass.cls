public with sharing class apexExceptionClass {
  public static void createAccount() {
    try {
      createException('before Catch');
      createEvent('EVENT BEFORE CATCH');
      Account acc = new Account(Phone = 'fjklzejlkfez');
      insert acc;
    } catch (Exception e) {
      createException('after Catch');
      createEvent('EVENT AFTER CATCH');

      System.debug(e);
      throw new AuraHandledException('ERROR');
    }
  }

  @future
  public static void callFuture() {
    System.debug('CALLING FUTURE METHDO');
    FutureMethod.process();
  }

  public static void createException(String msg) {
    Exception__c ex = new Exception__c(Error_Msg__c = msg);
    insert ex;
  }

  private static void createEvent(String msg) {
    ExceptionEvent__e event = new ExceptionEvent__e(msg__c = msg);
    EventBus.publish(event);
  }
}
