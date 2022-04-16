
public class Test {
	public static void main(String args[]) {
		
		Student st1 = new Student();
		
		st1.setName("Devindu");
		st1.setDitNo(456);
		st1.setAddress("CMB");
		
		String name = st1.getName();
		int ditNo = st1.getDitNo();
		String add = st1.getAddress();
		System.out.println("Name: " + name + "\nDitNo: " + ditNo + "\nAddress: " + add);
		
		
	}
}
