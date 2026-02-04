//* USER CANT ACCESS REVENUE FIELD

// This query runs even if the user CANT ACCESS the Revenue field
List<Account> acc = [SELECT Id, Name, Revenue__c, Industry FROM Account];
// Returns all data, potentially showing sensitive info to unauthorized users

// This query checks permissions first
List<Account> acc = [
  SELECT Id, Name, Revenue__c, Industry
  FROM Account
  WITH SECURITY_ENFORCED
]; //todo ERROR
// Throws an error if user CANT ACCESS Employee object or Revenue field

public List<Account> getAccounts() {
  // Get all fields you might need
  List<Account> accounts = [SELECT Id, Name, Revenue__c, Industry FROM Account];

  // Strip what user can't access (Revenue)
  SObjectAccessDecision decision = Security.stripInaccessible(
    AccessType.READABLE,
    accounts
  );

  // Safe to return
  return decision.getRecords(); //todo RETURNS ONLY ID AND NAME ANND Industry
}

public static String updateAccount(
  Id accountId,
  String name,
  Decimal revenue,
  String industry
) {
  Account account = [
    SELECT Id, Name, Revenue__c, Industry
    FROM Account
    WHERE Id = :accountId
  ];

  account.Name = name;
  account.Revenue__c = revenue;
  account.Industry = industry;

  List<Account> accounts = new List<Account>{ account };

  SObjectAccessDecision decision = Security.stripInaccessible(
    AccessType.UPDATABLE,
    accounts
  );

  update decision.getRecords(); //todo UPDATES ONLY NAME AND INDUSTRY
}

// WITH USER MODE / SYSTEM MODE

// todo USER_MODE - respects current user's permissions (ALL 3 LAYERS)
List<Account> acc = [SELECT Id, Name, Revenue__c FROM Account WITH USER_MODE];
// ❌ FAILS with error - Alex can't access Revenue__c field
// Object permissions: Enforced ✅
// FLS: Enforced ✅ (throws error on Revenue__c)
// Record sharing: Enforced ✅

// todo SYSTEM_MODE - bypasses object perms and FLS, sharing depends on class
public with sharing class Test {
  List<Account> acc = [
    SELECT Id, Name, Revenue__c
    FROM Account
    WITH SYSTEM_MODE
  ];
  // Returns only Alex's 50 records (sharing enforced) with ALL fields
  // Object permissions: Bypassed ❌
  // FLS: Bypassed ❌ (shows Revenue__c)
  // Record sharing: ENFORCED ✅ (because 'with sharing')
}

public without sharing class Test {
  List<Account> acc = [
    SELECT Id, Name, Revenue__c
    FROM Account
    WITH SYSTEM_MODE
  ];
  // Returns ALL 1000 records with ALL fields
  // Object permissions: Bypassed ❌
  // FLS: Bypassed ❌ (shows Revenue__c)
  // Record sharing: Bypassed ❌ (because 'without sharing')
}

// todo No mode specified - SAME AS SYSTEM_MODE (ignores object perms and FLS)
public with sharing class Test {
  List<Account> acc = [SELECT Id, Name, Revenue__c FROM Account];
  // Returns only Alex's 50 records (sharing enforced) with ALL fields
  // Object permissions: Bypassed ❌ (NOT enforced by default in Apex!)
  // FLS: Bypassed ❌ (shows Revenue__c - security hole!)
  // Record sharing: ENFORCED ✅ (because 'with sharing')
}

public without sharing class Test {
  List<Account> acc = [SELECT Id, Name, Revenue__c FROM Account];
  // Returns ALL 1000 records with ALL fields
  // Object permissions: Bypassed ❌ (NOT enforced by default in Apex!)
  // FLS: Bypassed ❌ (shows Revenue__c)
  // Record sharing: Bypassed ❌ (because 'without sharing')
}

// ✅ KEY POINT: No mode and SYSTEM_MODE are FUNCTIONALLY IDENTICAL
// Both ignore object permissions and FLS
// Both respect the class's sharing keyword for record access
// The ONLY difference is that SYSTEM_MODE is explicit about the intent
