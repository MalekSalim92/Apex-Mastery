public with sharing class AccountChangeEvent_Handler extends TriggerHandler 
{
    public override void afterInsert()
    {
        AsyncService asyncClass = new AsyncService();
        asyncClass.changeDataCapture(trigger.new);
    }
}