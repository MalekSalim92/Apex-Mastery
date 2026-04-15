@isTest
private class ExceptionTestService_Test{
    @isTest
    private static void processTestingGood(){
        exceptionTestService.process('GLL');
    }
    @isTest
    private static void processTestBad(){
        try {
             exceptionTestService.process(null);
            
         } catch (DmlException e) {
             Assert.isTrue(e.getMessage().contains('The following exception has occurred'), 
                'Expected our custom message but got: ' + e.getMessage());
        }   
        }
    @isTest

            private static void processTestSmarterGoood(){
        try {
             exceptionTestService.processSmarter('Malek');
        
         } catch (DmlException e) {
             Assert.isTrue(e.getMessage().contains('The following exception has occurred'), 
                'Expected our custom message but got: ' + e.getMessage());
        }   
        }
    @isTest

                    private static void processTestSmarterBad(){
        try {
             exceptionTestService.processSmarter('HHEEHHEE'); /// DOESNT REACH 
            
         } catch (DmlException e) {
             Assert.isTrue(e.getMessage().contains('The following exception has occurred'), 
                'Expected our custom message but got: ' + e.getMessage());
        }   
        }


}