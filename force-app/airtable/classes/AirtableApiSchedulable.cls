public with sharing class AirtableApiSchedulable implements schedulable {
  String tableName;
  public AirtableApiSchedulable(String tableName) {
    this.tableName = tableName;
  }
  public void execute(SchedulableContext sc) {
    AirtableApiQueue queue = new AirtableApiQueue(tableName, '');
    System.EnqueueJob(queue);
  }
}
