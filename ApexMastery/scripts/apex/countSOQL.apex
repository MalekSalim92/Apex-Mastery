List<AggregateResult> result = [SELECT COUNT(Id) FROM Account];
System.debug(result[0].get('expr0'));

List<AggregateResult> result2 = [SELECT COUNT(Id) total FROM Account];
System.debug(result2[0].get('total'));
