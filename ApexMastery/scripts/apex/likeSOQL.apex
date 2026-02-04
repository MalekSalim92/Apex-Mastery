List<Account> result = [
  SELECT Name
  FROM Account
  WHERE Name LIKE '_cc%'
];
// All Accounts that EXACTLY START WITH ONE CARACTER , THEN cc , THEN ANYTHING