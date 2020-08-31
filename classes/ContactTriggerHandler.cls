public with sharing class ContactTriggerHandler implements ITriggerExtension {
    public void handlerTrigger( TriggerOperation optype, 
                                List<sObject> newList,
                                List<sObject> oldList,
                                Map<Id,sObject> newMap,
                                Map<Id,sObject> oldMap,
                                RecordUpdater updater){
        /**Rollups the Number of Contact On Account Object */
        Set<Id> accIds = new Set<Id>();
        if (optype == TriggerOperation.AFTER_INSERT  || optype == TriggerOperation.AFTER_UNDELETE || optype == TriggerOperation.AFTER_UPDATE) {
            for (sObject con : newList) {
               if(con.get('AccountId') != null){
                   accIds.add((Id)con.get('AccountId'));
               }
            }
        }

        if (optype == TriggerOperation.AFTER_UPDATE || optype == TriggerOperation.AFTER_DELETE) {
            for (sObject con : oldList) {
                if(con.get('AccountId') != null){
                    accIds.add((Id)con.get('AccountId'));
                }
            }
        }

        if (accIds.isEmpty() == false) {
            AggregateResult[] result = [Select AccountId, Count(Id) NumberOfContacts From Contact where AccountId In :accIds Group By AccountId];
            for (AggregateResult record : result) {
                Account acc = (Account)updater.getRecord((Id)record.get('AccountId'));
                acc.Number_Of_Contacts__c = (Decimal)record.get('NumberOfContacts');    
            }
        }
    }
}