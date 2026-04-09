trigger ExceptionEventTrigger on ExceptionEvent__e(after insert) {
  for (ExceptionEvent__e event : Trigger.New) {
    apexExceptionClass.createException(event.msg__c);
  }
}
