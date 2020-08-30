public with sharing class TriggerExtensionSupport {
    public static List<ITriggerExtension> getTriggerHandlers(String objectType) {
        List<Dynamic_Trigger__mdt> settings = new List<Dynamic_Trigger__mdt>([
            Select Id,Class_Name__c FROM Dynamic_Trigger__mdt
            Where objectType__c = :objectType AND Active__c = true AND Class_Name__c <> null
            Order By Order__c DESC
        ]);

        Set<ITriggerExtension> result = new Set<ITriggerExtension>(); 

        for (Dynamic_Trigger__mdt sett : settings) {
            System.Type theType = Type.forName(sett.Class_Name__c);
            if (theType == null) {
                theType = Type.forName('',sett.Class_Name__c);
            }
            if (theType != null) {
                Object theObject = theType.newInstance();
                if (theObject instanceof ITriggerExtension ) {
                    result.add((ITriggerExtension)theObject);
                }
            }
        }

        List<ITriggerExtension> resultList = new List<ITriggerExtension>();
        resultList.addAll(result);
        
        return resultList;
    }
}