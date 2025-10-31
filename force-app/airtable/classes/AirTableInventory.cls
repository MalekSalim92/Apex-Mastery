public with sharing class AirTableInventory implements IairtableApi {
  public static String callApi(String tableId, String offset) {
    HttpResponse response = AirtableApiService.getApiResponse(tableId, offset);
    List<object> records = (List<Object>) (AirtableApiClient.processResponse(
        response
      ))
      .get('records');
    List<Inventory__c> airtableInventoriesToInsert = new List<Inventory__c>();
    for (Object recordObj : records) {
      Map<String, Object> record = (Map<String, Object>) recordObj;
      String name = (string) record.get('id');
      airtableInventoriesToInsert.add(new Inventory__c(Name = name));
    }
    if (!airtableInventoriesToInsert.isEmpty()) {
      insert airtableInventoriesToInsert;
    }

    return (String) (AirtableApiClient.processResponse(response)).get('offset');
  }
}
