public with sharing class addErrorClass {
  public static void process() {
    Account acc = new Account(Name = 'EE');
    acc.addError('Name', 'NAME ERROR ');
    insert acc;
  }
}
