public class Demo{
    public static void sayHello(){
  List<Contact> contacts = [SELECT LastName FROM Contact];
        System.debug(contacts);
    }
    
    public static void addAccount(){
        
        Account a = new Account();
        a.Name='facebook';
        a.AnnualRevenue=200000;
        insert a;
        
        Account b = new Account();
        b.Name='google'; 
        b.AnnualRevenue=300000;
        insert b;
        
         Account c = new Account();
        c.Name='samsung'; 
        c.AnnualRevenue=400000;
        insert c;
        
         Account d = new Account();
        d.Name='apple'; 
        d.AnnualRevenue=500000;
        insert d;
        
         Account e = new Account();
        e.Name='microsoft'; 
        e.AnnualRevenue=600000;
        insert e;
    }
    
    public static void updateContact(){
        Contact p2=[SELECT LastName,email from Contact where LastName='Person2' LIMIT 1];
        p2.Email='person2@yahoo.com';
        update p2;
        System.debug(p2);
    }
    
    public static void deleteContact(){
        Contact p2=[SELECT LastName from Contact where LastName='Person2' LIMIT 1];
        delete p2;
    }

    
    
}