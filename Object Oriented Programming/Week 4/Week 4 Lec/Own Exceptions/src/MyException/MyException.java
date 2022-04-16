package MyException;

class InvalidRangeException extends Exception{
	
	public InvalidRangeException(String msg) {
		super(msg);
	}
}

class MyException{
	public static void main(String args[]) {
		
		int x = 5; 
		int y = 1000;
		
		try {
			float z = (float)x / (float)y;
			
			if(z < 0.01) {
				throw new InvalidRangeException("java.math.Arithmetic Invalid range or threshold initiated");
			}
			System.out.println("Value of Z: " + z);
		}catch(InvalidRangeException e) {
			System.out.println(e);
		}finally {
			System.out.println("Finally Remains a constant");
		}
	}
}


