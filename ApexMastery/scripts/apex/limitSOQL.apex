List<AggregateResult> fails = [
  SELECT COUNT(Id)
  FROM Account
  LIMIT 20
];

List<AggregateResult> succeeds = [
  SELECT COUNT(Id)
  FROM Account
  GROUP BY Name
  LIMIT 20
];
