public with sharing class sobjectDefinitionClass {
  public static void getSobjectDefinition() {
    Schema.sObjectType accountType1 = Account.sObjectType; //todo   'Account'
    Account acc = new Account();
    Schema.sObjectType accountType2 = acc.getSobjectType(); //todo    'Account'

    Schema.DescribesObjectResult result = Account.sObjectType.getDescribe(); // todo MAP of all fields
  }
}
