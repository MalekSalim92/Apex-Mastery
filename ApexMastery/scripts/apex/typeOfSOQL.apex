SELECT Id, Subject,
       TYPEOF What
           WHEN Account THEN Name, Industry
           WHEN Opportunity THEN Name, StageName, Amount
           WHEN Case THEN CaseNumber, Status
           ELSE Name
       END
FROM Task