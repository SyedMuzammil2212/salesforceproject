public class test {
    public static void run(){
        List<Integer> nums = new List<Integer>();
        nums.add(23);
        nums.add(26);
        nums.add(42);
        nums.add(26);
        nums.add(42);
        
        Set<Integer> sets = new Set<Integer>();
        sets.add(23);
        sets.add(26);
        sets.add(42);
        sets.add(26); //ignores
        sets.add(42); // ignores
		sets.add(45);  
        
        System.debug(nums);
        System.debug(sets);
    }
    
    public static void sayHello(){
        System.debug('Hello');
    }
}