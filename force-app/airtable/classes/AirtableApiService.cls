public with sharing class AirtableApiService {
  public static void callApi(String tableName) {
    String tableId = getTableId(tableName);
    HttpResponse response = getApiResponse(tableId);
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

  private static HttpResponse getApiResponse(String tableId) {
    HttpClient airTableApi = new HttpClient(
      Constants.AIRTABLE_NAMED_CREDENTIAL
    );
    return airTableApi.get(Constants.AIRTABLE_BASEID + '/v0/' + tableId);
  }

  public static void schedule(String tableName) {
    AirtableApiSchedulable sch = new AirtableApiSchedulable(tableName);
    String schedName = 'Schedulable - ' + tableName;
    String cron = '0 * * * *';
    System.schedule(schedName, cron, sch);
  }
}
