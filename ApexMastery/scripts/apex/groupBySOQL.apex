List<AggregateResult> result = [SELECT Name , LeadSource COUNT(Id) FROM Lead GROUP BY Name]; //todo FAILS , LEADSOURCE MUST BE GROUPPED 

List<AggregateResult> result2 = [SELECT Name , LeadSource COUNT(Id) FROM Lead GROUP BY Name, LeadSource]; //* SUCCEEDS 
