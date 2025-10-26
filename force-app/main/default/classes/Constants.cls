public class Constants {
  public static final String ACCOUNT_CACHE_KEY = 'local.TacoPartition.cachedAccounts';
  public static final Integer CACHE_TIMEOUT = 600;
  public static final String APPROVAL_ROW_CAUSE = 'Approval_Access__c';
  public static final String MANUAL_ROW_CAUSE = 'Manual';
  public static final String AIRTABLE_TOKEN = 'patbol94d65O5JfTc.ba5e8ea2ba1ca99527a87abc6c2061e96e12dfc63130ef2f691016ae7c885b73';
  public static final String AIRTABLE_ENDPOINT = 'https://api.airtable.com/v0/';
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
