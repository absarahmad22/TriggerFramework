public with sharing class RecordUpdater {
    Map<String,Map<Id,sObject>> recordsToUpdate = new Map<String,Map<Id,sObject>>();

    public sObject getRecord(Id recordId){
        String objectName = recordId.getSObjectType().getDescribe().getName();
        if (!recordsToUpdate.containsKey(objectName)) {
            recordsToUpdate.put(objectName,new Map<Id,SObject>());
        }
        Map<Id, sObject> recordMap = recordsToUpdate.get(objectName);
        SObject targetRecord = recordMap.get(recordId);
        if(targetRecord == null){
            targetRecord  = recordId.getSobjectType().newSObject(recordId);
            recordMap.put(recordId,targetRecord);
        }
        return targetRecord;
    }

    public void updateRecord(String objectApiName){
        if (recordsToUpdate.get(objectApiName) !=null && recordsToUpdate.get(objectApiName).values().size() > 0) {
            UPDATE recordsToUpdate.get(objectApiName).values();
        }
    }

    public void updateRecord(){
        for (Map<Id,sObject> records : recordsToUpdate.values()) {
            if(!records.values().isEmpty()){
                UPDATE records.values();
            }
        }
    }
}
