public with sharing class ContinuationClass {
@AuraEnabled(continuation=true cacheable=true)
public static Object startRequest() {
     Continuation con = new Continuation(40);
    con.continuationMethod = 'processResponse';
    
    // Set up the actual HTTP Request
    HttpRequest req = new HttpRequest();
    req.setMethod('GET');
    req.setEndpoint('https://api.external-service.com/data');
    
    // Add the request to the continuation
    con.addHttpRequest(req);
    
    return con;
}
    @AuraEnabled
    public static Object processResponse(List<String> labels, Object state) {
        // Get the response by using the label provided in the parameters
        HttpResponse response = Continuation.getResponse(labels[0]);
        
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return 'Error';
    }
}