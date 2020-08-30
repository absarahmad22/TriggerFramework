public Interface ITriggerExtension {
    void handlerTrigger(TriggerOperation optype,
                        List<SObject> newList,
                        List<SObject> oldList,
                        Map<Id,sObject> newMap,
                        Map<Id,SObject> oldMap,
                        RecordUpdaterTrigger updater);
}