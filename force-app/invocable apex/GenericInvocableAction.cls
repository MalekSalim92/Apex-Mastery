public with sharing class GenericInvocableAction {

    @InvocableMethod ( callout = true Label='Update SOBJECT' iconName='slds:standard:answer_public'  )
    public static void debugLog(List<sObject> sObjects){
        for(sObject obj : sObjects){        
        }
    }

}               