public with sharing class OppCalculator_Combined {

    public static void calculateOpp(String userType) {

        if(userType == 'CTO'){
            calculateOppCTO();
        }
        else if(userType == 'Manager'){
            calculateOppManager();
        }

    }
    private static void calculateOppCTO(){
        System.debug('CTO');
    }

    private static void calculateOppManager(){
        System.debug('Manager');
    }
}