SELECT Id, Name FROM Account
// todo same as 
SELECT Id, Name FROM Account USING SCOPE Everything


SELECT Id, Name FROM Account WHERE OwnerId = :UserInfo.getUserId() 
// todo same as 
SELECT Id, Name FROM Account USING SCOPE Mine


Scope                   Description
---------------------   ---------------------------------------------------------------------
Everything              All records the user can access (default if no scope specified)
Mine                    Records owned by the current user
My_Territory            Records in the user's territory (if territory management is enabled)
My_Team_Territory       Records in the user's and their team's territories
Team                    Records owned by users who report to the current user
Delegated               Records delegated to the current user


//All records I can see
SELECT Id, Name FROM Account USING SCOPE Everything

// Only my records
SELECT Id, Name FROM Account USING SCOPE Mine

// My territory's records
SELECT Id, Name FROM Account USING SCOPE My_Territory

//My team's territory records
SELECT Id, Name FROM Account USING SCOPE My_Team_Territory

//My direct reports' records
SELECT Id, Name FROM Account USING SCOPE Team

//Records delegated to me
SELECT Id, Name FROM Account USING SCOPE Delegated