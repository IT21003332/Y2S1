public class allinonecatcher{
	public static void main(String args[]){
		
	try{
		int i = 0;
		int d = 42 / i;

		System.out.println("Value: " + d);
		System.out.println("This line will not be printed");
	}catch(ArithmeticException | NumberFormatException e){	
			System.out.println("Exception: " + e);
		}
	}
}