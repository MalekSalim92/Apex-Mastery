global with sharing class EmailServiceHandler implements Messaging.InboundEmailHandler {
  global Messaging.InboundEmailResult handleInboundEmail(
    Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope
  ) {
    // email.subject
    // email.plainTextBody / email.htmlBody
    // email.fromAddress
    // email.binaryAttachments
    // email.ccAddresses

    // Do your DML here
    Case c = new Case(
      Subject = email.subject,
      Description = email.plainTextBody
    );
    insert c;

    return new Messaging.InboundEmailResult();
  }
}
