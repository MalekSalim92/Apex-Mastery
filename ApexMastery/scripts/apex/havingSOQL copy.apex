SELECT Status, LeadSource, COUNT(Id)
FROM Lead
GROUP BY Status, LeadSource
HAVING COUNT(Id) > 1


**Result:**

Status    | LeadSource | COUNT
----------|------------|------
Open      | Web        | 2
Converted | Referral   | 2