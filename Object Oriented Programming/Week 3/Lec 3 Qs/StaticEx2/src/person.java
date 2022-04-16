
public class person {
	
	private String name;
	private int age;
	private double Salary;
	
	private static String batchId;
	
	static public String getID() {
		return batchId;
	}
	
	static public void setID(String batchinfo){
		batchId = batchinfo;
	}
	
	static void show() {
		
		 // name = YOU CANNOT DO THIS BECAUSE THIS ATTRIBUTE IS A NON STATIC ATTRIBUTE 
		// TO ACCESS THE NAME YOU NEED TO CREATE AN OBJECT INSIDE THE STATIC METHOD 
		
		//therefore
		person person1 = new person();
		person1.name = "Devindu"; 
	}
}
