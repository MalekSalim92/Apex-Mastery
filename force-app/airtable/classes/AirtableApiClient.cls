public with sharing class AirtableApiClient {
  public static void getRecords(String endpoint) {
    HttpClient client = new HttpClient(Constants.AIRTABLE_NAMED_CREDENTIAL);
    HttpResponse response = client.get(endpoint);
    List<Object> records = parseBody(response);
    for (Object recordObject : records) {
      Map<String, Object> record = (Map<String, Object>) recordObject;
      String recordId = (String) record.get('id');
      String createdTime = (String) record.get('createdTime');
      Map<String, Object> fields = (Map<String, Object>) record.get('fields');

      // Insert Records
      // return Ids
    }
  }
  public static void postRecords(String endpoint, String body) {
    HttpClient client = new HttpClient(Constants.AIRTABLE_NAMED_CREDENTIAL);
    HttpResponse response = client.get(endpoint);
    // return api message after insert ;
  }

  private static List<Object> parseBody(HttpResponse response) {
    Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(
      response.getBody()
    );
    return (List<Object>) body.get('records');
  }
}
