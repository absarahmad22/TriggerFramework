@isTest
public with sharing class ContactTriggerTest {
    @isTest static void test_one(){
        Account account = new Account(
            Name = 'Burlington Textiles Corp of America',
            Phone = '(336) 222-7000',
            Website = 'http://www.burlington.com',
            NumberOfEmployees = 9000,
            Rating = 'Warm',
            AnnualRevenue = 35000000
        );

        INSERT account;

        Contact contact = new Contact(
            Salutation = 'Mr',
            FirstName = 'Jack',
            LastName = 'Rogers',
            AccountId = account.Id,
            MobilePhone = '(336) 222-7000',
            Email = 'jrogers@burlington.com'
        );

        INSERT contact;

        Account accObj = [Select Id,Number_Of_Contacts__c from Account where Id = :account.Id];

        System.assertEquals(1, accObj.Number_Of_Contacts__c);


    }
}
