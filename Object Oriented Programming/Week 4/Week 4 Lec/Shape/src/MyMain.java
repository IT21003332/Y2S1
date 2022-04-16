
public class MyMain {
	public static void main(String args[]) {
		
		//Shape  ob1 = new Shape(); //You cannot instantiate Shape 
						//because of Abstraction
		
		Shape ob1 = new Rectangle(45,65);
		
		System.out.println("Area: " + ob1.getArea());
	}
}
