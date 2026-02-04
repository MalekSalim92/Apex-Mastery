List<Account> result = [
  SELECT Name
  FROM Account
  LIMIT 20
  OFFSET 5
];
// 20 RECORDS STARTING FROM INDEX 5

//todo The OFFSET clause cannot be used in a subquery unless the parent query specifically has a LIMIT 1clause. Otherwise, an exception will occur
