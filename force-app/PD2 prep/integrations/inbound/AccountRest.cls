@RestResource(urlMapping='/Account/*')
global with sharing class AccountRest {

    @HttpGet
    global static String getAccountName(){

        RestRequest request = RestContext.request;
        String accId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1); 
        if(String.isBlank(accId)){
            return 'Error';
        }
        Account acc = [SELECT Name FROM Account WHERE Id = :accId LIMIT 1];

        return acc.Name ;
    }



}