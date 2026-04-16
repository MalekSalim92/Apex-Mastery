public with sharing class SoqlService {
    public static void doSoql() {
        // AGGRAGATE RESULT
        Integer total = [SELECT COUNT() FROM Account]; // Counts Null
        AggregateResult totalAggregate = [SELECT COUNT(BillingCity) FROM Account]; // Ignores null city  
        AggregateResult ar = [SELECT COUNT(Name),AVG(AnnualRevenue) avgRev, MAX(AnnualRevenue) FROM Account];
        System.debug(ar); // {expr0=4004, avgRev=505.64, expr1=999.75}
        System.debug(ar.get('expr0'));
        System.debug(ar.get('avgRev'));
        System.debug(ar.get('expr1'));

        AggregateResult countDistinct = [SELECT COUNT_DISTINCT(BillingCity) FROM Account]; // if 20 cities = Ottawa => Count as 1

       // AggregateResult invalidLimitQuery = [SEELCT COUNT(Id) FROM Account LIMIT 10]; // The LIMIT clause cannot be included in a query that uses an aggregate function but does not use a GROUP BY clause
          AggregateResult validLimitQuery = [SELECT COUNT(Id),Website FROM Account GROUP BY Website LIMIT 10];



        // INCLUDES - EXCLUDES

        List<Account> accountsInclude = [SELECT Id FROM Account WHERE Letters__c INCLUDES('A','B')];//  Have A or HAVE B
        List<Account> accountsExclude = [SELECT Id FROM Account WHERE Letters__c EXCLUDES('A;B;C')]; // Does not have A" AND "Does not have B" AND "Does not have C

        // WILDCARDS

        List<Account> accountsWithPercentage = [SELECT Id FROM Account WHERE Name LIKE '%hello']; //starts with anything , but ends with 'hello'
        List<Account> accountsWithUnderscore = [SELECT Id FROM Account WHERE Name LIKE '__hello']; //starts with exactly 2 caracters , and ends with 'hello'
        List<Account> accountNamesContainingPercentageOrUnderscore = [SELECT Id FROM Account WHERE Name LIKE  '100\%\_Growth']; // Name of company = 100%_Growth

        // DATES

        List<Account> yesterdayAccounts = [SELECT Id FROM Account WHERE CreatedDate = YESTERDAY]; 
        List<Account> nextWeekAccounts = [SELECT Id FROM Account WHERE CreatedDate = NEXT_WEEK]; 
        List<Account> lastNinetyDaysAccounts = [SELECT Id FROM Account WHERE CreatedDate = LAST_90_DAYS]; 
        List<Account> lastMonthsAccounts = [SELECT Id FROM Account WHERE CreatedDate = LAST_n_MONTHS:30]; 
        List<Account> nextDaysAccounts = [SELECT Id FROM Account WHERE CreatedDate = NEXT_n_DAYS:329]; 

        // ORDER 

        List<Account> nullFirstAccounts = [SELECT Id FROM Account ORDER BY website ASC NULLS FIRST];
        List<Account> nullLastAccounts = [SELECT Id FROM Account ORDER BY website DESC NULLS LAST];


        // OFFSET

        List<Account> accountsWithOffset = [SELECT Id FROM Account LIMIT 50 OFFSET 20]; // returns 50 records starting from the 21st record onwards (max Offset value = 2000)
        List<Account> accountsWithContacts = [SELECT Id , (SELECT Id FROM Contacts OFFSET 10) FROM Account LIMIT 1]; // The OFFSET clause cannot be used in a subquery unless the parent query specifically has a LIMIT 1clause

        // WITH 

        // List<KnowledgeArticleVersion> ka = [SELECT Title FROM KnowledgeArticleVersion WHERE PublishStatus='online' WITH DATA CATEGORY Product__c AT Desktop__c];
        List<Account> accountSecurityEnforced = [SELECT Id FROM Account WHERE AnnualRevenue > 100 WITH SECURITY_ENFORCED]; //If the current user does not have access to the AnnualRevenue field, the query will still be successful
        List<Account> accountSecurityEnforcedPrime = [SELECT Id, AnnualRevenue FROM Account WITH SECURITY_ENFORCED]; // //If the current user does not have access to the AnnualRevenue field, the query will fail
        
        // STRIP INACCESSIBLE

        List<Account> accountWithFields = [SELECT Id,Name,AnnualRevenue FROM Account];
        SobjectAccessDecision soadReadable = Security.stripInaccessible(AccessType.READABLE,accountWithFields);
        SobjectAccessDecision soadUpdatable = Security.stripInaccessible(AccessType.UPDATABLE,accountWithFields);
        SobjectAccessDecision soadCreatable = Security.stripInaccessible(AccessType.CREATABLE,accountWithFields);
        SobjectAccessDecision soadUpsertable = Security.stripInaccessible(AccessType.UPSERTABLE,accountWithFields);
        
        List<Account> accs = soadCreatable.getRecords();

        List<Account> accountsWithUserMode = [SELECT Id,AnnualRevenue FROM Account WITH USER_MODE];//If the current user does not have access to the AnnualRevenue field, the query will fail
        List<Account> accountsWithSystemMode = [SELECT Id,AnnualRevenue FROM Account WITH SYSTEM_MODE];//If the current user does not have access to the AnnualRevenue field, the query will still be successful
        
        // HAVING

        List<AggregateResult> accountsWithHaving = [SELECT Name, Count(Id) FROM Account GROUP BY Name HAVING Count(Id) > 1]; // returns Accounts with duplicate names
        Set<String> duplicateNames = new Set<String>();
        for (AggregateResult arHav : accountsWithHaving) {
         duplicateNames.add((String)arHav.get('Name'));
        }


        // TYPEOF

       List<Task> tasks = [SELECT Subject, 
                           TYPEOF What 
                               WHEN Account THEN Name, AnnualRevenue 
                               WHEN Opportunity THEN Name, Amount 
                               ELSE Name 
                           END 
                    FROM Task];

        for (Task t : tasks) {
            // Check the type of the polymorphic field 'What'
            if (t.What instanceof Account) {
                Account acc = t.What;
                System.debug('Account Revenue: ' + acc.AnnualRevenue);
            } else if (t.What instanceof Opportunity) {
                Opportunity opp = t.What;
                System.debug('Opp Amount: ' + opp.Amount);
            }
            }
            
        // FOR VIEW , REFERENCE , UPDATE
                List<Account> forViewAccounts = [SELECT Id FROM Account FOR VIEW]; // Updates the LastViewedDate and LastReferencedDate fields for the retrieved records.
                List<Account> forReferenceAccounts = [SELECT Id FROM Account FOR REFERENCE]; // Updates only the LastReferencedDate.
                List<Account> forUpdateAccounts = [SELECT Id FROM Account FOR UPDATE]; // locks the records so that other users or processes cannot modify them until your current transaction finishes (either it completes or rolls back).

                /* 
                The Scenario: Imagine two different integrations try to update the same Account balance at the exact same time.

                Without FOR UPDATE: 
                Both processes read "Balance = $100". Both subtract $10. Both save "Balance = $90". You just lost $10!

                With FOR UPDATE: 
                The first process locks the row. The second process is forced to wait until the first one is finished.
                The second process then reads the new balance ($90) and correctly saves $80.

                Pro-Tip: The WAIT behavior
                When you use FOR UPDATE, Salesforce will try to lock the record. 
                If it’s already locked by someone else, your code will wait up to 10 seconds. 
                After that, it throws a QueryException. 
                In high-volume orgs, it’s a "best practice" to wrap these queries in a try-catch block to handle that timeout gracefully
                */


                // ALL ROWS

                List<Account> allAccounts = [SELECT Id, Name, IsDeleted FROM Account ALL ROWS]; // Find all accounts, even the ones in the Recycle Bin 
    }
    @AuraEnabled
    public static Integer testSoql(){
        List<Account> accounts = [SELECT Id,Letters__c FROM Account WITH SECURITY_ENFORCED];
        return accounts.size();
    }
}