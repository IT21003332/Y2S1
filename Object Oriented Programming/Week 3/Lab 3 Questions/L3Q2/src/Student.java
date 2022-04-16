
public class Student {
	
	private String name;
	private int ditno;
	private String address;
	
	
	public Student() {
		name = null;
		ditno = 0;
		address = null;
	}
	public Student(String name, int ditno, String address) {
		this.name = name;
		this.ditno = ditno;
		this.address = address;
	}
	public void display() {
		System.out.println("Name : " + name + "\nDepartmentIT No: " + ditno + "\naddress = " +address);
	}
	
}
