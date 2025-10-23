public with sharing class ScheduledClass implements Schedulable,Finalizer,Database.AllowsCallouts
{
    private List<Account> accountList;

    public void ScheduledClass(List<Account> accountList){
        this.accountList = accountList;
    }

    public void execute(SchedulableContext context)
    {
        for(Account acc : accountList)
        {
            acc.Description = 'Sched';
        }
        update accountList;
    }

    public void execute(FinalizerContext context)
    {
        for(Account acc : accountList)
        {
            acc.SicDesc =  String.valueOf(System.now());
        }
        update accountList;
    }

}
