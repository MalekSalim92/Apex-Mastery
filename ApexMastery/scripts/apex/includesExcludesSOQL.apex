List<Account> resultTennisAndBoxing = [
  SELECT Name, Sports__c
  FROM Account
  WHERE Sports__c INCLUDES ('Tennis', 'Boxing')
];
System.debug(resultTennisAndBoxing.size());
List<Account> resultNOtTennisAndBoxing = [
  SELECT Name, Sports__c
  FROM Account
  WHERE Sports__c EXCLUDES ('Tennis', 'Boxing')
];

System.debug(resultNOtTennisAndBoxing.size());
