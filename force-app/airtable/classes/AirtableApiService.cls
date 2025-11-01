public with sharing class AirtableApiService {
  public static String getAirtableRecords(String tableName, String offset) {
    String tableId = getTableId(tableName);
    IairtableApi processor = AirtableApiFactory.getInstance(tableName);
    return processor.callApi(tableId, offset);
  }

  private static String getTableId(String tableName) {
    if (!Constants.AIRTABLE_TABLE_NAMES.ContainsKey(tableName.toUpperCase())) {
      System.debug(
        'Argument must be one of these : ' +
        Constants.AIRTABLE_TABLE_NAMES.keyset()
      );
      throw new AuraHandledException('fafeza');
    }
    return Constants.AIRTABLE_TABLE_NAMES.get(tableName.toUpperCase());
  }

  public static HttpResponse getApiResponse(String tableId, String offset) {
    HttpClient airTableApi = new HttpClient(
      Constants.AIRTABLE_NAMED_CREDENTIAL
    );
    return airTableApi.get(
      '/v0/' + Constants.AIRTABLE_BASEID + '/' + tableId + '?offset=' + offset
    );
  }

  public static void schedule(String tableName) {
    AirtableApiSchedulable sch = new AirtableApiSchedulable(tableName);
    String schedName = 'Schedulable - ' + tableName;
    String cron = '0 0 * * * ?';
    System.schedule(schedName, cron, sch);
  }
}
