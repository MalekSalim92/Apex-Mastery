Integer count = 1000;
List<Account> acountsToCreate = new List<Account>();
for(Integer i = 50 ; i < count ; i++)
{
    acountsToCreate.add(
        new Account(
             Name = 'Account - ' + i
        )
    );

}
insert acountsToCreate;