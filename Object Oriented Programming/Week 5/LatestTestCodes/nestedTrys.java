public class nestedTrys{
	public static void main(String args[]){
		
		try{
			int d = 0;
			int a = 43 / d;
			
			try{
				String value = "a456";
				int b;
				
				b = Integer.parseInt(value);
				System.out.println(b);
			}catch(NumberFormatException e){
				System.out.println("Exception: " + e);
			}
		}
		catch(ArithmeticException e1){
			System.out.println("Exception : " + e1);
		}
	}
} 
			