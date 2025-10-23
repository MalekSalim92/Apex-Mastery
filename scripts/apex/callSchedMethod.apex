Integer ONE_MINUTE = 1;
String SCHED_NAME = 'SCHEDULED DEMO';

List<Account> accountList = [SELECT Id,Description,SicDesc FROM Account];

ScheduledClass schedClass = new ScheduledClass(accountList);
Datetime oneMinuteFromNow = system.now().addMinutes(ONE_MINUTE);
String cronExp = oneMinuteFromNow.second() + ' ' + oneMinuteFromNow.minute() + ' ' +
                 oneMinuteFromNow.hour() + ' ' + oneMinuteFromNow.day() + ' ' +
                oneMinuteFromNow.month() + ' ? ' + oneMinuteFromNow.year();
                
System.schedule(SCHED_NAME, cronExp, schedClass);