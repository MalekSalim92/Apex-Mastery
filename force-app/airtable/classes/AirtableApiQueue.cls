public with sharing class AirtableApiQueue implements Queueable, Database.Allowscallouts, Finalizer {
  private static Integer pageNumber = 1;
  private String tableName;
  public AirtableApiQueue(String tableName) {
    this.tableName = tableName;
  }
  public void execute(QueueableContext qc) {
    AirtableApiService.airtableApiCall(tableName);
  }

  public void execute(FinalizerContext fc) {
  }
}
