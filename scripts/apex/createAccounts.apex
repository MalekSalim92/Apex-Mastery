Integer count = 40;
List<Account> acountsToCreate = new List<Account>();
for(Integer i = 0 ; i < 40 ; i++)
{
    acountsToCreate.add(
        new Account(
             Name = 'Account - ' + i
        )
    );

}
insert acountsToCreate;