public class trycatch{
	public static void main(String args[]){
		
		try{
			int d = 0;
			int a = 42 / d;
			System.out.println("This will not be printed"); 
		//because after the line of error, nothing in the try block works. 
		}catch(NumberFormatException e){
			System.out.println("Exception: " + e);
			System.out.println("Invalid Number Conversion");
		}catch(ArithmeticException e1){
			System.out.println("Exception: " + e1);
			System.out.println("Data type and value cannot be divided by zero"); 
		}

		//having more than one catch ensures which will be considered first 
	}
}