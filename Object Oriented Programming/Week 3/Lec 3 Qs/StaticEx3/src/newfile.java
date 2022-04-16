
public class newfile {
	static int a = 3;
	static int b;
	
	static void meth(int x) {			//methods should be invoked to run, therefore it is not yet running when compiled
		System.out.println("x = " + x);
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		
		
	}
	static {		//static blocks are not methods and initialized right when compiled, therefore info goes to the method 
					//when the calling of the method occurs, all the information works. First to work is static block.	
		System.out.println("Static Block initialized");
		
		b = a * 4;
	}
	public static void main(String args[]) {
		meth(42);
	}
}
