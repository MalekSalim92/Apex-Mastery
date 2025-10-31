public with sharing class HttpClient {
  public String namedCredential;

  public HttpClient(String namedCredential) {
    this.namedCredential = namedCredential;
  }

  public HttpResponse get(String endpoint) {
    return buildHttpRequest('GET', endpoint, null);
  }

  public HttpResponse post(String endpoint, String body) {
    return buildHttpRequest('Post', endpoint, body);
  }

  private httpResponse buildHttpRequest(
    String httpMethod,
    String endpoint,
    String body
  ) {
    HttpRequest request = new HttpRequest();
    String fullEndpoint = 'callout:' + namedCredential + endpoint;

    request.setEndpoint(fullEndpoint);
    request.setMethod(httpMethod);
    if (String.isNotBlank(body)) {
      request.setBody(body);
      request.setHeader('Content-Type', 'application/json');
    }

    Http http = new Http();
    HttpResponse response;

    try {
      response = http.send(request);

      if (response.getStatusCode() < 200 || response.getStatusCode() >= 300) {
        throw new CalloutException(response.getBody());
      }

      return response;
    } catch (CalloutException e) {
      if (response != null) {
        System.debug(
          LoggingLevel.ERROR,
          'Response Status Code: ' + response.getStatusCode()
        );
        System.debug(
          LoggingLevel.ERROR,
          'Response Body: ' + response.getBody()
        );
      }
      System.debug(LoggingLevel.ERROR, '========================');

      throw e; // Re-throw the original exception
    }
  }
}
