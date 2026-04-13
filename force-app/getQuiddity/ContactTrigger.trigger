trigger ContactTrigger on Contact (after insert) {
    ContactTriggerHandler.afterInsert(trigger.new);
    }