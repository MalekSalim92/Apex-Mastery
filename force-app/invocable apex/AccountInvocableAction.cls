public with sharing class AccountInvocableAction {

    @InvocableMethod(label='Update Account Phone' description='Update phone number of account' category='Record Update')
    public static void updateAccountPhone(List<accountDetails> detailsList){

        List<Account> accountsToUpdate = new List<Account>();
        for(accountDetails accDet : detailsList){
            accountsToUpdate.add(new Account(
                Id = accDet.AccountId,
                Phone = accDet.phoneNumber
            ));


        }

        update accountsToUpdate;
    }

    public class accountDetails{
        @InvocableVariable(required = true)
        public Id accountId;
        @InvocableVariable
        public String phoneNumber;
    }
}