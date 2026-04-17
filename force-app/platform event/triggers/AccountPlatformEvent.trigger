trigger AccountPlatformEvent on AccountPe__e (after insert) {
    for(AccountPe__e acc : trigger.New){
        system.debug(acc.Name__c);
    }

}