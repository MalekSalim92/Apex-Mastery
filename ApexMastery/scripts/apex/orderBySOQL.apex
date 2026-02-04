List<Account> nullsFirst = [
  SELECT Name, NumberOfEmployees
  FROM Account
  ORDER BY NumberOfEmployees DESC NULLS FIRST, Name DESC
];

List<Account> nullsLast = [
  SELECT Name, NumberOfEmployees
  FROM Account
  ORDER BY NumberOfEmployees ASC NULLS LAST, Name ASC
];
