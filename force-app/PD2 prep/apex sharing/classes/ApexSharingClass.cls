public with sharing class ApexSharingClass {

    public void shareCustomObject()
    {
        List<Apex_Sharing_Object__c> recordList = [SELECT Id FROM Apex_Sharing_Object__c LIMIT 1];
        if(!recordList.isEmpty())
        {
            Apex_Sharing_Object__Share objShare = new Apex_Sharing_Object__Share();
            objShare.ParentId = recordList[0].Id; 
            objShare.AccessLevel = 'Edit';
            objShare.UserOrGroupId = UserInfo.getUserId();
            objShare.RowCause = Constants.APPROVAL_ROW_CAUSE;
            System.debug(recordList[0].Id);
            insert objShare;
        }
    }
    
    public void shareStandardObject()
    {
        List<Account> accountList = [SELECT Id FROM Account LIMIT 1];
        if(!accountList.isEmpty())
        {
            AccountShare accShare = new AccountShare();
            accShare.AccountId = accountList[0].Id;
            accShare.AccountAccessLevel = 'Edit';
            accShare.OpportunityAccessLevel = 'Edit';
            accShare.UserOrGroupId = UserInfo.getUserId();
            System.debug(accountList[0].Id);
            insert accShare;
        }
    }

    

}