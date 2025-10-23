public with sharing class AsyncService 
{
    private static final Integer ONE_MINUTE = 1;
    private static final String SCHED_NAME = 'SCHEDULED DEMO';

    public void callQueueableMethod()
    {

        List<Contact> contacts = [SELECT Id,firstName,lastName,Email FROM Contact];
        if(!contacts.isEmpty())
        {
            QueueableClass QueueClass = new QueueableClass(contacts);
            System.enqueueJob(QueueClass);
        }
    }

    public void ScheduleMethod()
    {
        List<Account> accountList = [SELECT Id,Description,SicDesc FROM Account];
        if(!accountList.isEmpty())
        {
            ScheduledClass schedClass = new ScheduledClass();
            Datetime oneMinuteFromNow = system.now().addMinutes(ONE_MINUTE);
            String cronExp = oneMinuteFromNow.second() + ' ' + oneMinuteFromNow.minute() + ' ' +
                             oneMinuteFromNow.hour() + ' ' + oneMinuteFromNow.day() + ' ' +
                            oneMinuteFromNow.month() + ' ' + oneMinuteFromNow.year();
            System.schedule(SCHED_NAME, cronExp, schedClass);
        }
    }
    
}