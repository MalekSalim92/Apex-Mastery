trigger AccountChangeEvent_Trigger on AccountChangeEvent (after insert) {
    System.debug('::::: AccountChangeEvent_Trigger STARTED ::::: ');

    new AccountChangeEvent_Handler().run();
}