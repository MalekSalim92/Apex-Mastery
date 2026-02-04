List<AggregateResult> result = [
  SELECT
    AVG(NumberOfEmployees) avg,
    MAX(NumberOfEmployees) max,
    MIN(NumberOfEmployees) min,
    COUNT(ID) total
  FROM Account
];

System.debug(result[0].get('total'));
System.debug(result[0].get('avg'));
System.debug(result[0].get('max'));
System.debug(result[0].get('min'));
