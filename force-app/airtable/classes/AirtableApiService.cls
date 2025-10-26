public with sharing class AirtableApiService {
  public static void callApi(String tableName) {
    String tableId = getTableId(tableName);
    HttpResponse response = getApiResponse(Constants.API_METHOD_GET, tableId);
    System.debug('RESPONSE ::::: -> ' + response);
    //Boolean isSuccessStatus = apiSuccessResponse(response);
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

  private static HttpResponse getApiResponse(String method, String tableId) {
    ExternalServiceClass extService = new ExternalServiceClass(method, tableId);
    return extService.callApi();
  }

  private static Boolean apiSuccessResponse(HttpResponse response) {
    ExternalServiceClass extService = new ExternalServiceClass(response);
    return extService.isSuccessStatus();
  }
}
