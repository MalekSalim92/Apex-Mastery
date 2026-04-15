public with sharing class staticVariableExampleCaller {
    public static void callStat(){
        StaticVariableExample1.processVariable();
        Integer numero = StaticVariableExample1.num;
        System.debug('----------NUMBER-------------- ' + numero); //106
    }    
}