public with sharing class AirtableApiProduct implements IairtableApi {
  public static String callApi(String tableId, String offset) {
    HttpResponse response = AirtableApiService.getApiResponse(tableId, offset);
    List<object> records = (List<Object>) (AirtableApiClient.processResponse(
        response
      ))
      .get('records');
    List<Product2> airtableProductsToInsert = new List<Product2>();
    for (Object recordObj : records) {
      Map<String, Object> record = (Map<String, Object>) recordObj;
      String name = (string) record.get('id');
      airtableProductsToInsert.add(new Product2(Name = name));
    }
    if (!airtableProductsToInsert.isEmpty()) {
      insert airtableProductsToInsert;
    }

    return (String) (AirtableApiClient.processResponse(response)).get('offset');
  }
}
