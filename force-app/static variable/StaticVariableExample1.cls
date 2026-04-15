public with sharing class StaticVariableExample1 {

    public static Integer num = 1;
    public integer numNotStatic = 3;
    public static void processVariable(){

        System.debug('num first call : ' + num); // 1
        num += 5;
        StaticVariableExample1 ex = new StaticVariableExample1();
        System.debug('num first call NS : ' + ex.numNotStatic); // 3
        ex.numNotStatic += 5;
                System.debug('num after increment NS NS : ' + ex.numNotStatic); // 8

        printVar1();

    }

    private static void printVar1(){
                System.debug('num second call from same Class : ' + num); // 6
                        StaticVariableExample1 ex = new StaticVariableExample1();

                        System.debug('num second call NS : ' + ex.numNotStatic); // 3

                num += 100;
    }   


}