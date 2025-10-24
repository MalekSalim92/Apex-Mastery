public with sharing class Invoke_Static_Class {

    public void invoiceClass()
    {   
        Static_Class staticClass1 = new Static_Class();
        staticClass1.printStrings();
        
        // DEBUG|THIS IS THE STATIC STRING >>>>> Im a static string
        // DEBUG|THIS IS THE NON STATIC STRING >>>>> Nope , not me

        Static_Class staticClass2 = new Static_Class();
        staticClass2.upldateStringValues('Hey BRUHH');
        staticClass2.printStrings();
        
        // DEBUG|THIS IS THE STATIC STRING >>>>> Hey BRUHH
        // DEBUG|THIS IS THE NON STATIC STRING >>>>> Hey BRUHH

        Static_Class staticClass3 = new Static_Class();
        staticClass3.printStrings();

        // DEBUG|THIS IS THE STATIC STRING >>>>> Hey BRUHH
        // DEBUG|THIS IS THE NON STATIC STRING >>>>> Nope , not me

    }

    

}