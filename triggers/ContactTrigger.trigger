trigger ContactTrigger on Contact ( before INSERT,before UPDATE,before DELETE,
                                    after  INSERT,after  UPDATE,after  DELETE, after  UNDELETE) {
    List<ITriggerExtension> triggerHandlers = new List<ITriggerExtension>(
        TriggerExtensionSupport.getTriggerHandlers('Contact')
    );

    RecordUpdater updater = new RecordUpdater();

    for (ITriggerExtension trig : triggerHandlers) {
        trig.handlerTrigger(Trigger.operationType, Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap,updater);
    }

    updater.updateRecord('Account');
    
}