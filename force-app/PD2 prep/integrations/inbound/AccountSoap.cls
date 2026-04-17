global with sharing class AccountSoap {

    webservice static String getContactName(String contactId){
// Validation - SOAP will throw an error if the type is wrong, 
        // but checking for nulls/blanks is still good practice.
        if (String.isBlank(contactId)) {
            return 'Error: No ID provided';
        }

        try {
            Contact con = [SELECT Name FROM Contact WHERE Id = :contactId LIMIT 1];
            return con.Name;
        } catch (QueryException e) {
            return 'Error: Contact not found';
        }
    }
}