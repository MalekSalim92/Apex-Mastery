public class Constants {
  public static final String ACCOUNT_CACHE_KEY = 'local.TacoPartition.cachedAccounts';
  public static final Integer CACHE_TIMEOUT = 600;
  public static final String APPROVAL_ROW_CAUSE = 'Approval_Access__c';
  public static final String MANUAL_ROW_CAUSE = 'Manual';
  public static final String AIRTABLE_BASEID = 'appgbIeQEKZzNr0O1';
  public static final String AIRTABLE_PRODUCTS = 'tblUNaHQZPXdSpWo4';
  public static final String AIRTABLE_INVENTORY = 'tblXHmIUIBK9PWF0j';
  public static final Map<String, String> AIRTABLE_TABLE_NAMES = new Map<String, String>{
    'INVENTORY' => 'tblUNaHQZPXdSpWo4',
    'PRODUCT' => 'tblUNaHQZPXdSpWo4'
  };
  public static final String API_METHOD_GET = 'GET';
  public static final String API_METHOD_POST = 'POST';
}
