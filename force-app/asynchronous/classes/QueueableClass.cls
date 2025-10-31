public with sharing class QueueableClass implements Queueable, Finalizer, Database.AllowsCallouts {
  List<Contact> contactList;
  public QueueableClass(List<Contact> contactList) {
    this.contactList = contactList;
  }

  public void execute(QueueableContext context) {
    for (Contact con : contactList) {
      con.FirstName = 'Queueable';
    }
    update contactList;
  }

  public void execute(FinalizerContext context) {
  }
}
