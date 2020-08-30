public with sharing class RecordUpdaterTrigger {

    Map<Id, Lead> leadsToUpdate = new Map<Id, Lead>();
    Map<Id, Contact> contactToUpdate = new Map<Id, Contact>();
    Map<Id, Account> accountToUpdate = new Map<Id, Account>();
    Map<Id, Opportunity> opportunityToUpdate = new Map<Id, Opportunity>();

    public Lead getLead(Id leadId) {
        Lead targetLead = leadsToUpdate.get(leadId);
        if (targetLead == null) {
            targetLead = new Lead(Id = leadId);
            leadsToUpdate.put(leadId,targetLead);
        }
        return targetLead;
    }

    public void updateLead(){
        if (!leadsToUpdate.isEmpty()) {
            Update leadsToUpdate.values();
        }
    }


    public Contact getContact(Id conId) {
        Contact targetContact = contactToUpdate.get(conId);
        if (targetContact == null) {
            targetContact = new Contact(Id = conId);
            contactToUpdate.put(conId,targetContact);
        }
        return targetContact;
    }

    public void updateContact(){
        if (!contactToUpdate.isEmpty()) {
            Update contactToUpdate.values();
        }
    }


    public Account getAccount(Id accId) {
        Account targetAccount = accountToUpdate.get(accId);
        if (targetAccount == null) {
            targetAccount = new Account(Id = accId);
            accountToUpdate.put(accId,targetAccount);
        }
        return targetAccount;
    }

    public void updateAccount(){
        if (!accountToUpdate.isEmpty()) {
            Update accountToUpdate.values();
        }
    }


    public Opportunity getOpportunity(Id oppId) {
        Opportunity targetOpportunity = opportunityToUpdate.get(oppId);
        if (targetOpportunity == null) {
            targetOpportunity = new Opportunity(Id = oppId);
            opportunityToUpdate.put(oppId,targetOpportunity);
        }
        return targetOpportunity;
    }

    public void updateOpportunity(){
        if (!opportunityToUpdate.isEmpty()) {
            Update opportunityToUpdate.values();
        }
    }
}