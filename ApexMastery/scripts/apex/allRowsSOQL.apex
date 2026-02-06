
ALL ROWS allows you to query both active AND deleted records (records in the Recycle Bin).

❌ //todo Error: "field 'IsDeleted' can not be filtered in a query call"
SELECT Id, Name FROM Account WHERE IsDeleted = true

 ✅ // Works
SELECT Id, Name FROM Account WHERE IsDeleted = true ALL ROWS