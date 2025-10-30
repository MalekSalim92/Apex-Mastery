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
    request.setEndpoint('callout:' + namedCredential + endpoint);
    request.setMethod(httpMethod);
    if (String.isNotBlank(body)) {
      request.setBody(body);
      request.setHeader('Content-Type', 'application/json');
    }
    Http http = new Http();
    HttpResponse response = http.send(request);
    if (response.getStatusCode() < 200 || response.getStatusCode() >= 300)
      throw new CalloutException(
        'An API error has occured , status : ' +
          response.getStatusCode() +
          ' error : ' +
          response.getBody()
      );
    return response;
  }
}
