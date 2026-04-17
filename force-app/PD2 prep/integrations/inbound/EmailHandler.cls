global without sharing class EmailHandler implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env){

        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        try {
            // Log incoming data to verify the service is reached
            System.debug('Subject: ' + email.subject);
            
            Account acc = new Account(
                Name = 'Email Test: ' + (email.subject != null ? email.subject : 'No Subject'),
                Description = email.plainTextBody
            );
            
            insert acc;
            
            // Explicitly tell Salesforce it worked
            result.success = true;
            
        } catch (Exception e) {
            // This will show up in the Debug Logs of the Context User
            System.debug('ERROR CREATING ACCOUNT: ' + e.getMessage());
            
            result.success = false;
            result.message = e.getMessage();
        }
        
        return result;
    }
}