List<AggregateResult> result = [SELECT Name , LeadSource COUNT(Id) FROM Lead GROUP BY Name]; //todo FAILS , LEADSOURCE MUST BE GROUPPED 

List<AggregateResult> result2 = [SELECT Name , LeadSource COUNT(Id) FROM Lead GROUP BY Name, LeadSource]; //* SUCCEEDS 




//todo GROUP BY 

SELECT Status, LeadSource, COUNT(Id) FROM Lead GROUP BY Status, LeadSource

**Result:**

Status    | LeadSource | COUNT
----------|------------|------
Open      | Web        | 2
Open      | Referral   | 1
Converted | Web        | 1
Converted | Referral   | 2

//todo GROUP BY ROLLUP

SELECT Status, LeadSource, COUNT(Id) FROM Lead GROUP BY ROLLUP(Status, LeadSource)

**Result:**

Status    | LeadSource | COUNT | What is this row?
----------|------------|-------|------------------
Open      | Web        | 2     | Detail: Open + Web
Open      | Referral   | 1     | Detail: Open + Referral
Open      | null       | 3     | SUBTOTAL: All Open leads
Converted | Web        | 1     | Detail: Converted + Web
Converted | Referral   | 2     | Detail: Converted + Referral
Converted | null       | 3     | SUBTOTAL: All Converted leads
null      | null       | 6     | GRAND TOTAL: All leads


//todo GROUP BY CUBE

SELECT Status, LeadSource, COUNT(Id) FROM Lead GROUP BY CUBE(Status, LeadSource)

**Result:**

Status    | LeadSource | COUNT | What is this row?
----------|------------|-------|------------------
Open      | Web        | 2     | Detail: Open + Web
Open      | Referral   | 1     | Detail: Open + Referral
Open      | null       | 3     | SUBTOTAL: All Open
Converted | Web        | 1     | Detail: Converted + Web
Converted | Referral   | 2     | Detail: Converted + Referral
Converted | null       | 3     | SUBTOTAL: All Converted
null      | Web        | 3     | SUBTOTAL: All Web (NEW!)
null      | Referral   | 3     | SUBTOTAL: All Referral (NEW!)
null      | null       | 6     | GRAND TOTAL: Everything


//todo GROUPING

SELECT Status, LeadSource, COUNT(Id),GROUPING(Status) grpStatus,GROUPING(LeadSource) grpSource
FROM Lead
GROUP BY ROLLUP(Status, LeadSource)

**Result:**

Status    | LeadSource | COUNT | grpStatus | grpSource | Meaning
----------|------------|-------|-----------|-----------|------------------
Open      | Web        | 2     | 0         | 0         | Real data
Open      | Referral   | 1     | 0         | 0         | Real data
Open      | null       | 3     | 0         | 1         | Status subtotal
Converted | Web        | 1     | 0         | 0         | Real data
Converted | Referral   | 2     | 0         | 0         | Real data
Converted | null       | 3     | 0         | 1         | Status subtotal
null      | null       | 6     | 1         | 1         | Grand total