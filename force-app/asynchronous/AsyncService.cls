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

    private void scheduleMethod()
    {
        List<Account> accountList = [SELECT Id,Description,SicDesc FROM Account];
        if(!accountList.isEmpty())
        {
            ScheduledClass schedClass = new ScheduledClass(accountList);
            Datetime oneMinuteFromNow = system.now().addMinutes(ONE_MINUTE);
            String cronExp = oneMinuteFromNow.second() + ' ' + oneMinuteFromNow.minute() + ' ' +
                             oneMinuteFromNow.hour() + ' ' + oneMinuteFromNow.day() + ' ' +
                            oneMinuteFromNow.month() + ' ? ' + oneMinuteFromNow.year();
                            
            System.schedule(SCHED_NAME, cronExp, schedClass);
        }
    }

    public void rescheduleMethod()
    {
        List<CronJobDetail> cronJob = [SELECT Id FROM CronJobDetail WHERE Name = :SCHED_NAME LIMIT 1];
        if(!cronJob.isEmpty())
        {
            List<CronTrigger> cronTrigger = [SELECT Id FROM CronTrigger WHERE CronJobDetailId = :cronJob[0].Id LIMIT 1];
            if(!cronTrigger.isEmpty())
            {
                scheduleMethod();
                System.abortJob(cronTrigger[0].Id);
            }
        }

    }
    
}