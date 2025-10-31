public with sharing class AirtableApiQueue implements Queueable, Database.Allowscallouts {
  private Integer pageNumber = 1;
  private String tableName;
  private String offset;
  Integer num = 1;

  public AirtableApiQueue(String tableName, String offset) {
    this.tableName = tableName;
    this.offset = offset;
  }
  public void execute(QueueableContext qc) {
    System.debug('QUEABLE NUMBER ' + num);
    String nextOffset = AirtableApiService.getAirtableRecords(
      tableName,
      this.offset
    );
    if (
      String.isNotBlank(nextOffset) &&
      (Limits.getLimitQueueableJobs() - Limits.getQueueableJobs() > 0)
    ) {
      System.debug('Chaining next queue with offset: ' + nextOffset);
      System.EnqueueJob(new AirtableApiQueue(tableName, nextOffset));
    } else {
      System.debug('✅ Finished all pages for table: ' + tableName);
    }
  }
}
