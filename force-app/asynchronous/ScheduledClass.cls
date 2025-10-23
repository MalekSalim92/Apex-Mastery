public with sharing class ScheduledClass implements Schedulable,Finalizer,Database.AllowsCallouts
{
    private static final Integer ONE_MINUTE = 1;
    private static final String SCHED_NAME = 'SCHEDULED DEMO';
    private static List<Account> accountList;
    public void ScheduledClass(List<Account> accountList){
        this.accountList = accountList;
    }

    public void execute(SchedulableContext context)
    {

    }

    public void execute(FinalizerContext context)
    {

    }
}
