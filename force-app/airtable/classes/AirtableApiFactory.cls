public with sharing class AirtableApiFactory {
  private static Map<String, String> implementationsByName = new Map<String, String>{
    'PRODUCT' => 'AirtableApiProduct',
    'INVENTORY' => 'AirtableApiInventory'
  };
  public static IairtableApi getInstance(String tableName) {
    IairtableApi airtable = null;
    Type t = Type.forName(implementationsByName.get(tableName));
    airtable = (IairtableApi) t.newInstance();
    return airtable;
  }
}
