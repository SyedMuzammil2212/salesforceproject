public with sharing class getEmployeeByName {

    @AuraEnabled(cacheable=true)

    public static Employee__c getEmployee(String empName){

        List<Employee__c> empList = [

            SELECT Id, Name, Email__c
            FROM Employee__c
            WHERE Name = :empName
            LIMIT 1

        ];

        if(empList.isEmpty()){

            return null;

        }

        return empList[0];

    }

}