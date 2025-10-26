public with sharing class AirtableApiService {
  public static void callApi(String tableName) {
    String tableId = getTableId(tableName);
    HttpResponse response = getApiResponse(
      Constants.AIRTABLE_ENDPOINT,
      Constants.API_METHOD_GET,
      Constants.AIRTABLE_TOKEN,
      tableId
    );
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

  private static HttpResponse getApiResponse(
    String endpoint,
    String method,
    String token,
    String tableId
  ) {
    ExternalServiceClass extService = new ExternalServiceClass(
      endpoint,
      method,
      token,
      tableId
    );
    return extService.callApi();
  }

  private static Boolean apiSuccessResponse(HttpResponse response) {
    ExternalServiceClass extService = new ExternalServiceClass(response);
    return extService.isSuccessStatus();
  }

  public static void airtableApiCall(String tableName) {
    if (!Constants.AIRTABLE_TABLE_NAMES.ContainsKey(tableName.toUpperCase())) {
      System.debug(
        'Incorrect Argument, Must be one of these : ' +
        Constants.AIRTABLE_TABLE_NAMES.keyset()
      );
      return;
    }
    String tableId = Constants.AIRTABLE_TABLE_NAMES.get(
      tableName.toUpperCase()
    );

    HttpRequest req = new HttpRequest();
    req.setEndpoint(
      Constants.AIRTABLE_ENDPOINT + Constants.AIRTABLE_BASEID + '/' + tableId
    );
    req.setMethod(Constants.API_METHOD_GET);
    req.setHeader('Authorization', 'Bearer ' + Constants.AIRTABLE_TOKEN);
    Http http = new Http();
    HttpResponse res = http.send(req);
    if (res.getStatusCode() < 200 || res.getStatusCode() > 300)
      throw new CalloutException(
        'Artable API Throw returned status : ' +
          res.getStatusCode() +
          ' with error : ' +
          res.getBody()
      );
    else {
      Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(
        res.getBody()
      );
      List<Object> recordList = (List<Object>) response.get('records');
      for (Object record : recordList) {
        Map<String, Object> recordDetails = (Map<String, Object>) record;

        System.debug('ID: ' + recordDetails.get('id'));
        Map<String, Object> fields = (Map<String, Object>) recordDetails.get(
          'fields'
        );
        System.debug(
          'Warehouse Location   ...... ' + fields.get('Warehouse Location')
        );
      }
    }
  }
}
