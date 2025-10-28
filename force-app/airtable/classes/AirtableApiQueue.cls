public with sharing class AirtableApiQueue implements Queueable, Database.Allowscallouts {
  private Integer pageNumber = 1;
  private String tableName;
  public AirtableApiQueue(String tableName) {
    this.tableName = tableName;
  }
  public void execute(QueueableContext qc) {
    AirtableApiService.callApi(tableName);
  }
}
