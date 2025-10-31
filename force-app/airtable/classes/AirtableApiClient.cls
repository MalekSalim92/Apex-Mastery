public with sharing class AirtableApiClient {
  public static Map<String, Object> processResponse(httpResponse response) {
    Map<String, Object> airtableObjectsByNames = (Map<String, Object>) JSON.deserializeUntyped(
      response.getBody()
    );
    List<Object> records = (List<Object>) airtableObjectsByNames.get('records');
    String offset = (String) airtableObjectsByNames.get('offset');
    return new Map<String, Object>{ 'records' => records, 'offset' => offset };
  }
}
