public with sharing class Static_Class 
{
    public static String staticString = 'Im a static string';
    public String nonStaticString = 'Nope , not me';

    public void upldateStringValues(String updatedString)
    {
        staticString = updatedString;
        nonStaticString = updatedString;
    }

    public void printStrings()
    {
        System.debug('THIS IS THE STATIC STRING >>>>> '  + staticString);
        System.debug('THIS IS THE NON STATIC STRING >>>>> ' + nonStaticString);
    }
}