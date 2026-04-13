public class SharingRecalculation implements Database.batchable<sObject> {

    public Database.queryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id FROM Apex_Sharing_Object__c]);
    }

    public void execute(Database.BatchableContext bc , List<sObject> scope){
        List<Apex_Sharing_Object__c> records = (List<Apex_Sharing_Object__c>) scope;
        List<Apex_Sharing_Object__Share> newShares = new List<Apex_Sharing_Object__Share>();

        delete [SELECT Id FROM Apex_Sharing_Object__Share WHERE ParentId IN : records AND RowCause = 'Manual'];

        for(Apex_Sharing_Object__c record : records){
            Apex_Sharing_Object__Share share = new Apex_Sharing_Object__Share();
            share.ParentId = record.Id;
            share.AccessLevel = 'Edit';
            share.UserOrGroupId = UserInfo.getUserId();
            share.RowCause = Schema.Apex_Sharing_Object__Share.RowCause.Manual;
            newShares.add(share);
        }
        insert newShares;
    }

    public void finish(Database.BatchableContext bc){

    }
}