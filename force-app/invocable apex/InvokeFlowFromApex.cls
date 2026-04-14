public with sharing class InvokeFlowFromApex {

    public static void invokeFlow(){
        Map<String,Object> params = new Map<String,Object>();
        params.put('number',20);
        Flow.Interview.assing_age flow = new Flow.Interview.assing_age(params);
        flow.start();
        String textValue = (String) flow.getVariableValue('textVariable');

        System.debug('Text from FLOW : ' + textValue);
    }

    public static void dynamicFlowInvoke(String flowName, Map<String,Object> params){
        Flow.Interview flow = Flow.Interview.createInterview('',flowName,params);
        flow.start();
        String textValue = (String) flow.getVariableValue('textVariable');
        System.debug('Text from FLOW : ' + textValue);

    }
}