@isTest
private class staticResourceTestData {
  @testSetup
  static void setup() {
    List<Account> accounts = Test.loadData(
      Account.SObjectType,
      'AccountTestData'
    );
  }

  @isTest
  static void fetchAccounts() {
    List<Account> accounts = [SELECT Id FROM Account];
    System.debug(accounts.size());
  }
  @isTest
  static void importData() {
    List<Account> accounts = Test.loadData(
      Account.SObjectType,
      'AccountTestData'
    );
    System.debug(accounts.size());
    for (Account account : accounts) {
      system.debug(account.Name);
      system.debug(account.Description);
    }
  }
}
