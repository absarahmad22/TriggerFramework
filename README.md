# TriggerFramework

Clone the Repo In your local System.

Deploy the repo to the Salesforce Sandbox Environment (Sandbox) Using SFDX CLI.

Step 1: Authorize Orgs SFDX force:auth:web:login > Enter Username and Password.
Step 2: Goto to the repo folder location.
Step 3: sfdx force:mdapi:deploy -d .\TriggerHandler -u <username@salesforce.com> -w -1
