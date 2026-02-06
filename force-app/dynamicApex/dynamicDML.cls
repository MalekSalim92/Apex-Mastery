public with sharing class dynamicDML {
  public void dynamicDML(sObject record) {
    Schema.sObjectType objectType = record.getSObjectType();

    switch on String.valueOf(objectType) {
      when 'Account' {
        Account acc = new Account();
        acc.Name = 'Helli';
        insert acc;
      }
      when 'Case' {
        Case cas = new Case();
        insert cas;
      }
    }
  }
}
