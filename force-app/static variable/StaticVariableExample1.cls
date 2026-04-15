public with sharing class StaticVariableExample1 {

    public static Integer num = 1;
    public static void processVariable(){

        System.debug('num first call : ' + num);
        num += 5;
        printVar1();

    }

    private static void printVar1(){
                System.debug('num second call from same Class : ' + num);
                num +=100;
    }   


}