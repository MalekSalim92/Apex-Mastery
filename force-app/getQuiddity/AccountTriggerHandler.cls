/**
 * Created by malek on 2025-11-26.
 */

public with sharing class AccountTriggerHandler extends TriggerHandler{

    public override void afterUpdate(){

        Request requestInfo = Request.getCurrent();
        System.debug('Quiddity :::: ' + requestInfo.getQuiddity());
    }

}