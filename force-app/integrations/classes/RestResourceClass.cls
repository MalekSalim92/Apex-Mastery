@RestResource(UrlMapping='/Account/*')
global with sharing class RestResourceClass 
{

    @httpGet
    global static List<Account> getAccounts()
    {
        RestRequest request = RestContext.request;
        System.debug(request);
        //String accountName = request.escapeSingleQuotes();
        return [SELECT Id,Name FROM Account LIMIT 10];
    }

    @HttpPost
    global static String insertAccount(Account acc)
    {
        
        insert acc;
        return acc.Id;
    }
}