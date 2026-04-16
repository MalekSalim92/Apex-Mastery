public with sharing class savepointService {
    public static void savepointProcess(){
        Account a = [SELECT Id FROM Account LIMIT 1];

        Savepoint sp0 = Database.setSavepoint();
        Contact con = new Contact(LastName = 'XID', AccountId = a.Id);
        insert con;

        Savepoint sp1 = Database.setSavepoint();

        con.firstName = 'Premium';
        update con;

        Savepoint sp2 = Database.setSavepoint();

        con.Title = 'Hot';
        update con;

        Database.rollback(sp0);

        System.debug(con);  // Contact:{LastName=XID, AccountId=001Ei00001vDdFuIAK, Id=003Ei00001vPP1uIAG, FirstName=Premium, Title=Hot}

        //Database.rollback(sp2); // error because we reverted to sp1 ,
    }
}