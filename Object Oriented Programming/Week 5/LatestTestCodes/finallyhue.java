public class finallyhue{
	public static void main(String args[]){
	

	try{
		int a = 0;
		int d = 43 / a;
		
		System.out.println("This will not be printed");
	}catch(NumberFormatException e){
		System.out.println("Exception: " + e);
	}
	catch(ArithmeticException e1){
		System.out.println("Exception: " + e1);
	}
	finally{
		System.out.println("All exceptions are caught");
	}
}
}