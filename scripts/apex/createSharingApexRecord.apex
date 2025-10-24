Apex_Sharing_Object__c sharingRecord = new Apex_Sharing_Object__c(
    Name = 'Sharing N: ' + System.now()
);
insert sharingRecord;