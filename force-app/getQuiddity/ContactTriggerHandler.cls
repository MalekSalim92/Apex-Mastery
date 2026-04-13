public with sharing class ContactTriggerHandler {

    public static void afterInsert(List<Contact> contacts){
        
        Request reqInfo = Request.getCurrent();
        System.debug('starting context : ' + reqInfo.getQuiddity());
    }

    @future
    public static void insertContactFuture(){
        Contact con = new Contact(
    LastName = 'Future',
    AccountId = '001Ei00001wdoGHIAY'
);

insert con;
    }

    public static void insertContact(){
        Contact con = new Contact(
    LastName = 'DIRECT',
    AccountId = '001Ei00001wdoGHIAY'
);

insert con;
    }
}