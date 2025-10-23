public with sharing class AsyncService 
{

    public void callQueueableMethod()
    {

        List<Contact> contacts = [SELECT Id,firstName,lastName,Email FROM Contact];
        if(!contacts.isEmpty())
        {
            QueueableClass QueueClass = new QueueableClass(contacts);
            System.enqueueJob(QueueClass);
        }
    }
    
}