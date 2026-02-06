public with sharing class AsyncService {
  private static final Integer ONE_MINUTE = 1;
  private static final String SCHED_NAME = 'SCHEDULED DEMO';

  // QUEUE

  public void callQueueableMethod() {
    List<Contact> contacts = [
      SELECT Id, firstName, lastName, Email
      FROM Contact
    ];
    if (!contacts.isEmpty()) {
      Integer delayInMinutes = 7;
      System.enqueueJob(new QueueableClass(contacts), delayInMinutes);
    }
  }
  //todo QUEUE
  public void callQueueableMethodWithDuplication() {
    List<Contact> contacts = [
      SELECT Id, firstName, lastName, Email
      FROM Contact
    ];
    if (!contacts.isEmpty()) {
      AsyncOptions options = new AsyncOptions();
      options.DuplicateSignature = new System.QueueableDuplicateSignature.Builder()
        .addId(UserInfo.getUserId())
        .addString('MyQueueable')
        .build();
      try {
        System.enqueueJob(new QueueableClass(contacts), options);
      } catch (DuplicateMessageException ex) {
        //Exception is thrown if there is already an enqueued job with the same signature
        Assert.areEqual(
          'Attempt to enqueue job with duplicate queueable signature',
          ex.getMessage()
        );
      }
    }
  }

  // SCHEDULE

  private void scheduleMethod() {
    List<Account> accountList = [SELECT Id, Description, SicDesc FROM Account];
    if (!accountList.isEmpty()) {
      ScheduledClass schedClass = new ScheduledClass(accountList);
      Datetime oneMinuteFromNow = system.now().addMinutes(ONE_MINUTE);
      String cronExp =
        oneMinuteFromNow.second() +
        ' ' +
        oneMinuteFromNow.minute() +
        ' ' +
        oneMinuteFromNow.hour() +
        ' ' +
        oneMinuteFromNow.day() +
        ' ' +
        oneMinuteFromNow.month() +
        ' ? ' +
        oneMinuteFromNow.year();

      System.schedule(SCHED_NAME, cronExp, schedClass);
    }
  }

  // RESCHEDULE

  public void rescheduleMethod() {
    List<CronJobDetail> cronJob = [
      SELECT Id
      FROM CronJobDetail
      WHERE Name = :SCHED_NAME
      LIMIT 1
    ];
    if (!cronJob.isEmpty()) {
      List<CronTrigger> cronTrigger = [
        SELECT Id
        FROM CronTrigger
        WHERE CronJobDetailId = :cronJob[0].Id
        LIMIT 1
      ];
      if (!cronTrigger.isEmpty()) {
        scheduleMethod();
        System.abortJob(cronTrigger[0].Id);
      }
    }
  }

  // BATCH

  public void callBatchMethod() {
    String query = 'SELECT ID FROM Account';
    BatchClass batch = new BatchClass(query);
    Database.executeBatch(batch);
  }

  // CHANGE DATA CAPTURE

  public void changeDataCapture(List<AccountChangeEvent> aceList) {
    System.debug('::::: CDC STARTED ::::: ');

    for (AccountChangeEvent ace : aceList) {
      EventBus.ChangeEventHeader aceHeader = ace.ChangeEventHeader;
      System.debug('HEADER ::::: ' + aceHeader);
      List<String> recordIds = aceHeader.getRecordIds();
      System.debug('recordIds ::::: ' + recordIds);
    }
  }
}
