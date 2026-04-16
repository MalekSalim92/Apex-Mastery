public with sharing class QueueableClass implements Queueable, Finalizer, Database.AllowsCallouts {
  List<Contact> contactList;
  public QueueableClass(List<Contact> contactList) {
    this.contactList = contactList;
  }

  public void execute(QueueableContext context) {

    System.attachFinalizer(this);
    for (Contact con : contactList) {
      con.FirstName = 'Queueable';
    }
    update contactList;
  }

  public void execute(FinalizerContext context) {

    String jobId = context.getAsyncApexJobId();
        
        if (context.getResult() == ParentJobResult.SUCCESS) {
            System.debug('Success: Updated ' + contactList.size() + ' contacts.');
        } else {
      System.enqueueJob(new QueueableClass(this.contactList));        }
    }
  }

