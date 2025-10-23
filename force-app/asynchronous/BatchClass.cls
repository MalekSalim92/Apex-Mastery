public with sharing class BatchClass implements Database.Batchable<SObject>,Database.AllowsCallouts,Database.stateful
 {
    String query;
    List<Account> accountsToUpdate = new List<Account>();
    public BatchClass(String query) {
        this.query = query;
    }

    public Database.QueryLocator start(Database.BatchableContext cont)
    {
        return Database.getQueryLocator(query);

    }

    public void execute(Database.BatchableContext cont , List<Account> accountList)
    {
        for(Account acc : accountList){
            acc.Description = 'Batchable this time';
            accountsToUpdate.add(acc);
        }

    }

    public void finish(Database.BatchableContext cont)
    {
        update accountsToUpdate;
        System.debug('finish');
    }

}