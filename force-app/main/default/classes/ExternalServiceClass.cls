public with sharing class ExternalServiceClass {
  public String method;
  public String tableId;
  public HttpResponse response;
  public ExternalServiceClass(String token, String tableId) {
    this.method = method;
    this.tableId = tableId;
  }
  public ExternalServiceClass(HttpResponse response) {
    this.response = response;
  }

  public HttpResponse callApi() {
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'callout:Airtable_Named_Credential' +
        '/v0/' +
        Constants.AIRTABLE_BASEID +
        '/' +
        this.tableId
    );
    request.setMethod(this.method);
    System.debug('REQUEST :::: ' + request);
    Http http = new Http();
    return http.send(request);
  }

  public Boolean isSuccessStatus() {
    if (response.getStatusCode() < 200 || response.getStatusCode() >= 300)
      throw new CalloutException('Error API');
    return true;
  }
}
