public with sharing class exceptionTestService {
    public static void process(String name){

        Account acc = new Account (Name = name);
        try{
            insert acc;
        }
        catch(dmlException de){
            System.debug('The following exception has occurred: ' + de.getMessage());
        }
    }


    public static void processSmarter(String name) {
    // Defensive coding: the code prevents Name from being null before DML
    if (String.isBlank(name)) { return; } 
    
    Account acc = new Account(Name = name);
    try {
        insert acc;
    } catch (DmlException de) {
            System.debug('The following exception has occurred: ' + de.getMessage());

    }
}
}