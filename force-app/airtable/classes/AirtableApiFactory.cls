public with sharing class AirtableApiFactory {
  private static Map<String, Type> implementationsByName = new Map<String, Type>{
    'PRODUCT' => AirtableApiProduct.class,
    'INVENTORY' => AirtableApiInventory.class
  };
  public static IairtableApi getProcessor(String tableName) {
    return (IairtableApi) implementationsByName.get(tableName).newInstance();
  }
}
