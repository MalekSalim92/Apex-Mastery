Integer count = 40;
List<Contact> contactsToCreate = new List<Contact>();
for(Integer i = 0 ; i < 40 ; i++)
{
    contactsToCreate.add(
        new Contact(
            FirstName = 'Hello',
            LastName = 'world - ' + i
        )
    );

}
insert contactsToCreate;