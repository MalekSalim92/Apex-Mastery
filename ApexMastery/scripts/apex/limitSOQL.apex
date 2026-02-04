List<Account> fails = [
  SELECT COUNT(Id)
  FROM Account
  LIMIT 20
];

List<Account> succeeds = [
  SELECT COUNT(Id)
  FROM Account GROUP BY Name
  LIMIT 20
];
