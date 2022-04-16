
public class MainFile {
	public static void main(String args[]) {
		
		try {
			
			MathOp math = new MathOp();
			math.add(2, 0);
			System.out.println("Division: " + math.divide(2, 0));
		}catch(ArithmeticException e) {
			System.out.println("Not Divisible by zero");
		}
		}
}
