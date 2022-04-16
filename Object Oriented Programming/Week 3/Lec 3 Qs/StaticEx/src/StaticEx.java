
public class StaticEx {
	static int no = 10;
	static {
		System.out.println("Static Block");
		StaticMethod();
		System.out.println("Int No: " + no); // If the int isnt static we cannot use this int 
		
	}		//Static block is always the first to work 
			//it will only initialize one time 
	{
		System.out.println("Block");
	}
	
	public StaticEx() {
		System.out.println("StaticEx() constructor");
	}
	static void StaticMethod() {
		System.out.println("Static Method");
	}
	
	public static void main(String args[]) {
		StaticEx staticexe = new StaticEx();
		StaticEx static2 = new StaticEx();
		staticexe.StaticMethod();
	}
}
