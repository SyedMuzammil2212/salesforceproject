public class assetapp {
    public static void addEmployee(
        String nam
    ){
        Employee__c a = new Employee__c();
        a.Name=nam;
        Insert a;
    }
    public static void addNewAsset(
        String AssetName,
        String AssetType,
        String AssetStatus
    ){
        TalentAsset__c a = new TalentAsset__C();
        a.Name=AssetName;
        a.AssetType__c=AssetType;
        a.AssetStatus__c=AssetStatus;
        insert a;
        
    }
    
    public static void getAllEmployees(){
        List<Employee__c> emps = [SELECT id,Name from Employee__c];
        for(Employee__c e:emps){
            System.debug(e);
        }
    }

public static void getAllAssets(){
        List<TalentAsset__c> emps = [SELECT id,Name from TalentAsset__c];
        for(TalentAsset__c e:emps){
            System.debug(e);
        }
    }
    
    public static void assignAsset(Id assetId,Id employeeId){
        
           // Check Asset exists
        List<TalentAsset__c> a=[SELECT Id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from TalentAsset__c WHERE Id=:assetId];
        if(a.isEmpty()){
            System.debug('Asset not found');
            return;
        }else{
            System.debug('asset exists');
        }
        
        // Check employee exists
        List<Employee__c> b=[SELECT Id,Name from Employee__c WHERE Id=:employeeId];
        if(b.isEmpty()){
            System.debug('Employee not found');
            return;
        }else{
            System.debug('Employee exists');
        }
        
        TalentAsset__c ab=a[0];
        // To Check if it is assigned or not
        if(ab.isAssigned__c == true){
            System.debug('Asset already assigned');
            return;
        }
        else{
            System.debug('Asset not assigned');
        }
        // Check if its broken or in services
        if(ab.AssetStatus__c=='Broken' || ab.AssetStatus__c=='Service' ){
            System.debug('Asset not assiganble');
            return;
        }
        
        //Assign the asset to employee
        
        ab.EmployeeName__c=employeeId;
        ab.isAssigned__c=true;
        
        update ab;
        
        System.debug('The Asset' + ab.Name + 'is assigned to ' + b[0].Name);
 
    }
    
    public static void unassignAsset(Id assetId){
             // Check Asset exists
        List<TalentAsset__c> a=[SELECT Id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from TalentAsset__c WHERE Id=:assetId];
        if(a.isEmpty()){
            System.debug('Asset not found');
            return;
        }else{
            System.debug('asset exists');
        }
        // Check if Asset is already unassigned
        if(a[0].isAssigned__c == false){
            System.debug('Asset was already unassiged');
            return;
        }
        
        a[0].isAssigned__c = false;
        a[0].EmployeeName__c=null;
        
        update a[0];
        
        System.debug('Asset unassigned');
        
    }
    public static void getAvailableAsset(){
         List<TalentAsset__c> a=[SELECT Id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from TalentAsset__c WHERE isAssigned__c=false and AssetStatus__c!='Broken'];
			System.debug(a);
    }
    public static void getEmployeeAsset(id employeeId){
			List<TalentAsset__c> a=[SELECT Id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from TalentAsset__c WHERE EmployeeName__c=:employeeId];
			System.debug(a);
    }
    public static void markAssetBroken(id assetId){
    		List<TalentAsset__c> a=[SELECT Id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from TalentAsset__c WHERE id=:assetId];
			a[0].AssetStatus__c='Broken';
        	Update a[0];
    }
    public static void deleteAsset(id assetId){
     		List<TalentAsset__c> a=[SELECT Id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from TalentAsset__c WHERE id=:assetId];
       		Delete a;
    }
    
  

}