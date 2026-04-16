public with sharing class ScheduledClass implements Schedulable, Database.AllowsCallouts {
  List<Account> accountList;

  public ScheduledClass(List<Account> accountList) {
    this.accountList = accountList;
  }

  public void execute(SchedulableContext context) {
    for (Account acc : accountList) {
      acc.Description = String.valueOf(System.now());
    }
    update accountList;
    AsyncService asyncClass = new AsyncService();
    asyncClass.rescheduleMethod();
  }
}
