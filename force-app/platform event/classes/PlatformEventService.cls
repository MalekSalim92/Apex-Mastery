public with sharing class PlatformEventService implements EventBus.EventPublishFailureCallback, EventBus.EventPublishSuccessCallback {

    public static void publishEvent(){
        List<Account> accounts = [SELECT Id,Name FROM Account LIMIT 1];
        if(!accounts.isEmpty()){
            Account acc = accounts[0];
            List<AccountPe__e> events = new List<AccountPe__e>();
            AccountPe__e event = new AccountPe__e();
            event.Name__c = 'a';
            events.add(event);
        List<Database.SaveResult> results = EventBus.publish(events);

        for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                System.debug('Successfully published event.');
            } else {
                for(Database.Error err : sr.getErrors()) {
                    // This is where your "String too long" error is likely hiding
                    System.debug('Error: ' + err.getMessage());
                }
            }
}        }
    }

    public void onSuccess(EventBus.SuccessResult result){
        System.debug('Event Succeeded: ' + result.getEventUuids());
 
    }

    public void onFailure(EventBus.FailureResult result) {
    System.debug('Event Failed: ' + result.getEventUuids());
}
    

/* 
    An external app can use any Salesforce API to publish event messages, such asSOAP API,REST API, Bulk API, or Pub/Sub API.
    For example, to publish a platform event message for AccountPe__e using the REST API, a POST request can be sent to the following endpoint:
    /services/data/v48.0/sobjects/AccountPe__e/
*/
}