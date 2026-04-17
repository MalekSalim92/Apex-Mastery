public with sharing class sobjectDefinitionClass {
  public static void getSobjectDefinition() {

    // sObjectType

    Schema.sObjectType accountType1 = Account.sObjectType; //   'Account'
    Account acc = new Account();
    Schema.sObjectType accountType2 = acc.getSobjectType(); //    'Account'


   // DescribeSObjectResult
    Schema.DescribeSObjectResult result = Account.sObjectType.getDescribe(); //  map of all fields
    Schema.DescribeSObjectResult mResult = Schema.SobjectType.Account;//  map of all fields

    //SObjectField 
    Map<String, Schema.SObjectField> m = Schema.SObjectType.Lead.fields.getMap(); //map of all the field names (keys) and field tokens (values)
    Schema.SobjectField f1 = Account.Name; // Name
    Schema.DescribeFieldResult fr = Schema.sObjectType.Account.fields.Name;
    Schema.SobjectField f2 = fr.getSObjectField(); // Name
   }
}
