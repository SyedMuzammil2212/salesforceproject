public with sharing class findEmployee {
    @AuraEnabled(cacheable=true)
    public static boolean checkEmployee(String empname){
        List <Employee__c> emps = [SELECT Name from Employee__c WHERE Name =: empname];
        
        if(emps.isEmpty()){
            System.debug('Employee Not found');
            return false;
                }else{
                    System.debug('Employee found');
                    return true;
                }
    }

}