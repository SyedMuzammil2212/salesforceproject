public with sharing class assetsLWC {
    
    @AuraEnabled(cacheable=true)
    public static Map<String,Integer> getAssetsFrequency(){
        Map<String,Integer> data= new  Map<String,Integer>();
        
        Integer totalAssets = [Select Count() from TalentAsset__c];
        
        Integer assignedAssets=[Select Count() from TalentAsset__c where isAssigned__c = true];
        
        Integer unassignedAssets=[Select Count() from TalentAsset__c where isAssigned__c = false];
        
        data.put('totalAssets',totalAssets);
        
        data.put('assignedAssets',assignedAssets);
        
        data.put('unassignedAssets',unassignedAssets);
        
        System.debug(data);
        
        return data;
    }

}