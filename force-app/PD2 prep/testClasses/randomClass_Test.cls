@isTest
private class randomClass_Test {
  @testSetup
  static void setup() {
    Account acc = new Account(Name = 'Helllooow');
    insert acc;
  }

  @isTest
  static void testChangeName() {
    Account acc = [SELECT Name FROM Account LIMIT 1];
    System.debug('ChangeName method : ' + acc.Name);

    acc.Name = 'HOLA';
    update acc;
    Account acc2 = [SELECT Name FROM Account LIMIT 1];
    System.debug('ChangeName method : ' + acc2.Name);
  }

  @isTest
  static void retrieveName() {
    Account acc = [SELECT Name FROM Account LIMIT 1];
    System.debug('RetreiveName method : ' + acc.Name);
    acc.Name = 'BOLA';
    update acc;
    Account acc2 = [SELECT Name FROM Account LIMIT 1];
    System.debug('RetreiveName method : ' + acc2.Name);
  }
}
