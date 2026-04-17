public with sharing class dynamicSoql {
  public static List<Account> dynamicSoqlMethod() {
    Boolean isBirthday = true;
    String fields = 'Name,Industry';
    String whereClause = ' WHERE Id != null';
    if (isBirthday) {
      fields = fields + ',createdDate';
    }
    String query = 'SELECT ' + fields + ' FROM Account ' + whereClause;
    return Database.query(query);
  }

  public static List<Account> dynamicSoqlMethodWithBinds() {
    Map<String, Object> parameters = new Map<String, Object>();
    parameters.put('myName', 'ACME');
    parameters.put('myIndustry', 'Entertainment');

    String query = 'SELECT Id FROM Account WHERE Name = :myName AND Industry = :myIndustry';
    return Database.queryWithBinds(query, parameters, AccessLevel.SYSTEM_MODE);
  }

  public static Integer countQuery() {
    String query = 'SELECT COUNT() FROM Account';
    return Database.countQuery(query);
  }
}
