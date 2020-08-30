trigger ContactTrigger on Contact ( before insert,
                                    before update,
                                    before delete,
                                    after insert,
                                    after update,
                                    after delete,
                                    after undelete) {
    List<ITriggerExtension> triggerHandlers = new List<ITriggerExtension>(
        TriggerExtensionSupport.getTriggerHandlers('Contact')
    );

    RecordUpdaterTrigger updater = new RecordUpdaterTrigger();

    for (ITriggerExtension trig : triggerHandlers) {
        trig.handlerTrigger(Trigger.operationType, Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap,updater);
    }

    updater.updateAccount();

}